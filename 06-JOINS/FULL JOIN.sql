-- FULL JOIN
/*
FULL OUTER JOIN dono tables ke saare records return karta hai:
- Jo records dono tables mein match karte hain.
- Jo sirf LEFT table mein hain.
- Jo sirf RIGHT table mein hain.
Jahan matching record nahi hota, wahan NULL aata hai.
*/

USE ST2_PRACTICE;
-- Syntax
/*
SELECT columns
FROM table1
LEFT JOIN table2
ON table1.column=table2.column

UNION

SELECT columns
FROM table1
RIGHT JOIN table2
ON table1.column = table2.column;
*/
SELECT * FROM Studentss;
SELECT * FROM Course;

-- 1st Query WITH UNION
-- UNION duplicate rows ko automatically remove kar deta hai.
SELECT Studentss.student_id,
Studentss.name,
Studentss.course_id,
Course.course_name
FROM Studentss
LEFT JOIN Course
ON Studentss.course_id=Course.course_id

UNION

SELECT *
FROM Studentss
RIGHT JOIN Course
ON Studentss.course_id = Course.course_id;

-- WITH UNION ALL
-- UNION ALL duplicate rows ko remove nahi karta. Saari rows include karta hai.

SELECT *
FROM Studentss
LEFT JOIN Course
ON Studentss.course_id = Course.course_id

UNION ALL

SELECT *
FROM Studentss
RIGHT JOIN Course
ON Studentss.course_id = Course.course_id;


-- UNION ALL (with WHERE condition)
SELECT *
FROM Studentss
LEFT JOIN Course
ON Studentss.course_id = Course.course_id

UNION ALL

SELECT *
FROM Studentss
RIGHT JOIN Course
ON Studentss.course_id = Course.course_id
WHERE Studentss.student_id IS NULL;
-- WHERE hamesha last mein nahi lagta. Ye depend karta hai ki tum kis query mein use kar rahi ho.

SELECT name FROM Studentss
WHERE course_id = 101

UNION

SELECT course_name FROM Course
WHERE course_id = 105;






















