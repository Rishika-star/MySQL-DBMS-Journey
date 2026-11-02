USE ST2_PRACTICE;
-- Column named gender with values null

ALTER TABLE Student
ADD gender VARCHAR(10);
SELECT * FROM Student;

-- Modify column datatype/size
ALTER TABLE Student
MODIFY name VARCHAR(100);-- SIZE 50 SE 100 KRDIYA

-- Rename Column
ALTER TABLE Student
RENAME COLUMN gender TO student_gender;
SELECT * FROM Student;

-- Drop a column
ALTER TABLE Student
DROP COLUMN student_gender;
SELECT * FROM Student;