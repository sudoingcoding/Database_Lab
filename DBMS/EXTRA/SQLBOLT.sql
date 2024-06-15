--GO TO THE LINK https://sqlbolt.com/
--Exercise 1 — Tasks
--Find the title of each film
SELECT TITLE 
FROM movies;
--Find the director of each film
SELECT DIRECTOR 
FROM movies;
--Find the title and director of each film
SELECT TITLE,DIRECTOR 
FROM movies;
--Find the title and year of each film
SELECT TITLE,YEAR 
FROM movies;
--Find all the information about each film
SELECT * 
FROM movies;

--Exercise 2 — Tasks
--Find the movie with a row id of 6
SELECT TITLE 
FROM movies 
WHERE ID=6;
--Find the movies released in the years between 2000 and 2010
SELECT TITLE 
FROM movies 
WHERE YEAR>=2000 AND YEAR<=2010;
--Find the movies not released in the years between 2000 and 2010
SELECT TITLE 
FROM movies 
WHERE NOT (YEAR>=2000 AND YEAR<=2010);
--Find the first 5 Pixar movies and their release year
SELECT TITLE,YEAR 
FROM movies LIMIT 5;

--Exercise 3 — Tasks
--Find all the Toy Story movies
SELECT * 
FROM movies 
WHERE Title LIKE 'Toy Story%';
--Find all the movies directed by John Lasseter
SELECT Title,Director 
FROM movies 
WHERE DIRECTOR='John Lasseter';
--Find all the movies (and director) not directed by John Lasseter
SELECT Title,Director 
FROM movies 
WHERE NOT DIRECTOR='John Lasseter';
--Find all the WALL-* movies
SELECT Title,Director 
FROM movies 
WHERE Title LIKE 'WALL-%';


--Exercise 4 — Tasks
--List all directors of Pixar movies (alphabetically), without duplicates
SELECT DISTINCT Director 
FROM movies 
ORDER BY Director;
--List the last four Pixar movies released (ordered from most recent to least)
SELECT * 
FROM movies 
ORDER BY YEAR DESC 
LIMIT 4;
--List the first five Pixar movies sorted alphabetically
SELECT * 
FROM movies 
ORDER BY Title 
LIMIT 5;
--List the next five Pixar movies sorted alphabetically
SELECT * 
FROM movies 
ORDER BY Title 
LIMIT 5 
OFFSET 5;

--Review 1 — Tasks
--List all the Canadian cities and their populations
SELECT City,Population 
FROM north_american_cities 
WHERE Country='Canada';
--Order all the cities in the United States by their latitude from north to south
SELECT City 
FROM north_american_cities 
WHERE Country='United States'
ORDER BY Latitude DESC;
--List all the cities west of Chicago, ordered from west to east
SELECT City 
FROM north_american_cities 
WHERE Longitude<(
    SELECT Longitude 
    FROM north_american_cities 
    WHERE City='Chicago' 
    ORDER BY Longitude DESC
    )
ORDER BY Longitude;
--List the two largest cities in Mexico (by population)
SELECT City 
FROM north_american_cities 
WHERE Country='Mexico' 
ORDER BY Population 
DESC LIMIT 2;
--List the third and fourth largest cities (by population) in the United States and their population
SELECT City 
FROM north_american_cities 
WHERE Country='United States' 
ORDER BY Population DESC 
LIMIT 2 
OFFSET 2;

--Exercise 6 — Tasks
--Find the domestic and international sales for each movie
SELECT Title,Domestic_sales,International_sales 
FROM MOVIES 
JOIN BOXOFFICE 
WHERE Movie_id=Id;
--Show the sales numbers for each movie that did better internationally rather than domestically
SELECT Title,Domestic_sales,International_sales 
FROM MOVIES 
JOIN BOXOFFICE 
WHERE Movie_id=Id 
AND International_sales>Domestic_sales;
--List all the movies by their ratings in descending order
SELECT Title 
FROM MOVIES 
JOIN BOXOFFICE 
WHERE Movie_id=Id 
ORDER BY Rating DESC;

--Exercise 7 — Tasks
--Find the list of all buildings that have employees
SELECT DISTINCT Building 
FROM employees;
--Find the list of all buildings and their capacity
SELECT * 
FROM Buildings;
--List all buildings and the distinct employee roles in each building (including empty buildings)
SELECT DISTINCT Building_name,Role 
FROM Buildings 
LEFT JOIN Employees 
ON Building_name=Building;

--Exercise 8 — Tasks
--Find the name and role of all employees who have not been assigned to a building
SELECT Name,Role 
FROM employees 
LEFT JOIN Buildings 
ON Building=Building_name 
WHERE Building IS NULL;
--Find the names of the buildings that hold no employees
SELECT DISTINCT Building_name 
FROM Buildings 
LEFT JOIN employees Buildings 
ON Building=Building_name 
WHERE Role IS NULL;

--Exercise 9 — Tasks
--List all movies and their combined sales in millions of dollars
SELECT Title, 
(Domestic_sales + International_sales)/1000000 AS Total_sales
FROM movies 
JOIN Boxoffice ON Id = Movie_id
GROUP BY Title;
--List all movies and their ratings in percent
SELECT Title, Rating*10 AS Rating
FROM movies 
JOIN Boxoffice 
ON Id = Movie_id;
--List all movies that were released on even number years
SELECT Title
FROM movies 
JOIN Boxoffice 
ON Id = Movie_id
WHERE Year%2==0;

--Exercise 10 — Tasks
--Find the longest time that an employee has been at the studio
SELECT MAX(Years_employed) 
FROM employees;
--For each role, find the average number of years employed by employees in that role
SELECT Role,AVG(Years_employed) 
FROM employees 
GROUP BY Role;
--Find the total number of employee years worked in each building
SELECT Building,SUM(Years_employed) AS Total_Years
FROM employees 
GROUP BY Building;

--Exercise 11 — Tasks
--Find the number of Artists in the studio (without a HAVING clause)
SELECT COUNT(*) 
FROM employees 
WHERE Role='Artist';
--Find the number of Employees of each role in the studio
SELECT Role,COUNT(*) 
FROM employees 
GROUP BY Role;
--Find the total number of years employed by all Engineers
SELECT SUM(Years_employed)
FROM EMPLOYEES
WHERE ROLE='Engineer';

--Exercise 12 — Tasks
--Find the number of movies each director has directed
SELECT Director,COUNT(Title) 
FROM movies 
GROUP BY Director;
--Find the total domestic and international sales that can be attributed to each director
SELECT Director,SUM(Domestic_sales+International_sales) 
FROM movies 
JOIN Boxoffice
ON id=movie_id
GROUP BY Director;

--Exercise 13 — Tasks
--Add the studio's new production, Toy Story 4 to the list of movies (you can use any director)
INSERT INTO movies VALUES (4, "Toy Story 4", "El Directore", 2015, 90);
--Toy Story 4 has been released to critical acclaim! It had a rating of 8.7, and made 340 million domestically and 270 million internationally. Add the record to the BoxOffice table.
INSERT INTO boxoffice VALUES (4, 8.7, 340000000, 270000000);

