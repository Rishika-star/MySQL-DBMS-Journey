-- JOINS
/*
JOINS ka use do ya do se zyada tables ka related data combine karne ke liye hota hai.
Ab tak hum mostly ek table (Students) par queries kar rahe the. 
JOINS mein multiple tables ke saath kaam karenge.
*/

/*
JOINS kyun use karte hain?
Student Table
student_id	name	course_id
1	Riya	101
2	Aman	102
3	Rahul	103
4	Simran	104

Course Table
course_id	course_name
101	Java
102	Python
103	SQL
105	Web Development

Agar humein student ka naam aur uska course name ek saath chahiye, 
toh dono tables ka data combine karna padega.
*/

-- Types of JOINS
/*
1. INNER JOIN
Sirf matching records return karta hai.

2. LEFT JOIN
Left table ke saare records aur right table ke matching records.

3. RIGHT JOIN
Right table ke saare records aur left table ke matching records.

4. FULL OUTER JOIN
Dono tables ke saare records, matching ho ya na ho.

5. CROSS JOIN
Dono tables ki har possible row combination return karta hai.

6. SELF JOIN
Ek table ko usi table ke saath join karta hai.
*/

-- INNER JOIN
-- SYNTAX
/*
SELECT columns
FROM table1
INNER JOIN table2
ON table1.common_column = table2.common_column;
*/

CREATE TABLE Studentss (
    student_id INT PRIMARY KEY,
    name VARCHAR(50),
    course_id INT
);

INSERT INTO Studentss (student_id, name, course_id)
VALUES
(1, 'Riya', 101),
(2, 'Aman', 102),
(3, 'Rahul', 103),
(4, 'Simran', 104),
(5, 'Karan', 101);

CREATE TABLE Course (
    course_id INT PRIMARY KEY,
    course_name VARCHAR(50)
);
INSERT INTO Course (course_id, course_name)
VALUES
(101, 'Java'),
(102, 'Python'),
(103, 'SQL'),
(105, 'Web Development');







