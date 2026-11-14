-- CROSS JOIN
/*
SELECT columns
FROM table1
CROSS JOIN table2;
ek table ki har row ko doosri table ki har row ke saath combine kar diya jata hai.
*/
USE ST2_PRACTICE;
SELECT * FROM StudentDetails;
SELECT
    Studentss.name,
    Course.course_name
FROM Studentss
CROSS JOIN Course;

-- CROSS JOIN with WHERE
SELECT Studentss.name, Course.course_name
FROM Studentss
CROSS JOIN Course
WHERE Studentss.course_id = Course.course_id;

-- CROSS JOIN with multiple columns
SELECT Studentss.student_id,
       Studentss.name,
       Course.course_id,
       Course.course_name
FROM Studentss
CROSS JOIN Course;


-- CROSS JOIN with three tables
SELECT *
FROM Studentss
CROSS JOIN Course
CROSS JOIN StudentDetails;

-- CROSS JOIN vs comma syntax
-- Ye dono MySQL mein Cartesian product generate kar sakte hain
SELECT *
FROM Studentss
CROSS JOIN Course;

-- comma syntax
SELECT * FROM
Student,Course;

/*
INNER JOIN: Sirf matching records combine karta hai.
CROSS JOIN: Har possible combination banata hai, matching ki condition nahi dekhta.
*/