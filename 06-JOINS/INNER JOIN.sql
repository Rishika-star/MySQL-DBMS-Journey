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
USE ST2_PRACTICE;
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

-- INNER JOIN
-- SYNTAX
/*
SELECT columns
FROM table1
INNER JOIN table2
ON table1.common_column = table2.common_column;



Syntax	                                       Meaning
SELECT columns	                      Dono tables se kaunse columns chahiye, decide karta hai.
FROM table1	                          First table select karta hai.
INNER JOIN table2	                  Second table ko first table ke saath join karta hai.
ON	Dono tables ko match karne ki 
condition batata hai.
table1.common_column = table2.common_column	Common column ki values match karta hai.
*/
SELECT Studentss.name,Course.course_name
FROM Studentss
INNER JOIN Course
ON Studentss.course_id=Course.course_id;

-- ONE MORE QUERY
SELECT Studentss.name
FROM Studentss
INNER JOIN Course
ON Studentss.course_id=Course.course_id;
-- Sirf 4 names jinke course IDs match karte hain.Sare names nhi.

-- Using Alias
SELECT S.name,C.course_name
FROM Studentss AS S
INNER JOIN Course AS C
ON S.course_id=C.course_id;

-- INNER JOIN with WHERE:
SELECT S.name, C.course_name
FROM Studentss AS S
INNER JOIN Course AS C
ON S.course_id = C.course_id
WHERE C.course_name='Java';

-- INNER JOIN with Three Tables
CREATE TABLE StudentDetails (
    student_id INT PRIMARY KEY,
    phone VARCHAR(15)
);

INSERT INTO StudentDetails (student_id, phone)
VALUES
(1, '9876543210'),
(2, '9876543211'),
(3, '9876543212'),
(5, '9876543214');

SELECT S.name,C.course_name,D.phone FROM 
Studentss S
INNER JOIN Course C
ON S.course_id=C.course_id
INNER JOIN StudentDetails AS D
ON S.student_id = D.student_id;

-- Multiple Matching Rows
SELECT C.course_name
FROM Studentss S
INNER JOIN Course C
ON S.course_id = C.course_id;
-- JAVA COMING 2 TIMES
-- INNER JOIN matching records find karta hai. due to course id 101 java 2 baar agya

/*

- Riya → Java
- Karan → Java
SQL ne Java ko duplicate nahi kiya. Actually, Java course ke saath do different 
students match hue hain.*/
/*
DISTINCT ka use kab hoga?
Agar humein sirf unique course names chahiye, toh:

SELECT DISTINCT C.course_name
FROM Student S
INNER JOIN Course C
ON S.course_id = C.course_id;
AB JAVA SIRF EK BAAR AAEGA
*/
SELECT DISTINCT C.course_name
FROM Studentss S
INNER JOIN Course C
ON S.course_id = C.course_id;

-- INNER JOIN with GROUP BY and Aggregate Functions
-- QUE- Find how many students are enrolled in each course.
SELECT
    C.course_name,
    COUNT(S.student_id) AS Total_Students
FROM Studentss S
INNER JOIN Course C
    ON S.course_id = C.course_id
GROUP BY course_name;
/*
COUNT(S.student_id)
Toh:
- Course 101 → 2 students
- Course 102 → 1 student
- Course 103 → 1 student
Hum student_id ke through hi count kar rahe hain, taaki pata chale ki har 
course mein kitne students enrolled hain.
GROUP BY course_name → Course-wise groups banata hai.
COUNT(student_id) → Har group mein students ki IDs count karta hai.
*/

-- INNER JOIN MISTAKES
-- Mistake 1: ON condition bhool jaana
SELECT S.name, C.course_name
FROM Studentss S
INNER JOIN Course C;

-- Wrong columns match karna
ON S.student_id = C.course_id
-- Ye logically incorrect hai. Humein course_id ko course_id se match karna hai.

-- Mistake 3: Ambiguous column name
-- Agar dono tables mein course_id hai, toh:
SELECT course_id
-- Ambiguous ho sakta hai. Isliye likho:
SELECT S.course_id

-- Mistake 4: INNER JOIN ko DISTINCT samajhna
-- INNER JOIN duplicate results automatically remove nahi karta. Uske liye DISTINCT use hota hai.




