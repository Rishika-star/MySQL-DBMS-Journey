-- HAVING Clause
-- HAVING ka use GROUP BY se bane hue groups ko filter karne ke liye hota hai.
SELECT branch, AVG(marks) AS Average_Marks
FROM Students
GROUP BY branch
HAVING AVG(marks) > 80;

-- HAVING ka Syntax
/*SELECT column_name, AGGREGATE_FUNCTION(column_name)
FROM table_name
GROUP BY column_name
HAVING condition;*/

-- HAVING with COUNT()
SELECT branch,COUNT(*) AS Total_students
FROM Students
GROUP BY branch
HAVING COUNT(*)>1;-- JINKA COUNT 1 SE ZYADA H

-- HAVING with SUM()
SELECT branch, SUM(marks) AS Total_Marks
FROM Students
GROUP BY branch
HAVING SUM(marks) > 150;

-- HAVING with MIN() and MAX()
SELECT branch, MAX(marks) AS Highest_Marks
FROM Students
GROUP BY branch
HAVING MAX(marks) > 90;

-- HAVING with multiple conditions
-- HAVING mein AND, OR, NOT bhi use kar sakte hain.
SELECT branch, COUNT(*) AS Total_Students,
       AVG(marks) AS Average_Marks
FROM Students
GROUP BY branch
HAVING COUNT(*) > 1 AND AVG(marks) > 80;

/*
WHERE vs HAVING – Most Important

WHERE	                                   HAVING
Individual rows filter karta hai	       Groups filter karta hai
GROUP BY se pehle execute hota hai	       GROUP BY ke baad execute hota hai
Aggregate functions generally use nahi     Aggregate functions use kar sakte hain
karte	
Raw rows par condition lagata hai	       Group calculations par condition lagata hai


SELECT city, AVG(marks) AS Average_Marks
FROM Student
WHERE marks > 70
GROUP BY city
HAVING AVG(marks) > 80;
*/

-- HAVING without GROUP BY
SELECT AVG(marks) AS Average_Marks
FROM Students
HAVING AVG(marks) > 80;
-- Yahan poori table ko ek single group ki tarah treat kiya jaata hai.













