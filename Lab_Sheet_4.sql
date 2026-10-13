-- ========================================================
-- Lab Sheet 4: SQL Operators
-- Database: MySQL
-- ========================================================

USE CollegeDB;

-- Arithmetic Operators
-- 1. Addition (+)
SELECT 25 + 15 AS Addition_Result;

-- 2. Subtraction (-)
SELECT 100 - 45 AS Subtraction_Result;

-- 3. Multiplication (*)
SELECT 12 * 8 AS Multiplication_Result;

-- 4. Division (/)
SELECT 100 / 4 AS Division_Result;

-- 5. Calculate total amount as Price * Quantity
SELECT Product_Name, Price, Quantity, (Price * Quantity) AS Total_Amount FROM Product;


-- Logical Operators
-- 6. AND condition
SELECT * FROM Student WHERE Age >= 20 AND Course = 'B.Tech';

-- 7. OR condition
SELECT * FROM Student WHERE City = 'Delhi' OR City = 'Noida';

-- 8. NOT condition
SELECT * FROM Student WHERE NOT (Course = 'BCA');

-- 9. Specific course AND city
SELECT * FROM Student WHERE Course = 'B.Tech' AND City = 'Delhi';

-- 10. Employees belonging to either of two departments
SELECT * FROM Employee WHERE Department = 'IT' OR Department = 'HR';


-- Comparison Operators
-- 11. = operator
SELECT * FROM Student WHERE City = 'Delhi';

-- 12. > operator
SELECT * FROM Employee WHERE Salary > 50000;

-- 13. < operator
SELECT * FROM Product WHERE Price < 1000;

-- 14. >= and <=
SELECT * FROM Student WHERE Age >= 19 AND Age <= 21;

-- 15. <> / != operator
SELECT * FROM Employee WHERE Department != 'HR';


-- Special Operators
-- 16. BETWEEN for salary range
SELECT * FROM Employee WHERE Salary BETWEEN 40000 AND 70000;

-- 17. IN for selecting multiple cities
SELECT * FROM Student WHERE City IN ('Delhi', 'Noida', 'Gurugram');

-- 18. NOT IN
SELECT * FROM Student WHERE City NOT IN ('Delhi', 'Noida');

-- 19. LIKE for names beginning with 'A'
SELECT * FROM Student WHERE Name LIKE 'A%';

-- 20. IS NULL and IS NOT NULL
SELECT * FROM Student WHERE City IS NULL;
SELECT * FROM Student WHERE City IS NOT NULL;


-- Set Operations
-- 21. UNION (combining two queries)
SELECT Name AS Entity_Name, 'Student' AS Role FROM Student
UNION
SELECT Emp_Name AS Entity_Name, 'Employee' AS Role FROM Employee;

-- 22. UNION ALL
SELECT Course FROM Student
UNION ALL
SELECT Course_Name FROM Course;

-- 23. INTERSECT (Simulated using INNER JOIN in MySQL)
SELECT DISTINCT s.Course FROM Student s
INNER JOIN Course c ON s.Course = c.Course_Name;

-- 24. EXCEPT / MINUS (Simulated using LEFT JOIN and NULL check in MySQL)
SELECT c.Course_Name FROM Course c
LEFT JOIN Student s ON c.Course_Name = s.Course
WHERE s.Course IS NULL;

-- 25. Multiple operators combined: Arithmetic + Logical + Comparison + Special
SELECT Product_Name, Price, Quantity, (Price * Quantity) AS Total_Value
FROM Product
WHERE (Price * Quantity) >= 5000 
  AND Product_Name LIKE 'M%' 
  AND Quantity BETWEEN 1 AND 20;