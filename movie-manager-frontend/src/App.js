import React, { useEffect, useState } from 'react';

function App() {
    const [movies, setMovies] = useState([]);

    useEffect(() => {
        fetch('https://arn:aws:execute-api:eu-west-1:637423468722:6nrla451t4/movies') 
            .then(response => response.json())
            .then(data => setMovies(data));
    }, []);

    return (
        <div className="App">
            <h1>Movie Manager</h1>
            <ul>
                {movies.map(movie => (
                    <li key={movie.MovieID}>{movie.Title}</li>
                ))}
            </ul>
        </div>
    );
}

export default App;
