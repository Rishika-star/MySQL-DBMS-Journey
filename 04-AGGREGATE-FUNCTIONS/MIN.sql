-- SYNTAX
/*
SELECT MIN(column_name)
FROM table_name;
*/
USE ST2_PRACTICE;
SELECT * FROM Students;
-- MIN() with Alias (AS)
SELECT MIN(marks) AS Lowest_marks
FROM Students;

-- MIN() with WHERE
SELECT MIN(marks)
FROM Students
WHERE branch = 'CSE';

-- MIN() with DISTINCT
SELECT MIN(DISTINCT marks)
FROM Students;-- Ye distinct marks mein se minimum value return karega.

-- MIN() with NULL Values
SELECT MIN(marks)
FROM Students;
/*
MIN() NULL values ko ignore karta hai.
Agar saari values NULL hain, result NULL aata hai.
*/

-- MIN() with GROUP BY
SELECT branch, MIN(marks) AS Lowest_Marks
FROM Students
GROUP BY branch;

-- MIN() with HAVING
SELECT branch, MIN(marks) AS Lowest_Marks
FROM Students
GROUP BY branch
HAVING MIN(marks) > 70;

-- MIN() with no matching rows
SELECT MIN(marks)
FROM Student
WHERE branch = 'EECE';
-- -- Agar EECE ka koi student nahi hai, toh result NULL hoga.













