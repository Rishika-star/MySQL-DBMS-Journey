-- SYNTAX
/*
SELECT MIN(column_name)
FROM table_name;
*/
USE ST2_PRACTICE;
SELECT * FROM Students;
-- MAX() with Alias (AS)
SELECT MAX(marks) AS Highest_marks
FROM Students;

-- MAX() with WHERE
SELECT MAX(marks)
FROM Students
WHERE branch = 'CSE';

-- MAX() with DISTINCT
SELECT MAX(DISTINCT marks)
FROM Students;-- Ye distinct marks mein se minimum value return karega.

-- MIN() with NULL Values
SELECT MAX(marks)
FROM Students;
/*
MIN() NULL values ko ignore karta hai.
Agar saari values NULL hain, result NULL aata hai.
*/

-- MAX() with GROUP BY
SELECT branch, MAX(marks) AS Highest_Marks
FROM Students
GROUP BY branch;

-- MAX() with HAVING
SELECT branch, MAX(marks) AS Highest_Marks
FROM Students
GROUP BY branch
HAVING MAX(marks) > 70;

-- MAX() with no matching rows
SELECT MAX(marks)
FROM Students
WHERE branch = 'EECE';
-- -- Agar EECE ka koi student nahi hai, toh result NULL hoga.