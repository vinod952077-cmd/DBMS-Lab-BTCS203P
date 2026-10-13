-- ========================================================
-- Lab Sheet 3: SQL Functions (MySQL Workbench)
-- ========================================================

USE CollegeDB;

-- A. Number Functions
-- 1. ABS()
SELECT ABS(-45.75) AS Absolute_Value;

-- 2. ROUND()
SELECT ROUND(123.4567, 2) AS Rounded_Value;

-- 3. CEIL() and FLOOR()
SELECT CEIL(25.3) AS Ceil_Value, FLOOR(25.8) AS Floor_Value;

-- 4. MOD()
SELECT MOD(29, 5) AS Remainder;

-- 5. Rounded salary of employees
SELECT Emp_Name, Salary, ROUND(Salary) AS Rounded_Salary FROM Employee;


-- B. Aggregate Functions
-- 6. COUNT() total students
SELECT COUNT(*) AS Total_Students FROM Student;

-- 7. SUM() total salary
SELECT SUM(Salary) AS Total_Salary FROM Employee;

-- 8. AVG() average salary
SELECT AVG(Salary) AS Average_Salary FROM Employee;

-- 9. MAX() highest salary
SELECT MAX(Salary) AS Highest_Salary FROM Employee;

-- 10. MIN() lowest salary
SELECT MIN(Salary) AS Lowest_Salary FROM Employee;


-- C. Character Functions
-- 11. UPPER()
SELECT Name, UPPER(Name) AS Upper_Name FROM Student;

-- 12. LOWER()
SELECT Name, LOWER(Name) AS Lower_Name FROM Student;

-- 13. LENGTH()
SELECT Name, LENGTH(Name) AS Name_Length FROM Student;

-- 14. CONCAT()
SELECT CONCAT(Emp_Name, ' works in ', Department) AS Employee_Info FROM Employee;

-- 15. SUBSTRING() / SUBSTR()
SELECT Name, SUBSTRING(Name, 1, 4) AS Short_Name FROM Student;


-- D. Conversion Functions
-- 16. Convert number into character/string
SELECT CAST(12345 AS CHAR) AS Number_To_String;

-- 17. Convert string into numeric value
SELECT CAST('9876' AS UNSIGNED) AS String_To_Number;

-- 18. Convert a date value into a different format
SELECT DATE_FORMAT(CURDATE(), '%d-%M-%Y') AS Formatted_Date;

-- 19. CAST() demonstration
SELECT CAST(150.75 AS SIGNED) AS Casted_Integer;

-- 20. CONVERT() demonstration
SELECT CONVERT('2026-10-14', DATE) AS Converted_Date;


-- E. Date Functions
-- 21. Current date
SELECT CURDATE() AS Today_Date, NOW() AS Current_Timestamp;

-- 22. Extract year, month and day
SELECT 
    CURDATE() AS Today,
    YEAR(CURDATE()) AS Current_Year,
    MONTH(CURDATE()) AS Current_Month,
    DAY(CURDATE()) AS Current_Day;

-- 23. Difference between two dates
SELECT DATEDIFF('2026-12-31', CURDATE()) AS Days_Remaining;

-- 24. Add a specified number of days to a date
SELECT DATE_ADD(CURDATE(), INTERVAL 15 DAY) AS Future_Date;

-- 25. Employees' joining dates display (using sample table)
CREATE TABLE IF NOT EXISTS Employee_Joining (
    Emp_ID INT,
    Emp_Name VARCHAR(50),
    Joining_Date DATE
);

INSERT INTO Employee_Joining VALUES 
(1, 'Rahul', '2023-01-15'),
(2, 'Rohit', '2022-07-20');

SELECT Emp_Name, DATE_FORMAT(Joining_Date, '%W, %D %M %Y') AS Formatted_Joining_Date 
FROM Employee_Joining;