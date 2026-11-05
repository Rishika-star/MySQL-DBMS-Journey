USE ST2_PRACTICE;
SHOW TABLES;
SELECT * FROM STUDENTS;
-- A. COUNT(*)
-- SYNTAX
/*
SELECT COUNT(*)
FROM TABLE_NAME;
*/

-- COUNT() ka use rows ya non-NULL values ki total number count karne ke liye hota hai.
SELECT COUNT(*) FROM STUDENTS;-- TOTAL NO.OF RECORDS RETURNED

-- B. COUNT(column_name)
-- Kisi specific column ki sirf NON-NULL values count karta hai.
-- Syntax:
/*
SELECT COUNT(column_name)
FROM table_name;
*/
SELECT COUNT(marks) FROM STUDENTS;

-- C. COUNT(DISTINCT column_name)
-- Unique values count karta hai.
SELECT COUNT(DISTINCT branch) FROM STUDENTS;

-- D. COUNT with WHERE
SELECT COUNT(*) FROM STUDENTS
WHERE marks>80;

-- E. COUNT with Alias
SELECT COUNT(*) AS Total_students
FROM STUDENTS;

-- F. COUNT with GROUP BY
SELECT branch,COUNT(*) AS Total_Students 
FROM STUDENTS 
GROUP BY branch;-- Ye har branch mein students count karega


 





















