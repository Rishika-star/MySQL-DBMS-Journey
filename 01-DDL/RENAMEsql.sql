USE ST2_PRACTICE;
SHOW TABLES;
SELECT * FROM Student;
-- Kisi ek table mein data insert karna
INSERT INTO Student(id, name, age, marks)
VALUES (1, 'Priya', 21, 93);

-- Kisi ek table ko rename karna
RENAME TABLE Student TO INFO;

-- Kisi ek table ko drop karna
DROP TABLE Student;-- DROP TABLE Student glt h kyuki ab uska name change ho chuka h to INFO so only INFO can be deleted;
DROP TABLE INFO;

SHOW TABLES;

-- Table rename karne ka alternate syntax:
-- ALTER TABLE Employee
-- RENAME TO Staff;


-- 4. Rename table with database name
-- RENAME TABLE ST2_PRACTICE.Employee
-- TO ST2_PRACTICE.Staff;

-- Column rename karna
-- ALTER TABLE Student
-- RENAME COLUMN name TO student_name;