provider "aws" {
  region = "eu-west-1" # Par exemple, utilise la région qui te convient.
}

terraform {
  backend "local" {
    path = "terraform.tfstate"
  }
}

# Déclaration du rôle IAM pour Lambda
resource "aws_iam_role" "lambda_exec_role" {
  name = "lambda_exec_role"

  assume_role_policy = jsonencode({
    Version = "2012-10-17",
    Statement = [
      {
        Action = "sts:AssumeRole",
        Effect = "Allow",
        Principal = {
          Service = "lambda.amazonaws.com"
        }
      }
    ]
  })
}

resource "aws_iam_role_policy_attachment" "lambda_policy" {
  role       = aws_iam_role.lambda_exec_role.name
  policy_arn = "arn:aws:iam::aws:policy/service-role/AWSLambdaBasicExecutionRole"
}

# Autoriser l'API Gateway à invoquer la fonction Lambda
resource "aws_lambda_permission" "api_gateway_permission" {
  statement_id  = "AllowAPIGatewayInvoke"
  action        = "lambda:InvokeFunction"
  function_name = aws_lambda_function.get_movies_function.function_name
  principal     = "apigateway.amazonaws.com"
}

# Déclaration de la fonction Lambda
resource "aws_lambda_function" "get_movies_function" {
  function_name = "GetMoviesFunction"
  runtime       = "nodejs18.x"
  handler       = "index.handler"
  role          = aws_iam_role.lambda_exec_role.arn
  filename      = "lambda.zip"
}

# Déclaration de l'API Gateway
resource "aws_api_gateway_rest_api" "movie_api" {
  name        = "MovieManagerAPI"
  description = "API for managing movies"
}

resource "aws_api_gateway_resource" "movies_resource" {
  rest_api_id = aws_api_gateway_rest_api.movie_api.id
  parent_id   = aws_api_gateway_rest_api.movie_api.root_resource_id
  path_part   = "movies"
}

resource "aws_api_gateway_method" "get_movies" {
  rest_api_id   = aws_api_gateway_rest_api.movie_api.id
  resource_id   = aws_api_gateway_resource.movies_resource.id
  http_method   = "GET"
  authorization = "NONE"
}

resource "aws_api_gateway_integration" "lambda_integration" {
  rest_api_id             = aws_api_gateway_rest_api.movie_api.id
  resource_id             = aws_api_gateway_resource.movies_resource.id
  http_method             = aws_api_gateway_method.get_movies.http_method
  integration_http_method = "POST"
  type                    = "AWS_PROXY"
  uri                     = aws_lambda_function.get_movies_function.invoke_arn
}

output "api_url" {
  value = aws_api_gateway_rest_api.movie_api.execution_arn
}
