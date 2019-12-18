SELECT from Nobel Tutorial

1.Winners from 1950
Change the query shown so that it displays Nobel prizes for 1950.

SELECT yr, subject, winner
FROM nobel
WHERE yr = 1950

2.1962 Literature
Show who won the 1962 prize for Literature.

SELECT winner
FROM nobel
WHERE yr = 1962
AND subject = 'Literature'

3.Albert Einstein
Show the year and subject that won 'Albert Einstein' his prize.

SELECT yr, subject
FROM nobel
WHERE winner = 'Albert Einstein'

4.Recent Peace Prizes
Give the name of the 'Peace' winners since the year 2000, including 2000.

SELECT winner
FROM nobel
WHERE subject = 'Peace' and yr >= 2000

5.Literature in the 1980s
Show all details (yr, subject, winner) of the Literature prize winners for 1980 to 1989 inclusive.

SELECT yr, subject, winner
FROM nobel
WHERE subject = 'Literature' and yr between 1980 and 1989

6.Only Presidents
Show all details of the presidential winners:
Theodore Roosevelt
Woodrow Wilson
Jimmy Carter
Barack Obama

SELECT * 
FROM nobel
WHERE winner IN ('Theodore Roosevelt','Woodrow Wilson','Jimmy Carter','Barack Obama')

7.John
Show the winners with first name John

SELECT winner
FROM nobel
WHERE winner like ('John%')

8.Chemistry and Physics from different years
Show the year, subject, and name of Physics winners for 1980 together with the Chemistry winners for 1984.

SELECT yr, subject, winner
FROM nobel
WHERE (subject = 'Physics' and yr = '1980' ) or (subject = 'Chemistry' and yr = '1984' )

9.Exclude Chemists and Medics
Show the year, subject, and name of winners for 1980 excluding Chemistry and Medicine

SELECT yr, subject, winner
FROM nobel
WHERE subject not in ('Chemistry','Medicine') and yr = 1980

10.Early Medicine, Late Literature
Show year, subject, and name of people who won a 'Medicine' prize in an early year (before 1910, not including 1910) together with winners of a 'Literature' prize in a later year (after 2004, including 2004)

SELECT yr, subject, winner
FROM nobel
WHERE (subject = 'Medicine' and yr < 1910) or (subject = 'Literature' and yr >= 2004)

11.Umlaut
Find all details of the prize won by PETER GRÜNBERG

SELECT *
FROM nobel
WHERE winner = 'PETER GRÜNBERG'

12.Apostrophe
Find all details of the prize won by EUGENE O'NEILL
' 
SELECT *
FROM nobel
WHERE winner = 'EUGENE O''NEILL'

13.Knights of the realm
List the winners, year and subject where the winner starts with Sir. Show the the most recent first, then by name order.

SELECT winner, yr, subject
FROM nobel
WHERE winner like ('Sir%')
ORDER BY yr desc, winner

14.Chemistry and Physics last
Show the 1984 winners and subject ordered by subject and winner name; but list Chemistry and Physics last.

SELECT winner, subject
FROM nobel
WHERE yr = 1984
ORDER BY (case when subject in ('Physics','Chemistry') then 1 else 0 end), subject,winner



Nobel Quiz

1. Pick the code which shows the name of winners names beginning with C and ending in n

SELECT winner FROM nobel
WHERE winner LIKE 'C%' AND winner LIKE '%n'

2. Select the code that shows how many Chemistry awards were given between 1950 and 1960

SELECT COUNT(subject) FROM nobel
WHERE subject = 'Chemistry'
AND yr BETWEEN 1950 and 1960

3. Pick the code that shows the amount of years where no Medicine awards were given

SELECT COUNT(DISTINCT yr) FROM nobel
WHERE yr NOT IN (SELECT DISTINCT yr FROM nobel WHERE subject = 'Medicine')

4. Select the result that would be obtained from the following code:
SELECT subject, winner FROM nobel WHERE winner LIKE 'Sir%' AND yr LIKE '196%'


Medicine	Sir John Eccles
Medicine	Sir Frank Macfarlane Burnet

5. Select the code which would show the year when neither a Physics or Chemistry award was given

SELECT yr FROM nobel
WHERE yr NOT IN(SELECT yr 
FROM nobel
WHERE subject IN ('Chemistry','Physics'))

6. Select the code which shows the years when a Medicine award was given but no Peace or Literature award was
SELECT DISTINCT yr
FROM nobel
WHERE subject='Medicine' 
AND yr NOT IN(SELECT yr FROM nobel WHERE subject='Literature')
AND yr NOT IN (SELECT yr FROM nobel WHERE subject='Peace')

7. Pick the result that would be obtained from the following code:
SELECT subject, COUNT(subject) 
FROM nobel 
WHERE yr ='1960' 
GROUP BY subject

Chemistry	1
Literature	1
Medicine	2
Peace	1
Physics	1
