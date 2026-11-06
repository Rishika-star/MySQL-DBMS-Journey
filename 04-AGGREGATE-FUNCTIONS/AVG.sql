-- 1. Basic Syntax
/*SELECT AVG(column_name)
FROM table_name;*/

USE ST2_PRACTICE;
SHOW TABLES;
SELECT * FROM Students;
-- AVG() with Alias also covered
SELECT AVG(marks) AS AVG_MARKS
FROM Students;

-- AVG() with WHERE
SELECT AVG(marks) FROM
Students WHERE branch='CSE';

-- AVG() with DISTINCT
SELECT AVG(DISTINCT marks) FROM 
Students;

-- AVG() with NULL Values
SELECT AVG(marks)
FROM Student;
/*
AVG() NULL values ko ignore karta hai.
NULL ko zero nahi maanta.
gar saari values NULL hain, result NULL aata hai.
*/

-- AVG() with Arithmetic Expression
SELECT AVG(marks+5) AS updated_mark
FROM Students;

-- AVG() with GROUP BY
-- SYNTAX
/*
SELECT column_name, AVG(numeric_column)
FROM table_name
GROUP BY column_name;
*/
SELECT branch,AVG(marks) 
FROM STUDENTS
GROUP BY branch;

-- AVG() with HAVING
-- SYNTAX
/*
SELECT column_name, AVG(numeric_column)
FROM table_name
GROUP BY column_name
HAVING AVG(numeric_column) condition;
*/
SELECT age, AVG(marks) AS Average_Marks
FROM Student
GROUP BY age
HAVING AVG(marks) > 80;

-- 9. AVG() when no rows match
SELECT AVG(marks)
FROM Student
WHERE branch = 'EECE';

-- Agar EECE ka koi student nahi hai, toh result NULL hoga.













