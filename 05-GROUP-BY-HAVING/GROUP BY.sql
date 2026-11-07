USE ST2_PRACTICE;
SELECT * FROM Students;
/*
GROUP BY ka use similar values wali rows ko groups mein divide karne ke liye hota hai.
SELECT city, COUNT(*) AS Total_Students
FROM Student
GROUP BY city;
city	Total_Students
Delhi	3
Mohali	2

*/

SELECT branch, COUNT(*) AS Total_Students
FROM Students
GROUP BY branch;
-- GROUP BY with multiple columns
SELECT branch,age,COUNT(*) AS Total_Students
FROM Students
GROUP BY branch,age;

-- GROUP BY with multiple aggregate functions
SELECT branch,COUNT(*) AS Total_Students,
AVG(marks) AS AVG_Marks,
MAX(marks) as Highest_Marks
FROM Students
GROUP BY branch;

/*
GROUP BY ke important rules
Rule 1
SELECT mein non-aggregated column generally GROUP BY mein hona chahiye.

Rule 2
Aggregate functions jaise COUNT, SUM, AVG, MIN, MAX groups par calculation karte hain.

Rule 3
GROUP BY ke baad normal row filtering ke liye WHERE nahi laga sakte. WHERE, GROUP BY se pehle aata hai.
*/

/*
SQL execution order
FROM
WHERE
GROUP BY
HAVING
SELECT
ORDER BY
LIMIT

Example:
SELECT city, AVG(marks) AS Average_Marks
FROM Student
WHERE marks > 60
GROUP BY city
HAVING AVG(marks) > 75
ORDER BY Average_Marks DESC
LIMIT 2;

1. FROM Student
   Sabse pehle Student table se data leta hai.

2. WHERE marks > 60
 60 se zyada marks wale students filter karta hai.

3. GROUP BY city
   Students ko city ke according groups mein divide karta hai.

4. HAVING AVG(marks) > 75
   Sirf un groups ko rakhta hai jinka average 75 se zyada hai.

5. SELECT city, AVG(marks)
   Ab decide karta hai ki output mein kaunse columns dikhane hain.

6. ORDER BY Average_Marks DESC
   Average marks ke descending order mein arrange karta hai.

7. LIMIT 2 
   Sirf top 2 rows show karta hai.
*/

/*
MySQL mein SELECT ke alias ko kahan use kar sakte hain aur kahan nahi, ye table yaad rakho:
SQL Clause	SELECT alias allowed?
FROM	No
WHERE	No
GROUP BY	Yes
HAVING	Yes
ORDER BY	Yes
LIMIT	Not applicable

*/
-- GROUP BY WITH WHERE
SELECT branch, AVG(marks) AS Average_Marks
FROM Students
WHERE marks > 70
GROUP BY branch;
-- GROUP BY ke saath WHERE bilkul use ho sakta hai. Bas SQL query mein WHERE, GROUP BY se pehle aata hai.

-- GROUP BY WITH WHERE AND HAVING
SELECT branch, AVG(marks) AS Average_Marks
FROM Students
WHERE marks > 70
GROUP BY branch
HAVING AVG(marks) > 80;









