-- AUTHOR:	 BALA SUNDARALINGAM
-- DATE:	 31/03/22
-- TASK:	 MOVIELENS DATABSE PROBLEMS

USE movielens;

-- QUESTION 1: List the titles and release dates of movies released between 1983-1993 in reverse chronological order.
SELECT title, release_date FROM movies WHERE release_date BETWEEN '1983-01-01' AND '1993-01-01' ORDER BY release_date ASC;


-- QUESTION 2: Without using LIMIT, list the titles of the movies with the lowest average rating. 
SELECT title 
FROM movies m 
JOIN ratings r ON m.id = r.id WHERE r.rating = '1';


-- QUESTION 3: List the unique records for Sci-Fi movies where male 24 year old students have given 5 - star ratings.
SELECT users.id, genres.name, users.age, users.gender, ratings.rating
FROM genres_movies
JOIN movies ON genres_movies.movie_id = movies.id
JOIN genres ON genres_movies.genre_id = genres.id
JOIN ratings ON movies.id = ratings.movie_id
JOIN users ON ratings.user_id = users.id
WHERE ratings.rating = 5 AND
users.gender = 'M'
AND genres.name = 'Sci-Fi'
AND users.age = 24
group by users.id;


-- QUESTION 4: List the unique titles of each of the movies released on the most popular release day. 
-- SELECT title, release_date
-- FROM movies
-- WHERE release_date = (SELECT release_date FROM movies GROUP BY release_date;

-- COUNT(release_date) 
-- FROM Movies
-- group by release_date
-- order by COUNT(release_date) desc);


-- QUESTION 5: Find the total number of movies in each genre, list the results in ascending numeric order. 
SELECT genres.name, count(movies.title) AS NumberofMovies
FROM genres_movies
JOIN movies ON genres_movies.movie_id = movies.id
JOIN genres ON genres_movies.genre_id = genres.id
group by genres.name;