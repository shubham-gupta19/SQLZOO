World Country Profile: Aggregate functions
This tutorial is about aggregate functions such as COUNT, SUM and AVG. An aggregate function takes many values and delivers just one value. For example the function SUM would aggregate the values 2, 4 and 5 to deliver the single value 11.

Total world population
1. Show the total population of the world.

SELECT SUM(population)
FROM world

List of continents
2. List all the continents - just once each.

SELECT distinct continent
FROM world

GDP of Africa
3. Give the total GDP of Africa

SELECT SUM(gdp)
FROM world
WHERE continent = 'AFRICA'

Count the big countries

4. How many countries have an area of at least 1000000

SELECT count(distinct name)
FROM world
WHERE area > 1000000

Baltic states population
5. What is the total population of ('Estonia', 'Latvia', 'Lithuania')

SELECT sum(population)
FROM world 
WHERE name in ('Estonia', 'Latvia', 'Lithuania')

Using GROUP BY and HAVING
Counting the countries of each continent

6. For each continent show the continent and number of countries.

SELECT continent, count(distinct name) as countries
FROM world
GROUP BY 1

Counting big countries in each continent
7. For each continent show the continent and number of countries with populations of at least 10 million.

SELECT continent, count(distinct case when population > 10000000 then name end) as countries
FROM world
GROUP BY 1

Counting big continents
8. List the continents that have a total population of at least 100 million.

SELECT continent
FROM
(	SELECT continent, sum(population)
	FROM world
	GROUP BY 1
	HAVING sum(population) > 100000000
) t

SUM and COUNT Quiz

1. SELECT the statement that shows the sum of population of all countries in 'Europe'

SELECT SUM(population) FROM bbc WHERE region = 'Europe'

2. SELECT the statement that shows the number of countries with population smaller than 150000

SELECT COUNT(name) FROM bbc WHERE population < 150000

3. SELECT the list of core SQL aggregate functions

AVG(), COUNT(), MAX(), MIN(), SUM()

4. SELECT the result that would be obtained FROM the following code:
 	SELECT region, SUM(area)
   	FROM bbc 
  	WHERE SUM(area) > 15000000 
  	GROUP BY region

No result due to invalid use of the WHERE function

5. SELECT the statement that shows the average population of 'Poland', 'Germany' and 'Denmark'

SELECT AVG(population) FROM bbc WHERE name IN ('Poland', 'Germany', 'Denmark')

6. SELECT the statement that shows the medium population density of each region

SELECT region, SUM(population)/SUM(area) AS density FROM bbc GROUP BY region

7. SELECT the statement that shows the name and population density of the country with the largest population

SELECT name, population/area AS density FROM bbc WHERE population = (SELECT MAX(population) FROM bbc)

8. Pick the result that would be obtained FROM the following code:
 	SELECT region, SUM(area) 
   	FROM bbc 
  	GROUP BY region 
  	HAVING SUM(area)<= 20000000

Table-D
Americas	732240
Middle East	13403102
South America	17740392
South Asia	9437710

Nobel Prizes: Aggregate functions

1. Show the total number of prizes awarded.

SELECT COUNT(winner) 
FROM nobel

2. List each subject - just once

SELECT distinct subject 
FROM nobel

3. Show the total number of prizes awarded for Physics.

SELECT count(winner) 
FROM nobel 
WHERE subject = 'Physics'

4. For each subject show the subject and the number of prizes.

SELECT subject, count(winner)
FROM nobel
GROUP BY 1

5. For each subject show the first year that the prize was awarded.

SELECT subject, min(yr)
FROM nobel
GROUP BY 1

6. For each subject show the number of prizes awarded in the year 2000.

SELECT subject, count(winner)
FROM nobel
WHERE yr = 2000
GROUP BY 1

7. Show the number of different winners for each subject.

SELECT subject,count(distinct winner)
FROM nobel
GROUP BY 1

8. For each subject show how many years have had prizes awarded.

SELECT subject, count(distinct yr)
FROM nobel
GROUP BY 1

9. Show the years in which three prizes were given for Physics.

SELECT yr
FROM nobel
WHERE subject = 'Physics'
GROUP BY 1
HAVING count(distinct winner) = 3

10*. Show winners who have won more than once.

SELECT winner 
FROM nobel
GROUP BY 1
HAVING count(winner) > 1

11*. Show winners who have won more than one subject.

SELECT winner
FROM nobel
GROUP BY 1
HAVING count(distinct subject) > 1

12*. Show the year and subject WHERE 3 prizes were given. Show only years 2000 onwards.

SELECT yr, subject
FROM nobel
WHERE yr >= 2000
GROUP BY 1,2
HAVING count(distinct winner) = 3