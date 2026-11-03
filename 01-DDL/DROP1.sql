USE ST2_PRACTICE;
CREATE TABLE Demo(
id INT,
name VARCHAR(50)

);
-- Check table structure

DESCRIBE Demo;

-- Check available tables
SHOW TABLES;

-- DROP kaha kaha use ho skta h kis kis form me 
-- 1. Table drop
DROP TABLE Demo;

-- 2. Database drop
DROP DATABASE ST2_PRACTICE;

-- 3. Column drop
ALTER TABLE Demo
DROP column name;

