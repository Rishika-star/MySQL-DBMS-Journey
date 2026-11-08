-- RIGHT JOIN
/*
RIGHT JOIN, LEFT JOIN ka opposite hota hai.
- Right table ke saare records return karta hai.
- Left table ke matching records return karta hai.
- Matching record nahi milne par left table ke columns mein NULL aata hai.
*/

-- Syntax
/*
SELECT columns
FROM table1
RIGHT JOIN table2
ON table1.common_column = table2.common_column;
*/
-- Query
SELECT S.name, C.course_name
FROM Studentss S
RIGHT JOIN Course C
ON S.course_id = C.course_id;
/*
Notice karo:
- Java ke saath Riya aur Karan match hue.
- Python ke saath Aman match hua.
- SQL ke saath Rahul match hua.
- Web Development ka koi student nahi hai, phir bhi woh output mein aaya.
Kyun? Kyunki Course right table hai aur RIGHT JOIN right table ke saare records preserve karta hai.
*/

/*
LEFT JOIN vs RIGHT JOIN
Ye exam ke liye important hai.
LEFT JOIN	                           RIGHT JOIN
Left table ke saare records	        Right table ke saare records
Right side unmatched ho toh NULL	Left side unmatched ho toh NULL
FROM wali table preserve hoti hai	JOIN ke baad wali table preserve hoti hai
*/
/*
Golden Rule:
- LEFT JOIN → Left table important.
- RIGHT JOIN → Right table important
*/

-- RIGHT JOIN with WHERE
-- Question: Sirf un courses ko display karo jinka koi student enrolled nahi hai.
SELECT S.name, C.course_name
FROM Studentss S
RIGHT JOIN Course C
ON S.course_id = C.course_id
WHERE S.student_id IS NULL;

/*
Yahan:
- RIGHT JOIN ne saare courses preserve kiye.
- WHERE S.student_id IS NULL ne unmatched courses filter kiye.
*/

-- RIGHT JOIN with COUNT() and GROUP BY
-- Question: Har course mein kitne students enrolled hain, including zero students wale courses?

SELECT C.course_name,
       COUNT(S.student_id) AS Total_Students
FROM Studentss S
RIGHT JOIN Course C
ON S.course_id = C.course_id
GROUP BY C.course_name;
-- Yahan COUNT(S.student_id) NULL values ko ignore karta hai, isliye Web Development ka count 0 aata hai.

-- RIGHT JOIN with Multiple Tables
SELECT S.name, C.course_name, D.phone
FROM Studentss S
RIGHT JOIN Course C
ON S.course_id = C.course_id
LEFT JOIN StudentDetails D
ON S.student_id = D.student_id;

/*
Is query mein:
- Course table ke saare records preserve honge.
- Student ke matching records milenge.
- StudentDetails se phone number match hoga.
- Missing student ya phone details ke liye NULL aayega.

*/








