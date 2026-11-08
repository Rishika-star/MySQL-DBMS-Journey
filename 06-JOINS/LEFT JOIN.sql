-- LEFT JOIN
/*
LEFT JOIN:
- Left table ke saare records return karta hai.
- Right table ke sirf matching records return karta hai.
- Agar match nahi milta, toh right table ke columns mein NULL aata hai.
*/

/*
SYNTAX-
SELECT columns
FROM table1
LEFT JOIN table2
ON table1.common_column = table2.common_column;
*/
USE ST2_PRACTICE;
SELECT S.name,C.course_name
FROM Studentss S
LEFT JOIN Course C
ON S.course_id = C.course_id;

/*
5. INNER JOIN vs LEFT JOIN
Ye difference exam mein bahut important hai.
INNER JOIN	                            LEFT JOIN
Sirf matching records	            Left table ke all records
Unmatched rows exclude	            Unmatched rows include
Matching na ho toh row nahi aati	Right-side columns mein NULL
*/
-- INNER JOIN
SELECT S.name, C.course_name
FROM Studentss S
INNER JOIN Course C
ON S.course_id = C.course_id;

-- Simran ki id ka match not found isliye excluded
-- Output: 4 rows.

-- LEFT JOIN
SELECT S.name, C.course_name
FROM Studentss S
LEFT JOIN Course C
ON S.course_id = C.course_id;
-- Output: 5 rows.

-- LEFT JOIN with WHERE
-- Question: Un students ko display karo jinka course match nahi hua.
SELECT S.name,C.course_name
FROM Studentss S
LEFT JOIN Course C
ON S.course_id = C.course_id
WHERE C.course_id IS NULL;

/*
LEFT JOIN ne saare students include kiye.
Simran ka course match nahi hua.
WHERE C.course_id IS NULL ne sirf unmatched students filter kar diye.
*/


-- LEFT JOIN with COUNT() and GROUP BY
-- Question: Har course mein kitne students enrolled hain, including courses with zero students?
SELECT C.course_name,
       COUNT(S.student_id) AS Total_Students
FROM Course C
LEFT JOIN Studentss S
ON C.course_id = S.course_id
GROUP BY C.course_name;

-- question mein humein jis table ka complete data chahiye usko FROM k aage likhenge
/* Humein Course table ke saare courses chahiye, including Web Development jisme 
koi student enrolled nahi hai.*/

-- . LEFT JOIN with Three Tables

SELECT
    S.name,
    C.course_name,
    D.phone
FROM Studentss S
LEFT JOIN Course C
    ON S.course_id = C.course_id
LEFT JOIN StudentDetails D
    ON S.student_id = D.student_id;

-- LEFT JOIN with multiple conditions
SELECT S.name, C.course_name
FROM Studentss S
LEFT JOIN Course C
    ON S.course_id = C.course_id
    AND C.course_name = 'Java';

-- JAVA Ka match nhi mila still wo rows included h left join CONFIGURE REST METADATA

-- LEFT JOIN – Common Mistakes
-- Mistake 1: Table order galat rakhna
-- Question: Saare courses chahiye, including zero students wale courses.
-- Incorrect:
FROM Student S
LEFT JOIN Course C
ON S.course_id = C.course_id;

-- Correct:
FROM Course C
LEFT JOIN Student S
ON C.course_id = S.course_id;

-- Mistake 2: WHERE condition se unmatched rows remove kar dena
SELECT S.name, C.course_name
FROM Student S
LEFT JOIN Course C
ON S.course_id = C.course_id
WHERE C.course_name = 'Java';

-- Ye sirf Java wale matching students return karega. Simran jaisi unmatched row remove ho jayegi.
-- LEFT JOIN ka main purpose hi unmatched rows ko preserve karna hai.
--  LEFT JOIN mein WHERE condition ki wajah se unmatched rows remove ho sakti hain
-- Agar unmatched rows bhi preserve karni hain aur Java matches bhi chahiye?
-- Condition ko ON mein rakho:

SELECT S.name, C.course_name
FROM Student S
LEFT JOIN Course C
ON S.course_id = C.course_id
AND C.course_name = 'Java';

-- Mistake 3: COUNT(*) use karna
-- Zero students wale courses count karne ke liye:
SELECT C.course_name,
       COUNT(S.student_id) AS Total_Students
FROM Course C
LEFT JOIN Student S
ON C.course_id = S.course_id
GROUP BY C.course_name;

/*
Yahan COUNT(S.student_id) important hai.
- COUNT(*) unmatched course ki NULL-extended row ko bhi count karega.
- COUNT(S.student_id) NULL ignore karega, isliye result 0 aayega.


*/






