-- AUTHOR:	 BALA SUNDARALINGAM
-- DATE:	 31/03/22
-- TASK:	 SAKILA DATABSE PROBLEMS

USE Sakila;

-- QUESTION 1: List all Actors.
SELECT first_name, last_name FROM actor;		-- Lists First name and Last name of all actors.

-- QUESTION 2: Find the surname of the actor with the forename 'John'.
SELECT last_name FROM actor WHERE first_name = 'John';		-- Finds first name 'John' from actor table and displays last name.

-- QUESTION 3: Find all actors with surname 'Neeson'. 
SELECT first_name, last_name FROM actor WHERE last_name = 'Neeson';	  -- Finds all actors with last name 'Neeson' from actor table and displays first name and last name.

-- QUESTION 4: Find all actors with ID numbers divisible by 10. 
SELECT first_name, last_name FROM actor WHERE actor_id % 10 = 0;	-- Finds all actors where ID is divisible by 10 done using modulus operator. 

-- QUESTION 5: What is the description of the movie with an ID of 100?
SELECT description AS 'Movie Description' FROM film WHERE film_id = 100;  -- Movie description of movie with film_id 100 from table film. 

-- QUESTION 6: Find every R-rated movie?
SELECT title FROM film WHERE rating = 'R';		-- Finds all movies from film table where rating equals 'R'. 

-- QUESTION 7: Find every non-R-rated movie?
SELECT title FROM film WHERE rating != 'R';		-- Finds all movies from film table where rating doesn't equal 'R'.

-- QUESTION 8: Find the ten shortest movies?    **************
SELECT film_id, title, length FROM film ORDER BY length ASC LIMIT 10; -- Finds the movie names of the shortest 10 films.

-- QUESTION 9: Find the movies with the longest runtime, without using limit?
SELECT title FROM film WHERE length = (SELECT MAX(length) FROM film);  -- Finds the movies with longest runtime without using limit.

-- QUESTION 10: Find all movies that have deleted scenes. 
SELECT title FROM film WHERE special_features LIKE '%Deleted Scenes%'; -- Finds movies from film table where special features contains 'Deleted Scenes'. 

-- QUESTION 11: Using HAVING reverse alphabetically list the last names that are not repeated.
SELECT last_name FROM actor GROUP BY last_name HAVING COUNT(last_name) = 1 ORDER BY last_name DESC;

-- QUESTION 12: Using HAVING list the last names that apper more than once, from highest to lowet frequency.

-- QUESTION 13: Which actor has appeared in the most films?

-- QUESTION 14: When is Academy Dinosaur due?
SELECT release_year FROM film WHERE title = 'Academy Dinosaur';  -- Displays release year from film table for movie 'Academy Dinosaur'. 

-- QUESTION 15: What is the average runtime of all films?
SELECT AVG(length) AS 'Average Length of all Films' FROM film;		-- Returns average runtimf of all films. 

-- QUESTION 16: List the average runtime for every film category? 
Select category.name, avg(length) from film join film_category using (film_id)
join category using (category_id)
group by category.name
order by avg(length) desc;

-- QUESTION 17: List all movies featuring a robot?
SELECT title FROM film WHERE description LIKE '%Robot%';	-- Returns all movies featuring a robot.

-- QUESTION 18: How many movies where released in 2010?
SELECT COUNT(release_year) FROM film WHERE release_year = '2010';   -- Returns a value after counting the number of 2010 in column release_year in film table. 

-- QUESTION 19: Find the titles of all the horror movies.
SELECT title 
FROM film_category
JOIN film ON film.film_id = film_category.film_id
JOIN category ON film_category.category_id = category.category_id
WHERE category.name = 'Horror'; 

-- QUESTION 20: List the full names of the staff member with the ID of 2. 
SELECT first_name, last_name FROM staff WHERE staff_id = 2;		-- Returns full name of staff with ID 2 in staff table.

-- QUESTION 21: List all the movies that Fred Costner has appeared in.
SELECT film.title, actor.first_name, actor.last_name
FROM film_actor
JOIN film ON film_actor.actor_id = film.film_id
JOIN actor ON film_actor.film_id = actor.actor_id
WHERE actor.first_name = 'Fred' AND actor.last_name = 'Costner';

-- QUESTION 22: How many distinct countries are there?
SELECT COUNT(DISTINCT country) AS 'Distinct Country' FROM country;	-- Returns number of distinct countries.

-- QUESTION 23: List the name of every language in reverse alphabetical order.
SELECT name FROM language ORDER BY name DESC;		-- Returns name of every language in reverse alphabetical order. 

-- QUESTION 24: List the full names of every actor whose surname ends with '-son' in alphabetical order by their forename. 
SELECT first_name, last_name FROM actor WHERE last_name LIKE '%son' ORDER BY last_name ASC;

-- QUESTION 25: Which category contains the most films?

SELECT category.name, count(film.title)
FROM film_category
JOIN film ON film_category.film_id = film.film_id
JOIN category ON film_category.category_id = category.category_id
group by category.name
order by category.name desc
limit 1;



