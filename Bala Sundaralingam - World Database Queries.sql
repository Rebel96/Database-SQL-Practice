-- AUTHOR:	 BALA SUNDARALINGAM
-- DATE:	 31/03/22
-- TASK:	 WORLD DATABSE PROBLEMS

USE World;

-- QUESTION 1: Using COUNT get the number of cities in USA.
SELECT countrycode, COUNT(DISTINCT `name`) AS numberOfUSACities FROM city WHERE countrycode = 'USA';		-- Returns number of Cities in USA.


-- QUESTION 2: Find out the population and life expectancy for people in Argentina?
SELECT population, lifeExpectancy FROM country WHERE name = 'Argentina';	-- Returns Population and Life expectancy from Argentina.


-- QUESTION 3: Using IS NOT NULL, ORDER BY and LIMIT, which country has the highest life expectancy?
SELECT name, lifeExpectancy FROM country WHERE lifeExpectancy IS NOT NULL ORDER BY lifeExpectancy DESC LIMIT 1;


-- QUESTION 4: Using JOIN...ON find the capital city of spain.        -- Remember to ask question regarding this. 
SELECT DISTINCT c.name
FROM country coun
JOIN city c ON  c.id = (SELECT capital FROM country WHERE name = 'Spain');

-- QUESTION 5: Using JOIN...ON, list all the languages spoken in the region South East Asia region.
SELECT countryLanguage.language, country.name
FROM countryLanguage
JOIN country ON countrylanguage.countrycode = country.code
WHERE region = 'Southeast Asia';

-- QUESTION 6: Using a single query, list 25 cities around the world that start with the letter F.
SELECT name FROM city WHERE name LIKE 'F%' limit 25;


-- QUESTION 7: Using COUNT and JOIN ... ON, get the number of cities in China.
Select count(*) FROM city
JOIN country on city.CountryCode = Country.Code
WHERE country.Name='China';


-- QUESTION 8: Using IS NOT NULL, ORDER BY, and LIMIT, which country has the lowest population? Discard non-zero populations.
SELECT name, population from country
WHERE Population IS NOT NULL and Population!='0' ORDER BY Population ASC LIMIT 1;


-- QUESTION 9: Using aggregate functions, return the number of countries the database contains.
SELECT COUNT(name) FROM Country;

-- QUESTION 10: What are the top ten largest countries by area?
SELECT name, surfaceArea FROM Country ORDER BY surfaceArea DESC LIMIT 10;

-- QUESTION 11: List the five largest cities by population in Japan.
SELECT name, population FROM city WHERE countrycode = 'JPN' ORDER BY population DESC Limit 5;

-- QUESTION 12: List the names and country codes of every country with Elizabeth II as its Head of State. You will need to fix the mistake first!
SELECT `code`, `name` FROM country WHERE headOfState = 'Elisabeth II';

-- QUESTION 13: List the top ten countries with the smallest population-to-area ratio. Discard any countries with a ratio of 0.
SELECT name, population/surfaceArea 
FROM country 
WHERE population/surfaceArea != 0 
ORDER BY population/surfaceArea;

-- QUESTION 14: List every unique world language.
SELECT DISTINCT (language) FROM countryLanguage;

-- QUESTION 15: List the names and GNP of the world's top 10 richest countries.
SELECT name, gnp FROM country ORDER BY gnp DESC LIMIT 10;

-- QUESTION 16: List the names of, and number of languages spoken by, the top ten most multilingual countries.
SELECT country.Name, COUNT(countrylanguage.language)
FROM country
JOIN countrylanguage ON country.code = countrylanguage.countrycode
GROUP BY country.name
ORDER BY COUNT(countrylanguage.language) desc
LIMIT 10 ;


-- QUESTION 17: List every country where over 50% of its population can speak German.
SELECT c.name
FROM country c 
JOIN countrylanguage cl ON c.code = cl.countrycode 
WHERE cl.language = "German" AND cl.percentage > 50; 

-- QUESTION 18: Which country has the worst life expectancy? Discard zero or null values.
SELECT name, lifeExpectancy  FROM country WHERE lifeExpectancy = (SELECT MIN(LifeExpectancy) FROM country); 

-- QUESTION 19: List the top three most common government forms.
SELECT governmentForm, COUNT(governmentForm) AS 'Value Occurence' 
FROM country 
GROUP BY governmentForm
ORDER BY COUNT(governmentForm) DESC
LIMIT 3;

-- QUESTION 20: How many countries have gained independence since records began?
SELECT Count(name) FROM country WHERE indepYear >= (SELECT MIN(indepYear) FROM country WHERE indepYear IS NOT NULL);
