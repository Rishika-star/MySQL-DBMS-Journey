USE ST2_PRACTICE;
CREATE TABLE Employee(
    id INT PRIMARY KEY,
    name VARCHAR(50),
    age INT,
    city VARCHAR(30)

);
INSERT INTO EMPLOYEE 
VALUES
(1,'Raj',22,'Bengaluru'),
(2,'Rishika',18,'Chandigarh');
SELECT * FROM Employee;

-- SELECT specific columns
SELECT name,age FROM Employee;

-- SELECT DISTINCT – Duplicate values remove karna
SELECT DISTINCT city FROM Employee;

-- SELECT with alias (AS)
SELECT name AS Employee_Name,
age AS Employee_Age FROM Employee;

-- SELECT with calculated columns
SELECT name,age+5 AS Updated_age FROM Employee;

-- SELECT with LIMIT
SELECT * FROM Employee
LIMIT 1; -- Sirf 1 row display hongi.

-- SELECT with ORDER BY
-- ASCENDING
SELECT * FROM Employee
ORDER BY age ASC;

-- DESCENDING
SELECT * FROM Employee
ORDER BY age DESC;

-- ORDER BY with multiple columns
SELECT * FROM Employee
ORDER BY city DESC,age ASC;

-- LIMIT with OFFSET
-- SELECT * FROM Employee
-- LIMIT number_of_rows OFFSET number_of_rows_to_skip;
-- LIMIT batata hai kitni rows chahiye, aur OFFSET batata hai starting mein kitni rows skip karni hain.

SELECT * FROM Employee
LIMIT 2 OFFSET 0;

-- CONCAT() Syntax– Multiple columns combine karna
-- SELECT CONCAT(value1, value2, value3, ...)
-- FROM table_name;

SELECT CONCAT(name,' ', city) AS Employee_INFO
FROM Employee;

SELECT CONCAT(name,' - ', city) AS Employee_INFO
FROM Employee;

-- String Functions – UPPER(), LOWER(), LENGTH()
-- A. UPPER()
SELECT UPPER(name) FROM Employee;

-- B. LOWER()
SELECT LOWER(city) FROM Employee;

-- C. LENGTH()
-- SYNTAX SELECT LENGTH(column_name)
-- FROM table_name;

SELECT name,LENGTH(name) AS Name_Length FROM Employee;
-- name nhi likhoge to directly length print hojaegi













