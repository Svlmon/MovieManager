# Plateforme de Musique sur AWS

## Description du Projet

Ce projet consiste à déployer une plateforme de musique en ligne en utilisant les services cloud d'Amazon Web Services (AWS). L'application permet aux utilisateurs de s'inscrire, se connecter, et accéder à une bibliothèque musicale. Les fichiers multimédias sont stockés sur AWS S3, tandis que les fonctionnalités techniques sont gérées via des fonctions Lambda et une API REST construite avec API Gateway. Le stockage des données est géré par DynamoDB.

## Objectifs du Projet

L'objectif principal est de créer une application web scalable et performante en tirant parti des services d'AWS. Ce projet a été conçu dans le cadre du module "Le Cloud et ses services" de notre formation. Il met en place l'utilisation et la configuration de plusieurs services AWS afin de répondre à un cas d'usage qui puisse être réel, tout en assurant une gestion optimisée des ressources grâce à Terraform.

### Principales fonctionnalités
- **Inscription et Connexion des Utilisateurs** : Amazon Cognito
- **Stockage des Fichiers Multimédias** : Amazon S3 Bucket pour héberger les fichiers musicaux
- **API REST** : API Gateway et supportée par des fonctions Lambda
- **Gestion des Données** : DynamoDB pour un stockage des informations relatives aux utilisateurs et aux morceaux de musique
- **Notifications** : Amazon SNS pour alerter les utilisateurs de nouveaux ajouts ou événements

## Architecture

L'architecture de l'application est déployée et gérée à l'aide de Terraform, ce qui permet de garantir une infrastructure versionné et reproductible à grande échelle facilement. Voici les principaux composants déployés avec Terraform :

- **Amazon S3** : Stockage des fichiers musicaux.
- **Amazon Cognito** : Gestion des utilisateurs et de l'authentification.
- **API Gateway** : Interface API RESTful pour l'interaction avec l'application.
- **AWS Lambda** : Exécution du code côté serveur pour répondre aux requêtes API.
- **DynamoDB** : Base de données NoSQL pour le stockage des données.
- **Amazon SNS** : Service de notifications.

## Intérêt du Projet

Ce projet nous a permis de renforcer nos compétences sur plusieurs aspects cruciaux du développement d'applications cloud et l'utilisation de ces services :

- **Approfondissement des Compétences sur les Services AWS** : Le projet nous  a formé de manière approfondie à l'utilisation des services AWS, en exploitant leur puissance et leur flexibilité pour le développement d'applications cloud modernes.

- **Maîtrise de l'Infrastructure as Code (IaC)** : Grâce à Terraform, nous avons appris à définir et gérer une infrastructure cloud de manière automatisée et versionnée, ce qui est essentiel pour le déploiement à grande échelle et la maintenance efficace d'applications complexes.


- **Enjeux de Scalabilité et Sécurité** : En utilisant AWS, nous avons compris les enjeux liés à la scalabilité et à la sécurité des applications, en créant une infrastructure capable de supporter un nombre croissant d'utilisateurs tout en maintenant des standards élevés de sécurité et sans négliger les performances.

## Pré-requis

Avant de commencer, il est nécessaire d'avoir installé :
- **Terraform** : Pour la gestion de l'infrastructure.
- **Un compte AWS** : Pour déployer les services requis.

## Instructions de Déploiement

1. **Cloner le dépôt** :

   ```bash
   git clone https://github.com/Svlmon/MovieManager.git
   ```
2. **Initialiser Terraform et déployer l'infrastructure** :

    ```bash
    terraform init
    terraform plan
    terraform apply
    ```

## Réalisateurs

Ce projet a été réalisé par deux étudiants en Master M1IL à l'IPI Blagnac du Campus IGS pour le module "Le cloud et ses services" :

- Julien DEVIENNE-OUSMER
- Titouan Foras

## Remerciements

Nous tenons à exprimer nos remerciements à notre enseignant, Alex FAIVRE, pour sa formation et ses conseils tout au long de ce module. Son expertise et surtout sa passion nous ont aidés à acquérir les compétences nécessaires pour mener à bien ce projet. Merci pour votre disponibilité et votre engagement à faire de ce cours un apprentissage technique. :rocket: