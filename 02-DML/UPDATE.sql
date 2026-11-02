USE ST2_PRACTICE;
UPDATE Student
SET marks=98
WHERE id=1;
SELECT * FROM Student;

UPDATE Student 
SET age=22,marks=90
WHERE id=2;
SELECT * FROM Student;

UPDATE Student
SET marks = marks + 5
WHERE city = 'Delhi';
SELECT * FROM Student;