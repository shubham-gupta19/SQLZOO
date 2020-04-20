Teachers and Departments

NULL, INNER JOIN, LEFT JOIN, RIGHT JOIN
1. List the teachers who have NULL for their department.

SELECT distinct name
FROM teacher 
WHERE dept is null

2. Note the INNER JOIN misses the teachers with no department and the departments with no teacher.

SELECT teacher.name, dept.name
FROM teacher 
INNER JOIN dept ON (teacher.dept=dept.id)

3. Use a different JOIN so that all teachers are listed.

SELECT distinct t.name, dept.name
FROM teacher t
LEFT JOIN dept on dept.id = t.dept

4. Use a different JOIN so that all departments are listed.

SELECT distinct t.name, dept.name
FROM dept
LEFT JOIN  teacher t on dept.id = t.dept

5. Use COALESCE to print the mobile number. Use the number '07986 444 2266' if there is no number given. Show teacher name and mobile number or '07986 444 2266'

SELECT name, coalesce(mobile,'07986 444 2266')
FROM teacher

6. Use the COALESCE function and a LEFT JOIN to print the teacher name and department name. Use the string 'None' where there is no department.

SELECT distinct t.name, coalesce(dept.name,'None')
FROM teacher t
LEFT JOIN dept on dept.id = t.dept

7. Use COUNT to show the number of teachers and the number of mobile phones.

SELECT count(distinct name), count(distinct mobile)
FROM teacher

8. Use COUNT and GROUP BY dept.name to show each department and the number of staff. Use a RIGHT JOIN to ensure that the Engineering department is listed.

SELECT dept.name, count(t.name)
FROM dept
LEFT JOIN teacher t on t.dept = dept.id
GROUP BY 1

9. Use CASE to show the name of each teacher followed by 'Sci' if the teacher is in dept 1 or 2 and 'Art' otherwise.

SELECT name, case when dept in (1,2) then 'Sci' else 'Art' end
FROM teacher

10. Use CASE to show the name of each teacher followed by 'Sci' if the teacher is in dept 1 or 2, show 'Art' if the teachers dept is 3 and 'None' otherwise.

SELECT name, case when dept in (1,2) then 'Sci' when dept in (3) then  'Art' else 'None' end
FROM teacher

Using Null Quiz

1. Select the code which uses an outer join correctly.

SELECT teacher.name, dept.name FROM teacher LEFT OUTER JOIN dept ON (teacher.dept = dept.id)

2. Select the correct statement that shows the name of department which employs Cutflower -

SELECT dept.name FROM teacher JOIN dept ON (dept.id = teacher.dept) WHERE teacher.name = 'Cutflower'

3. Select out of following the code which uses a JOIN to show a list of all the departments and number of employed teachers

SELECT dept.name, COUNT(teacher.name) FROM teacher RIGHT JOIN dept ON dept.id = teacher.dept GROUP BY dept.name

4. Using SELECT name, dept, COALESCE(dept, 0) AS result FROM teacher on teacher table will:

display 0 in result column for all teachers without department

5. Query:
SELECT name,
CASE WHEN phone = 2752 THEN 'two'
WHEN phone = 2753 THEN 'three'
WHEN phone = 2754 THEN 'four'
END AS digit
FROM teacher
shows following 'digit':

'four' for Throd

6. Select the result that would be obtained from the following code:
SELECT name, 
CASE 
WHEN dept 
IN (1) 
THEN 'Computing' 
ELSE 'Other' 
END 
FROM teacher

Table-A
Shrivell	Computing
Throd	Computing
Splint	Computing
Spiregrain	Other
Cutflower	Other
Deadyawn	Other

