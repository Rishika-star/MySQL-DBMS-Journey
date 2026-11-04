USE ST2_PRACTICE;
SELECT * FROM Employee 
WHERE age>20;

-- 1.AND Operator
SELECT * FROM Employee
WHERE age>20 AND city='Bengaluru';

-- 2.NOT Operator
SELECT * FROM Employee
WHERE NOT city='Bengaluru';

-- 3. OR Operator
SELECT * FROM Employee
WHERE city='Bengaluru' OR city='Chandigarh';

-- 4. IN Operator
/* 
SYNTAX-
SELECT column_name
FROM table_name
WHERE column_name IN (value1, value2, ...);*/

SELECT * FROM Employee 
WHERE city IN('Bengaluru','Chandigarh');

-- Ye query iske equivalent hai:
SELECT * FROM Employee WHERE
city='Bengaluru' OR city='Chandigarh';

-- 5. NOT IN Operator
SELECT * FROM Employee
WHERE city NOT IN ('Bengaluru');

-- 6. BETWEEN Operator
/* 
SELECT *
FROM Student
WHERE column_name BETWEEN value1 AND value2;
*/

SELECT * FROM Employee
WHERE age BETWEEN 18 AND 25;

-- 7. NOT BETWEEN Operator
SELECT * FROM Employee
WHERE age NOT BETWEEN 18 AND 20;

-- 8. LIKE Operator
/*
SYNTAX-
SELECT column_name
FROM table_name
WHERE column_name LIKE 'pattern';
*/
-- LIKE ke saath 2 important wildcard characters use hote hain:
-- A. Percentage %
SELECT *
FROM Employee
WHERE name LIKE 'R%';

SELECT *
FROM Employee
WHERE name LIKE '%a';

-- B. Underscore _
/*
'_a%'- Second character a ho
'R___'- R ke baad exactly 3 characters
'____' - Exactly 4 characters
*/
SELECT *
FROM Employee
WHERE name LIKE 'R__';

-- 9. NOT LIKE Operator
-- Jab humein kisi pattern ko exclude karna ho.
SELECT *
FROM Employee
WHERE name NOT LIKE '%j';

-- Important difference
/*
Symbol	Meaning
%	Zero or more characters
_	Exactly one character
*/

-- 10. IS NULL
/*
Jin rows mein kisi column ki value NULL hai, unhe find karne ke liye.
Syntax:
SELECT *
FROM table_name
WHERE column_name IS NULL;
*/
SELECT *
FROM Employee
WHERE city IS NULL;

-- 11. IS NOT NULL
SELECT *
FROM Employee
WHERE city IS NOT NULL;

-- Important: NULL ko = se check nahi karte!
-- WHERE city = NULL; WRONG




