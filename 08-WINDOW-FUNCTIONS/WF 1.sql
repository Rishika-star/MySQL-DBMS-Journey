-- WINDOWS FUNCTION
/*
Window Functions perform calculations across a set of related rows without combining them into a 
single row. They return a result for each row while preserving the individual rows.
*/

/*
Maan lo Student table mein 5 students hain. Tumhe har student ke marks ke saath class ke average marks bhi display karne hain.
- Normal AVG() with GROUP BY use karoge toh har group ka ek result milega.
- Window Function use karoge toh har student ki individual row bhi rahegi aur average bhi show hoga.
*/

-- Window Function Syntax
/*
SELECT
    column_name,
    WINDOW_FUNCTION() OVER (
        PARTITION BY column_name
        ORDER BY column_name
    )
FROM table_name;
*/
/*
Part	                 Meaning
Window         Function	AVG(), SUM(), ROW_NUMBER() etc.
OVER()	       Batata hai ki calculation window ke across perform hogi
PARTITION BY   Rows ko groups mein divide karta hai
ORDER BY	   Window ke andar rows ka order decide karta hai
*/

-- QUE - Har student ke naam, age aur marks ke saath uske branch ka average marks display karo.
USE ST2_PRACTICE;
select * from students;
SELECT name,age,marks,
AVG(marks) OVER(
    PARTITION BY branch
) AS branch_avg
FROM Students;

-- GROUP BY vs Window Function
-- Using GROUP BY:
SELECT branch,AVG(marks)
AS avg_marks FROM Students
GROUP BY branch;

-- GROUP BY individual student records ko combine kar dega

-- Using WINDOWS FUNCTION
SELECT branch ,AVG(marks)
OVER(
    PARTITION BY branch
) AS branch_avg_marks
FROM Students;


-- jb mene partition by branch nhi likha to ek avg value nikli and har row me same value chli gyi
-- kb partition by branch likha to har ek branch ki apni avg value bni and har ek row me gyi sare records bhi show hue branch k according koi groups nhi bane

-- OVER() Clause
-- OVER() defines the window of rows on which a window function performs its calculation.
-- Syntax
/*
SELECT
    column_name,
    WINDOW_FUNCTION() OVER()
FROM table_name;
*/

SELECT name,marks,AVG(marks) OVER() AS avg_marks
FROM Students;
-- Yahan AVG(marks) complete table ke marks ka average calculate karega.
-- sbko ek hi avg milega

-- PARTITION BY
-- PARTITION BY divides rows into separate groups or partitions for window calculations.
-- Simple meaning: Ek table ko groups mein divide karna, lekin original rows ko remove kiye bina.

/*Syntax
FUNCTION_NAME() OVER(
    PARTITION BY column_name
)*/

SELECT
    name,
    branch,
    marks,
    AVG(marks) OVER(
        PARTITION BY branch
    ) AS branch_avg
FROM Students;

-- ORDER BY inside OVER()
-- ORDER BY specifies the sequence in which rows are processed inside a window

/*
Syntax
FUNCTION_NAME() OVER(
    ORDER BY column_name ASC
)
*/

SELECT name,branch,marks,AVG(marks) OVER(
    ORDER BY marks DESC
) AS row_num
FROM Students;

-- Example
SELECT
    name,
    marks,
    ROW_NUMBER() OVER(
        ORDER BY marks DESC
    ) AS row_num
FROM Students;

-- isse jo ordering hui wo calculation k basis pe hui
-- FINAL ordering k liye jese hume names k acc krni h to usk liye outer query mein bhi ORDER BY lagao.




