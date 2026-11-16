USE ST2_PRACTICE;
-- Ranking Functions
-- Ranking functions rows ko rank ya number assign karte hain.
-- A. ROW_NUMBER()
-- Definition: Assigns a unique sequential number to each row.
/*
Syntax:

ROW_NUMBER() OVER(
    ORDER BY marks DESC
)
*/

-- Query:
SELECT name,marks,ROW_NUMBER() OVER(
    ORDER BY marks DESC
) AS row_num
FROM Student;
-- Same marks hone par bhi unique row numbers milenge

-- B. RANK()
-- Definition: Assigns the same rank to rows having equal values, but skips subsequent rank numbers.
SELECT
    name,
    marks,
    RANK() OVER(
        ORDER BY marks DESC
    ) AS student_rank
FROM Students;

-- Rank 2 skip ho gaya.

-- DENSE_RANK()
-- Definition: Assigns the same rank to equal values without skipping subsequent rank numbers.
-- Query:
SELECT
    name,
    marks,
    DENSE_RANK() OVER(
        ORDER BY marks DESC
    ) AS a -- some problemm at this line
FROM Student;

-- Aggregate Window Functions
/*
Important functions:
- SUM()
- AVG()
- COUNT()
- MIN()
- MAX()
*/

-- A. SUM() OVER()
SELECT
    name,
    marks,
    SUM(marks) OVER() AS total_marks
FROM Students;

-- B. AVG() OVER()
SELECT
    name,
    marks,
    AVG(marks) OVER() AS average_marks
FROM Students;

-- C. COUNT() OVER()
-- Total number of rows count karna.
SELECT
    name,
    marks,
    COUNT(*) OVER() AS total_students
FROM Studentss;

-- D. MIN() OVER()
SELECT
    name,
    marks,
    MIN(marks) OVER() AS minimum_marks
FROM Students;

-- E. MAX() OVER()
SELECT
    name,
    marks,
    MAX(marks) OVER() AS maximum_marks
FROM StudentS;


-- BRANCH-wise aggregate
SELECT
    name,
    branch,
    marks,
    SUM(marks) OVER(
        PARTITION BY branch
    ) AS department_total
FROM Students;

-- Ismein CSE aur ECE ka total separately calculate hoga.

-- LEAD() and LAG()
-- Ye functions current row ko next ya previous row ke saath compare karne mein useful hain

-- A. LEAD()
-- Definition: LEAD() accesses a value from a subsequent row in the window

SELECT name,marks, LEAD(marks)
OVER(
    ORDER BY marks DESC
) AS next_marks
FROM Students;

-- B. LAG()
-- Definition: LAG() accesses a value from a preceding row in the window.
SELECT name,marks,LAG(marks) OVER(
    ORDER BY marks DESC
)
AS previous_marks
FROM Students;

/*
Additional syntax
LEAD(marks, 1, 0) OVER(ORDER BY marks DESC)
- `marks`: column
- `1`: kitni rows aage jaana hai
- `0`: agar next row nahi mile toh default value

Similarly:
LAG(marks, 1, 0) OVER(ORDER BY marks DESC) 

*/


-- FIRST_VALUE() and LAST_VALUE()
-- A. FIRST_VALUE()
-- Definition: Returns the first value from the window frame.
SELECT name,marks,FIRST_VALUE(name) OVER(
    ORDER BY marks DESC
)AS highest_marks_students
FROM Students;

-- B. LAST_VALUE()
-- Definition: Returns the last value from the current window frame.
-- SYNTAX
/*
LAST_VALUE(column_name) OVER(
    ORDER BY column_name
    ROWS BETWEEN UNBOUNDED PRECEDING
    AND UNBOUNDED FOLLOWING
)
*/

SELECT name,marks,LAST_VALUE(name) OVER(
    ORDER BY marks DESC
    ROWS BETWEEN UNBOUNDED PRECEDING
    AND UNBOUNDED FOLLOWING
) AS lowest_marjs_student
FROM Students;
/*
LAST_VALUE(name) – window frame ki last row ka name return karega.
ORDER BY marks DESC – highest se lowest marks arrange karega.
UNBOUNDED PRECEDING – first row se start.
UNBOUNDED FOLLOWING – last row tak include karega.
*/
-- isk bina likhoge to:
-- Starting: First row se.
-- Ending: Current row tak.


-- Lekin agar tum ye lagao: Toh poori window include hogi aur har row mein Simran aayega.
/*
Main difference: Frame ke bina bhi rows include hoti hain, bas current row tak. 
Explicit frame lagane par poori window include hoti hai.
*/


/*
9. Window Frame
Window Frame decide karta hai ki current row ke relative kaunsi rows calculation mein include hongi.

Important keywords:
Keyword	               Meaning
ROWS	               Physical rows ke basis par frame
UNBOUNDED PRECEDING	   Partition ki first row se
CURRENT ROW	           Current row tak
n PRECEDING	           Current row se n rows pehle
n FOLLOWING	           Current row se n rows aage
UNBOUNDED FOLLOWING	   Partition ki last row tak
*/

-- 1. Running Total
-- Current row tak ka cumulative total.
SELECT name,
    marks,SUM(marks) OVER(
        ORDER BY  name
        ROWS BETWEEN UNBOUNDED PRECEDING
    AND CURRENT ROW
    )AS running_total
FROM Student;

-- B. Moving Average
SELECT name,marks,AVG(marks) OVER(
    ORDER BY name
    ROWS BETWEEN 1 PRECEDING
    AND CURRENT ROW
    ) AS moving_avg
FROM Students;
-- Ismein current row aur usse immediately previous row ka average calculate hoga.

-- C. Next Two Rows ka Total
SELECT name,marks,SUM(marks) OVER(
    ORDER BY name
    ROWS BETWEEN CURRENT ROW
    AND 2 FOLLOWING
)
FROM Students;

-- D. Previous Two Rows ka Total

SELECT name,marks,SUM(marks) OVER(
    ORDER BY name
    ROWS BETWEEN 2 PRECEDING
    AND CURRENT ROW
)
FROM Students;
-- current student ke marks + usse pehle ke 2 students ke marks ka total calculate ho raha hai.

-- E. Complete Partition ka Total
SELECT name,marks,SUM(marks) OVER(
    PARTITION BY branch
    ROWS BETWEEN UNBOUNDED PRECEDING
    AND UNBOUNDED FOLLOWING
)
FROM Students;
-- Complete Partition Total ka matlab hai: har row ke saath uski complete partition (group) ka total marks display karna.

-- PARTITION BY + ORDER BY Together
-- Dono ko combine karke powerful queries bana sakte hain.

-- Question: Har department mein students ko marks ke basis par rank do.
SELECT
    name,
    branch,
    marks,
    RANK() OVER(
        PARTITION BY branch
        ORDER BY marks DESC
    ) AS branch_rank
FROM Students;

-- Dono CSE students ko 1 isliye mila kyunki unke marks same hain (100) aur tumne RANK() use kiya hai.
-- RANK()-Same marks wale students ko same rank milti hai.

/*
PARTITION BY department: separate departments.
ORDER BY marks DESC: highest marks first.
RANK(): har department ke andar ranking
*/







