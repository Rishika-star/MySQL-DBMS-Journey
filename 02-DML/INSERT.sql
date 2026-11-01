USE ST2_PRACTICE;

INSERT INTO Student
VALUES
(1,'Riya',20,90,'Chandigarh'),
(2, 'Aman', 21, 85, 'Delhi'),
(3, 'Rahul', 19, 76, 'Mohali'),
(4, 'Simran', 20, 95, 'Patiala'),
(5, 'Karan', 22, 65, 'Delhi');

SELECT * FROM Student;

INSERT INTO Student(id,name,marks)
VALUES(6,'Neha',88);

SELECT * FROM Student;
