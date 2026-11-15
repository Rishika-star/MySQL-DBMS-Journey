-- Subquery with SELECT
-- Jab hum SELECT statement ke andar subquery likhte hain, use Subquery in SELECT clause kehte hain.
/*
Syntax
SELECT
    column_name,
    (SELECT aggregate_function(column_name)
     FROM table_name) AS alias_name
FROM another_table;
*/

-- Question: Display each student's name along with the total number of students.
SELECT name,(SELECT COUNT(*) FROM Studentss) 
AS total_Students
FROM Studentss;

/*
INNER QUERY-
SELECT COUNT(*)
FROM Student;
Ye Student table ke total records count karegi.

Result: 5

Outer Query:
SELECT name
FROM Student;
Ye saare students ke names display karegi.
*/

-- Subquery with FROM
/*
Jab hum FROM clause ke andar subquery likhte hain, toh use Subquery in FROM clause kehte hain.
Ismein subquery ka result ek temporary table ki tarah use hota hai.
Is temporary table ko Derived Table bhi kehte hain.
*/

/*
2. Syntax
SELECT columns
FROM (
    SELECT columns
    FROM table_name
    WHERE condition
) AS temporary_table;
*/
-- Important: FROM ke andar subquery ko alias dena compulsory hai.
SELECT *
FROM (
    SELECT name, course_id
    FROM Studentss
    WHERE course_id > 101
) AS temp;

/*
Ismein:
1. Inner query records filter karti hai.
2. Uska result temp naam se available hota hai.
3. Outer query temp se data fetch karti hai.
*/
-- Subquery in FROM = Temporary/Derived Table, not a permanent table

/*
NESTED SUBQUERIES
1. Definition – What is a Nested Subquery?
Jab ek subquery ke andar another subquery likhi jaati hai, toh use Nested Subquery kehte hain.

Matlab ek query ke andar query, aur uske andar ek aur query.
- Inner-most query sabse pehle execute hoti hai.
- Uska result next query ko milta hai.
- Finally outer query result return karti hai.
*/

-- Syntax
/*
SELECT columns
FROM table_name
WHERE column_name = (
    SELECT column_name
    FROM another_table
    WHERE condition = (
        SELECT column_name
        FROM third_table
        WHERE condition
    )
);
*/
-- Question: Find the names of students enrolled in the course whose name is Java.
SELECT name
FROM Studentss
WHERE course_id = (
    SELECT course_id
    FROM Course
    WHERE course_name = (
        SELECT course_name
        FROM Course
        WHERE course_id = 101
    )
);

-- Inner-most Query - Output: Java
-- Middle Query - Output: 101
-- Outer Query - name - Riya Karan

-- Nested Subquery with IN
SELECT name
FROM Studentss
WHERE course_id IN (
    SELECT course_id
    FROM Course
    WHERE course_id IN (
        SELECT course_id
        FROM Course
        WHERE course_name = 'Java'
    )
);
-- Yahan inner query Java ka course ID find karegi, aur outer query us course ke students find karegi.

-- Nested Subquery with MAX()
SELECT name, course_id
FROM Studentss
WHERE course_id = (
    SELECT MAX(course_id)
    FROM Course
);

-- CORRELATED SUBQUERIES
/*
Correlated Subquery ek aisi subquery hoti hai jo Outer Query par depend karti hai.

Matlab inner query ko execute hone ke liye outer query ki current row ki value chahiye hoti hai.
- Normal Subquery: Inner query independently execute ho sakti hai.
- Correlated Subquery: Inner query outer query ki value use karti hai.
- Outer query ki har row ke liye subquery evaluate hoti hai.

*/

/*
Syntax
SELECT columns
FROM table1 AS A
WHERE condition (
    SELECT column
    FROM table2 AS B
    WHERE B.column = A.column
);
Yahan A.column outer query ke table ko refer karta hai.
*/

-- Question: Find the names of students whose course IDs exist in the Course table using a correlated subquery.

SELECT name, course_id
FROM Studentss AS S
WHERE EXISTS (
    SELECT 1
    FROM Course AS C
    WHERE C.course_id = S.course_id
);
/*
select 1 mtlb
SELECT 1 ka matlab hai ki SQL query har matching row ke liye bas constant value 1 return karegi.

EXISTS ke andar humein actual data ki zarurat nahi hoti. Humein sirf check karna hota hai 
ki matching record exist karta hai ya nahi.
*/

/*
Syntax	Meaning
SELECT 1	Constant value select
SELECT *	All columns select
SELECT course_id	Specific column select
*/

-- Subquery vs JOIN
/*
JOIN: Do ya more tables ko related columns ke basis par combine karta hai.
Subquery: Ek SQL query ke andar doosri SQL query likhte hain. Inner query ka result outer
query use karti hai.
*/
-- Same problem using JOIN and Subquery

-- Method 1: Using JOIN
SELECT S.name, C.course_name
FROM Studentss AS S
INNER JOIN Course AS C
ON S.course_id = C.course_id
WHERE C.course_name = 'Java';

-- Method 2: Using Subquery
SELECT name
FROM Studentss
WHERE course_id = (
    SELECT course_id
    FROM Course
    WHERE course_name = 'Java'
);