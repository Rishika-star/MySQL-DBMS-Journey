USE ST2_PRACTICE;
CREATE TABLE Students(
    id INT PRIMARY KEY,
    name VARCHAR(50),
    age INT,
    marks INT,
    branch VARCHAR(10)
);
INSERT INTO STUDENTS VALUES
(1,'Raj',22,100,'CSE'),
(2,'Rishika',18,100,'CSE'),
(3,'Riya',17,80,'ECE'),
(4,'Sohan',19,90,'ECE');

-- CREATE A VIEW
CREATE VIEW Students_View AS
SELECT * FROM STUDENTS;

SELECT * FROM Student_View;

-- Create View with Specific Columns
CREATE VIEW Students_Info AS 
SELECT name,age FROM STUDENTS;

SELECT * FROM Student_Info;

-- Create View with WHERE Condition
CREATE VIEW student_cse AS
SELECT name, branch FROM STUDENTS
WHERE branch='CSE';

SELECT * FROM cse_students; -- IS WALE ME KUCH PROBLEM AA RHI H

CREATE VIEW high_scorers AS
SELECT *
FROM student
WHERE marks > 80;-- YE CORRECT CHL GAYA

SELECT *
FROM high_scorers;

-- Create View with Multiple Conditions
CREATE VIEW cse_toppers AS
SELECT * FROM STUDENTS
WHERE branch='CSE'
AND marks>80;

SELECT * FROM cse_toppers;
SELECT name,branch FROM cse_toppers;
-- With condition in select
SELECT *
FROM  cse_toppers
WHERE marks > 75;














