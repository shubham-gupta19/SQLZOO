SELECT from WORLD Tutorial

In this tutorial you will use the SELECT command on the table world:

1.Introduction
Observe the result of running this SQL command to show the name, continent and population of all countries.

SELECT name, continent, population 
FROM world

2.Large Countries
Show the name for the countries that have a population of at least 200 million. 200 million is 200000000, there are eight zeros.

SELECT name 
FROM world
WHERE population > 200000000

3.Per capita GDP
Give the name and the per capita GDP for those countries with a population of at least 200 million.

SELECT name, (gdp/population) as 'per capita GDP' 
FROM world 
WHERE population > 200000000

4.South America In millions
Show the name and population in millions for the countries of the continent 'South America'. Divide the population by 1000000 to get population in millions.

SELECT name, (population/1000000) as 'population(in M)' 
FROM world 
WHERE continent = 'South America'

5.France, Germany, Italy
Show the name and population for France, Germany, Italy

SELECT name, population 
FROM world 
WHERE name in ('France','Germany','Italy')

6.United
Show the countries which have a name that includes the word 'United'

SELECT name 
FROM world 
WHERE name like '%United%'

7.Two ways to be big
Show the countries that are big by area or big by population. Show name, population and area.

SELECT name, population, area
FROM world
WHERE area > 3000000 or population > 250000000

8.One or the other (but not both)
Show the countries that are big by area (more than 3 million) or big by population (more than 250 million) but not both. Show name, population and area.

SELECT name, population, area 
FROM world
WHERE area > 3000000 xor population > 250000000 

SELECT name, population, area 
FROM world
WHERE (area > 3000000 and population < 250000000) or (area < 3000000 and population > 250000000)

9.Rounding
For South America show population in millions and GDP in billions both to 2 decimal places.

SELECT name, ROUND(population/1000000,2) as 'population(in M)', ROUND(gdp/1000000000,2) as 'gdp(in B)'
FROM world
WHERE  continent = 'South America'

10.Trillion dollar economies
Show per-capita GDP for the trillion dollar countries to the nearest $1000.

SELECT name, ROUND(gdp/population,-3)
FROM world
WHERE gdp > 1000000000000

11.Name and capital have the same length
Show the name and capital where the name and the capital have the same number of characters.

SELECT name, capital
FROM world
WHERE LENGTH(name) = LENGTH(capital)

12.Matching name and capital
Show the name and the capital where the first letters of each match. Dont include countries where the name and the capital are the same word.

SELECT name, capital
FROM world
WHERE LEFT(name,1) = LEFT(capital,1) and name <> capital

13.All the vowels
Find the country that has all the vowels and no spaces in its name.

SELECT name
FROM world
WHERE name LIKE '%a%' and name LIKE '%e%' and name LIKE '%i%' and name LIKE '%o%' and name LIKE '%u%' and name NOT LIKE '% %'

BBC QUIZ

1.Select the code which gives the name of countries beginning with U

SELECT name
FROM world
WHERE name LIKE 'U%'

2.Select the code which shows just the population of United Kingdom?

SELECT population
FROM world
WHERE name = 'United Kingdom'

3.Select the answer which shows the problem with this SQL code - the intended result should be the continent of France:
SELECT continent 
FROM world 
WHERE 'name' = 'France'

'name' should be name

4.Select the result that would be obtained from the following code:
SELECT name, population / 10 
FROM world 
WHERE population < 10000

Nauru	990

5. Select the code which would reveal the name and population of countries in Europe and Asia

SELECT name, population
FROM world
WHERE continent IN ('Europe', 'Asia')

6.Select the code which would give two rows

SELECT name FROM world
WHERE name IN ('Cuba', 'Togo')

7.Select the result that would be obtained from this code:
SELECT name FROM world
WHERE continent = 'South America'
AND population > 40000000

Brazil
Colombia
