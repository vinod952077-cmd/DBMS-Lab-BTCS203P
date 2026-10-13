-- ========================================================
-- Lab Sheet 5: SQL Joins
-- Database: MySQL
-- ========================================================

USE CollegeDB;

-- Clean sample data for Joins
CREATE TABLE IF NOT EXISTS Dept (
    Dept_ID INT PRIMARY KEY,
    Dept_Name VARCHAR(50)
);

CREATE TABLE IF NOT EXISTS Stud (
    Stud_ID INT PRIMARY KEY,
    Stud_Name VARCHAR(50),
    Dept_ID INT,
    Course_ID INT
);

CREATE TABLE IF NOT EXISTS Crs (
    Course_ID INT PRIMARY KEY,
    Course_Name VARCHAR(50)
);

CREATE TABLE IF NOT EXISTS Emp_Hierarchy (
    Emp_ID INT PRIMARY KEY,
    Emp_Name VARCHAR(50),
    Manager_ID INT,
    Dept_ID INT,
    Salary DECIMAL(10,2)
);

-- Truncate & Insert test data
TRUNCATE TABLE Dept;
TRUNCATE TABLE Stud;
TRUNCATE TABLE Crs;
TRUNCATE TABLE Emp_Hierarchy;

INSERT INTO Dept VALUES (1, 'Computer Science'), (2, 'Electronics'), (3, 'Mechanical'), (4, 'Civil');
INSERT INTO Crs VALUES (101, 'AI & ML'), (102, 'Data Science'), (103, 'Cyber Security');

INSERT INTO Stud VALUES 
(1, 'Aman', 1, 101),
(2, 'Priya', 2, 102),
(3, 'Rohan', 1, 101),
(4, 'Siddharth', NULL, 103),
(5, 'Neha', 2, NULL);

INSERT INTO Emp_Hierarchy VALUES 
(1, 'Mr. Sharma', NULL, 1, 95000),
(2, 'Rohit', 1, 1, 60000),
(3, 'Anita', 1, 1, 55000),
(4, 'Suresh', NULL, 2, 85000),
(5, 'Deepak', 4, 2, 45000);

-- 1. INNER JOIN between Student and Department
SELECT * FROM Stud 
INNER JOIN Dept ON Stud.Dept_ID = Dept.Dept_ID;

-- 2. Student names along with their department names using INNER JOIN
SELECT Stud.Stud_Name, Dept.Dept_Name 
FROM Stud
INNER JOIN Dept ON Stud.Dept_ID = Dept.Dept_ID;

-- 3. Employee names along with their department names
SELECT e.Emp_Name, d.Dept_Name 
FROM Emp_Hierarchy e
INNER JOIN Dept d ON e.Dept_ID = d.Dept_ID;

-- 4. Students along with their course details
SELECT s.Stud_Name, c.Course_Name 
FROM Stud s
INNER JOIN Crs c ON s.Course_ID = c.Course_ID;

-- 5. Students belonging to a particular department ('Computer Science')
SELECT s.Stud_Name, d.Dept_Name 
FROM Stud s
INNER JOIN Dept d ON s.Dept_ID = d.Dept_ID
WHERE d.Dept_Name = 'Computer Science';

-- 6. LEFT OUTER JOIN between Student and Department
SELECT * FROM Stud s
LEFT JOIN Dept d ON s.Dept_ID = d.Dept_ID;

-- 7. All students including those without matching department
SELECT s.Stud_Name, d.Dept_Name 
FROM Stud s
LEFT JOIN Dept d ON s.Dept_ID = d.Dept_ID;

-- 8. RIGHT OUTER JOIN between Student and Department
SELECT * FROM Stud s
RIGHT JOIN Dept d ON s.Dept_ID = d.Dept_ID;

-- 9. All departments including those having no students
SELECT d.Dept_Name, s.Stud_Name 
FROM Stud s
RIGHT JOIN Dept d ON s.Dept_ID = d.Dept_ID;

-- 10. Students who are not assigned to any department
SELECT s.Stud_Name 
FROM Stud s
LEFT JOIN Dept d ON s.Dept_ID = d.Dept_ID
WHERE d.Dept_ID IS NULL;

-- 11. Departments having no students
SELECT d.Dept_Name 
FROM Dept d
LEFT JOIN Stud s ON d.Dept_ID = s.Dept_ID
WHERE s.Stud_ID IS NULL;

-- 12. FULL OUTER JOIN simulation in MySQL (UNION of LEFT and RIGHT JOIN)
SELECT s.Stud_Name, d.Dept_Name 
FROM Stud s
LEFT JOIN Dept d ON s.Dept_ID = d.Dept_ID
UNION
SELECT s.Stud_Name, d.Dept_Name 
FROM Stud s
RIGHT JOIN Dept d ON s.Dept_ID = d.Dept_ID;

-- 13. CROSS JOIN between Student and Course
SELECT s.Stud_Name, c.Course_Name 
FROM Stud s
CROSS JOIN Crs c;

-- 14. Total combinations using CROSS JOIN
SELECT COUNT(*) AS Total_Combinations 
FROM Stud
CROSS JOIN Crs;

-- 15. NATURAL JOIN demonstration
SELECT * FROM Stud 
NATURAL JOIN Dept;

-- 16. Comparison: NATURAL JOIN vs INNER JOIN (Using explicit columns)
-- NATURAL JOIN automatically joins on common column names
SELECT * FROM Stud NATURAL JOIN Dept;
-- INNER JOIN uses explicit ON clause condition
SELECT * FROM Stud INNER JOIN Dept ON Stud.Dept_ID = Dept.Dept_ID;

-- 17. SELF JOIN on Employee table (Employee-Manager hierarchy)
SELECT e.Emp_Name AS Employee, m.Emp_Name AS Manager
FROM Emp_Hierarchy e
INNER JOIN Emp_Hierarchy m ON e.Manager_ID = m.Emp_ID;

-- 18. Employees along with managers (including top managers using LEFT JOIN)
SELECT e.Emp_Name AS Employee, COALESCE(m.Emp_Name, 'No Manager (Top Head)') AS Manager
FROM Emp_Hierarchy e
LEFT JOIN Emp_Hierarchy m ON e.Manager_ID = m.Emp_ID;

-- 19. Join three tables: Student, Department and Course
SELECT * 
FROM Stud s
INNER JOIN Dept d ON s.Dept_ID = d.Dept_ID
INNER JOIN Crs c ON s.Course_ID = c.Course_ID;

-- 20. Student name, course name and department name using multiple joins
SELECT s.Stud_Name, c.Course_Name, d.Dept_Name
FROM Stud s
INNER JOIN Dept d ON s.Dept_ID = d.Dept_ID
INNER JOIN Crs c ON s.Course_ID = c.Course_ID;

-- 21. Employees with salary greater than department average salary
SELECT e.Emp_Name, e.Salary, e.Dept_ID
FROM Emp_Hierarchy e
WHERE e.Salary > (
    SELECT AVG(Salary) 
    FROM Emp_Hierarchy 
    WHERE Dept_ID = e.Dept_ID
);

-- 22. Department having maximum number of students
SELECT d.Dept_Name, COUNT(s.Stud_ID) AS Total_Students
FROM Dept d
INNER JOIN Stud s ON d.Dept_ID = s.Dept_ID
GROUP BY d.Dept_ID, d.Dept_Name
ORDER BY Total_Students DESC
LIMIT 1;

-- 23. Departments and total number of students in each
SELECT d.Dept_Name, COUNT(s.Stud_ID) AS Student_Count
FROM Dept d
LEFT JOIN Stud s ON d.Dept_ID = s.Dept_ID
GROUP BY d.Dept_ID, d.Dept_Name;

-- 24. Courses along with number of students enrolled
SELECT c.Course_Name, COUNT(s.Stud_ID) AS Enrolled_Count
FROM Crs c
LEFT JOIN Stud s ON c.Course_ID = s.Course_ID
GROUP BY c.Course_ID, c.Course_Name;

-- 25. Complete query: INNER JOIN, LEFT JOIN, GROUP BY and Aggregate functions
SELECT 
    d.Dept_Name,
    COUNT(DISTINCT s.Stud_ID) AS Total_Students,
    COUNT(DISTINCT c.Course_ID) AS Total_Distinct_Courses
FROM Dept d
LEFT JOIN Stud s ON d.Dept_ID = s.Dept_ID
LEFT JOIN Crs c ON s.Course_ID = c.Course_ID
GROUP BY d.Dept_ID, d.Dept_Name;