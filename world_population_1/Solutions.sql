-- What years are covered by the dataset?
SELECT DISTINCT year
FROM population_years
;

--What (year) is the largest population size for Gabon in this dataset?
SELECT max(population) AS 'Largest Population'
FROM population_years
WHERE country = 'Gabon'
;

--What were the 10 lowest population countries in 2005?
SELECT country, population
FROM population_years
WHERE year = '2005'
GROUP BY 1
ORDER BY 2 ASC
LIMIT 10
;

--What are all the distinct countries with a population of over 100 million in the year 2010?
SELECT DISTINCT country, population AS 'population in million'
FROM population_years
WHERE population >= 100
AND year = 2010
ORDER BY 2 DESC
;

--How many countries in this dataset have the word "islands" in their name?
SELECT country
FROM population_years
WHERE country like '%islands%'
GROUP BY 1
;

--What is the difference in population between 2000 and 2010 in indonesia?
SELECT country, year, population
FROM population_years
WHERE country = 'Indonesia'
AND (year = 2010 OR year = 2000)
;

