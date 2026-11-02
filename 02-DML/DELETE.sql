USE ST2_PRACTICE;
-- Check records before deletion
SELECT * FROM Student;
-- Delete one student
DELETE FROM Student
WHERE id=5;

SELECT * FROM Student;

-- Delete students based on condition
DELETE FROM Student
WHERE marks<70;

SELECT * FROM Student;