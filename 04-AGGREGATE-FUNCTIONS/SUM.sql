USE ST2_PRACTICE;
-- 1. Syntax
/*
SELECT SUM(column_name)
FROM table_name;
*/

SELECT SUM(marks) FROM STUDENTS;

-- SUM() with Alias (AS)
SELECT SUM(marks) AS Total_marks
FROM STUDENTS;

-- SUM() with WHERE
SELECT SUM(marks) AS total_cse
FROM STUDENTS
WHERE branch='CSE';

-- SUM() with Arithmetic Expression
SELECT SUM(marks+5) AS Updated_marks
FROM STUDENTS;

-- SUM() and NULL Values
SELECT SUM(marks)
FROM STUDENTS;
-- SUM() NULL values ko ignore karta hai.

-- SUM() with DISTINCT
SELECT SUM(DISTINCT marks)
FROM STUDENTS;

-- SUM() when no rows match
SELECT SUM(marks)
FROM STUDENTS
WHERE city = 'Mumbai';
-- Agar Mumbai ka koi student nahi hai, toh result NULL aayega, 0 nahi.

-- SUM() with GROUP BY
SELECT branch, SUM(marks) AS Total_Marks
FROM STUDENTS
GROUP BY branch;

-- SUM() with HAVING
-- HAVING ka use grouped results par condition apply karne ke liye hota hai.
SELECT branch, SUM(marks) AS Total_Marks
FROM STUDENTS
GROUP BY branch
HAVING SUM(marks) > 190;










