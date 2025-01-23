
--Created a schema named practise test

SET SEARCH_PATH TO 'Practise test';

--created a table named city

CREATE TABLE city 
(
id INT UNIQUE,
name VARCHAR(17) NOT NULL,
Country_code VARCHAR(3) NOT NULL,
District VARCHAR(20) NOT NULL,
Population INT);

--PRACTISE 1
SELECT * 
FROM city
WHERE population > 100000 AND Country_code = USA

--PRACTISE 2
SELECT name
FROM city
WHERE population > 120000 AND country_code = USA

