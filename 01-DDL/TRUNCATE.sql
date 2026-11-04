USE ST2_PRACTICE;
SHOW TABLES;
SELECT * FROM Demo;
INSERT INTO Demo VALUES
(1,'RAJ'),
(2,'RISHIKA');
-- Display records before truncate
SELECT * FROM Demo;

-- Remove all records
TRUNCATE TABLE Demo;

-- Verify table is empty
SELECT * FROM Demo;


-- Verify table structure still exists
DESCRIBE Demo;
-- TRUNCATE is a DDL command in MySQL.It removes all rows from a table.WHERE clause is not allowed.
-- Table structure remains unchanged.