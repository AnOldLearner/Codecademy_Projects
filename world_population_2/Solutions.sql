-- How many entries in the countries table are from Africa?

 

SELECT continent, COUNT(*)

FROM countries

WHERE continent ='Africa'

;

-- What was the total population of the continent of Oceania in 2005?

 

SELECT countries.continent, 

SUM(population_years.population) AS 'Populations',              population_years.year

FROM countries

CROSS JOIN population_years

WHERE countries.continent = 'Oceania'

AND population_years.year = 2005

GROUP BY 1

;

--What is the average population of countries in South America in 2003?

 

SELECT  countries.continent, countries.name, round(avg(population_years.population), 0) AS 'Average Populations', population_years.year

FROM countries

JOIN population_years

on countries.id = population_years.country_id

WHERE continent = 'South America'

AND year = 2003

GROUP BY 2

;

 

--What country had the smallest population in 2007?

 

SELECT name, min(population) AS 'smallest population as of 2007'

FROM countries

JOIN population_years

on countries.id = population_years.id

WHERE year = 2007

;

--What is the average population of Poland during the time period covered by this dataset?

 

SELECT name, avg(population), year

FROM population_years

JOIN countries

on countries.id = population_years.country_id

WHERE name = 'Poland'

GROUP by 3

;

--How many countries have the word “The” in their name?

 

SELECT count(name)

FROM countries

WHERE name like '%The'

;

--What was the total population of each continent in 2010?

 

SELECT population_years.year, 

countries.continent, 

population_years.population AS 'total population in millions'

FROM population_years

LEFT JOIN countries

on population_years.country_id = countries.id

WHERE year = 2010

GROUP by 2

ORDER by 3 DESC

;
