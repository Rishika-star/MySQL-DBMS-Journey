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

SELECT * FROM Students_View;

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

-- Display / Retrieve Data from View
-- View create karne ke baad uska data dekhne ke liye:

SELECT *
FROM student_cse;

-- Specific columns:
SELECT name, marks
FROM cse_toppers;

-- Condition ke saath:
SELECT *
FROM Student_View
WHERE marks > 80;
-- Important: View ko SELECT se access karte hain, bilkul table ki tarah

-- Update Data Through View
UPDATE Students_view
SET marks = 95
WHERE age = 22;

SELECT * FROM Students_view;
-- Agar view updateable hai, toh original student table ka corresponding record bhi update hoga.

-- Insert Data Through View
INSERT INTO students_view
VALUES (5, 'Karan', 19, 88,'CSE');

SELECT * FROM Students_View;

-- Ye tabhi possible hai jab view insertable ho aur required columns/constraints satisfy hote hon.

-- Delete Data Through View
DELETE FROM students_view
WHERE id = 5;
SELECT * FROM Students_View;

-- Agar view updateable hai, toh underlying table se corresponding record delete ho jayega.
-- INSERT, UPDATE aur DELETE har view par possible nahi hote. Complex views par restrictions hoti hain.

-- Replace / Modify View
CREATE OR REPLACE VIEW student_cse AS
SELECT age,name,marks 
FROM students 
WHERE branch='CSE';

SELECT * FROM student_cse;
-- Isse existing view ki definition replace ho sakti hai.

-- Drop View
-- Question: Delete the view named cse_students.
DROP VIEW student_cse;

-- Agar view exist na kare toh error avoid karne ke liye:
DROP VIEW IF EXISTS cse_students;
-- DROP VIEW original table ko delete nahi karta.

-- Create View with Aggregate Functions
-- Question: Create a view showing branch-wise average marks.
CREATE VIEW branch_avg AS
SELECT branch,AVG(marks) AS avg_marks
FROM students
GROUP BY branch;
SELECT * FROM branch_avg;

-- Question: Create a view showing branch-wise student count.
CREATE VIEW branch_count AS
SELECT branch,COUNT(*) AS total_students
FROM students GROUP BY branch;
SELECT * FROM branch_Count;












