SELECT within SELECT Tutorial
This tutorial looks at how we can use SELECT statements within SELECT statements to perform more complex queries.

1.Bigger than Russia
List each country name where the population is larger than that of 'Russia'.

SELECT name 
FROM world
WHERE population >
(SELECT population 
FROM world
WHERE name='Russia')

2.Richer than UK
Show the countries in Europe with a per capita GDP greater than 'United Kingdom'.

SELECT name 
FROM world
WHERE (gdp/population) > (SELECT (gdp/population) FROM world WHERE name = 'United Kingdom')
AND continent = 'Europe'

3.Neighbours of Argentina and Australia
List the name and continent of countries in the continents containing either Argentina or Australia. Order by name of the country.

SELECT name, continent
FROM world
WHERE continent in (SELECT continent FROM world WHERE name in ('Argentina','Australia'))
ORDER BY name

4.Between Canada and Poland
Which country has a population that is more than Canada but less than Poland? Show the name and the population.

SELECT name, population
FROM world 
WHERE population > (SELECT population FROM world where name = 'Canada') 
AND population < (SELECT population FROM world WHERE name = 'Poland')

5.Percentages of Germany
Show the name and the population of each country in Europe. Show the population as a percentage of the population of Germany.

SELECT name, concat(ROUND((population*100/(SELECT population FROM world WHERE name = 'Germany')),0),'%')
FROM world
WHERE continent = 'Europe'

6.Bigger than every country in Europe
Which countries have a GDP greater than every country in Europe? [Give the name only.] (Some countries may have NULL gdp values)

SELECT name
FROM world
WHERE gdp > All (SELECT gdp FROM world WHERE continent = 'Europe' and gdp>0)

7.Largest in each continent
Find the largest country (by area) in each continent, show the continent, the name and the area:

SELECT continent, name, area 
FROM world x
WHERE area >= ALL (SELECT area FROM world y WHERE y.continent=x.continent AND area>0)

SELECT continent, name, area 
FROM (SELECT continent, name, area, Rank() over (partition by continent ORDER BY area DESC) as rank FROM world GROUP BY 1,2,3) a 
WHERE rank =1
ORDER BY continent

8.First country of each continent (alphabetically)
List each continent and the name of the country that comes first alphabetically.

SELECT continent, name
FROM world x
WHERE name <= ALL (SELECT name FROM world y WHERE y.continent = x.continent ORDER BY name ASC)

Difficult Questions That Utilize Techniques Not Covered In Prior Sections

9. Find the continents where all countries have a population <= 25000000. Then find the names of the countries associated with these continents. Show name, continent and population.

WITH cte AS
(
	SELECT name, continent,population
	FROM world x 
	WHERE population >= All (SELECT population FROM world y WHERE y.continent = x.continent)
	HAVING population <= 25000000
)
SELECT name, continent,population FROM world WHERE continent IN (SELECT DISTINCT continent FROM cte)

NOTE - CTE or common table expression is a temporary result set that you can refer in the main query. To write a cte, you need to write the script in like - with dataframe_name as (). 
To write multiple CTE, just separate different CTE with comma (,). It is helpful when we need to extract data from different sources and then extract useful information in the main query.

10. Some countries have populations more than three times that of any of their neighbours (in the same continent). Give the countries and continents.

WITH cte as 
( SELECT *
  FROM 
	( SELECT continent, name, population, rank()over ( partition by continent ORDER BY population DESC) AS rank 
	  FROM world
	) t 
	WHERE rank <= 2
)
SELECT name, continent
FROM world x
WHERE population > ANY(SELECT (3*population) FROM cte y WHERE x.continent = y.continent)

WITH cte as 
( SELECT *
  FROM 
	( SELECT continent, name, population, rank()over ( partition by continent ORDER BY population DESC) AS rank 
	  FROM world
	) t 
	WHERE rank = 2
)
SELECT name, continent
FROM world x
WHERE population > (SELECT (3*population) FROM cte y WHERE x.continent = y.continent)
