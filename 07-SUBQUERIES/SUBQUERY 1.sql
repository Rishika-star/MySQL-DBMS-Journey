-- SUBQUERIES
/*
Subquery ka matlab hai ek SQL query ke andar doosri SQL query likhna.
- Inner Query: Jo query andar likhi hoti hai.
- Outer Query: Jo main query hoti hai.
Subquery ka result outer query ko diya jata hai.
Isko Nested Query bhi kehte hain.
*/

-- SYNTAX
/*
SELECT columns
FROM table_name
WHERE column_name OPERATOR
    (SELECT column_name
     FROM table_name
     WHERE condition);
*/

-- Question: Find the name of the student who is enrolled in the Java course.
-- Single-Row Subquery
USE ST2_PRACTICE;
SELECT name
FROM Studentss 
WHERE course_id=(
    SELECT course_id
    FROM Course
    WHERE course_name = 'Java'
);
-- Jab inner query sirf ek value (one row) return karti hai, use Single-Row Subquery kehte hain.
/*
Common operators:
=, >, <, >=, <=, <>
*/

-- Multiple-Row Subquery
-- Jab inner query multiple values (multiple rows) return karti hai, use Multiple-Row Subquery kehte hain.
SELECT name
FROM Studentss
WHERE course_id IN (
    SELECT course_id
    FROM Course
    WHERE course_id > 101
);
-- Subquery returns more than 1 row
/*
Common operators:
- IN
- NOT IN
- ANY
- ALL
- EXISTS
- NOT EXISTS
*/

-- IN and NOT IN in Subqueries

/*
1. IN Operator
IN operator check karta hai ki koi value given list of values mein present hai ya nahi.
Subquery ke saath iska use tab hota hai jab inner query multiple values return karti hai.
*/
-- Syntax:
/*
SELECT columns
FROM table_name
WHERE column_name IN (
    SELECT column_name
    FROM another_table
    WHERE condition
);
*/

-- Question: Find the names of students enrolled in courses whose IDs are greater than 101.
SELECT name
FROM Studentss
WHERE course_id IN(
    SELECT course_id
    FROM Course
    WHERE course_id>101
);

-- INNER QUERY WILL GIVE course_id
-- OUTER QUERY WILL GIVE student names

/*
5. NOT IN Operator
NOT IN iska opposite hai.
Ye un records ko return karta hai jinki value inner query se
returned values mein present nahi hoti.
*/

-- Question: Find the students who are NOT enrolled in courses whose IDs are greater than 101.
SELECT name
FROM Studentss
WHERE course_id NOT IN (
    SELECT course_id
    FROM Course
    WHERE course_id > 101
);

-- ANY and ALL Operators
-- ANY ka meaning: At least one value ke saath condition TRUE honi chahiye.
-- Syntax
/*SELECT columns
FROM table_name
WHERE column_name operator ANY (
    SELECT column_name
    FROM another_table
    WHERE condition
);*/


SELECT name,course_id
FROM Studentss
WHERE course_id>ANY(
    SELECT course_id
    FROM Course
    WHERE course_id<105
);
/*Ab condition hai:
course_id > ANY (101, 102, 103)
Matlab course ID inmein se at least ek value se greater honi chahiye.
*/

-- ALL Operator
-- ALL ka use tab hota hai jab condition subquery se return hui saari values ke liye TRUE honi chahiye.
/*
Syntax
SELECT columns
FROM table_name
WHERE column_name operator ALL (
    SELECT column_name
    FROM another_table
    WHERE condition
);
*/

/*4. Example – ALL
Question: Find students whose course ID is greater than ALL course IDs returned by the subquery.
*/
SELECT name, course_id
FROM Student
WHERE course_id > ALL (
    SELECT course_id
    FROM Course
    WHERE course_id < 105
);
/*
Inner query returns:
101, 102, 103

Ab condition hai:
course_id > ALL (101, 102, 103)

Matlab course ID 101, 102 aur 103 teeno se greater honi chahiye.
Output:
name	course_id
Simran	104
*/

/*
ANY vs ALL
ANY	ALL
At least one value	All values
One condition true is enough	Every condition must be true
Less restrictive	More restrictive
*/
/*
6. Important operators
ANY aur ALL ke saath comparison operators use kar sakte hain:
- >
- <
- =
- >=
- <=
- <>
*/

-- 14. EXISTS and NOT EXISTS
/*
1. EXISTS Operator
EXISTS check karta hai ki subquery koi record return karti hai ya nahi.
- Agar subquery at least one row return karti hai → TRUE.
- Agar koi row return nahi hoti → FALSE.
*/

/*
Syntax
SELECT columns
FROM table_name
WHERE EXISTS (
    SELECT columns
    FROM another_table
    WHERE condition
);
*/

-- QUE-Find students whose course IDs exist in the Course table.
SELECT name,course_id 
FROM Studentss AS S 
WHERE EXISTS(
    SELECT course_id
    FROM Course AS C
    WHERE C.course_id=S.course_id
);

-- Simran ka course ID 104 Course table mein present nahi hai, isliye woh output mein nahi aayegi.


-- NOT EXISTS Operator
-- Ye un records ko return karta hai jinke liye subquery koi matching row return nahi karti.
/*
Syntax
SELECT columns
FROM table_name
WHERE NOT EXISTS (
    SELECT columns
    FROM another_table
    WHERE condition
);
*/

-- Question: Find students whose course IDs do not exist in the Course table.
SELECT name,course_id
FROM Studentss AS S 
WHERE NOT EXISTS(
    SELECT course_id
    FROM Course AS C
    WHERE C.course_id=S.course_id
);

/*
5. EXISTS vs NOT EXISTS
EXISTS	NOT EXISTS
Matching row exists	Matching row does not exist
Returns TRUE if row found	Returns TRUE if no row found
Finds matching records	Finds non-matching records

6. Important Points
- EXISTS aur NOT EXISTS subqueries ke saath use hote hain.
- Ye values compare karne ke bajaye rows ki existence check karte hain.
- Correlated subqueries mein inka use common hai.
- SELECT 1 bhi EXISTS ke andar use kar sakte hain.

*/





