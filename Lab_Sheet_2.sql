

USE CollegeDB;

-- Base tables setup for DML operations
CREATE TABLE IF NOT EXISTS Student (
    Student_ID INT PRIMARY KEY,
    Name VARCHAR(50),
    Age INT,
    Course VARCHAR(50),
    City VARCHAR(50)
);

CREATE TABLE IF NOT EXISTS Employee (
    Emp_ID INT PRIMARY KEY,
    Emp_Name VARCHAR(50),
    Department VARCHAR(50),
    Salary DECIMAL(10, 2)
);

CREATE TABLE IF NOT EXISTS Department (
    Dept_ID INT PRIMARY KEY,
    Dept_Name VARCHAR(50),
    Location VARCHAR(50)
);

CREATE TABLE IF NOT EXISTS Product (
    Product_ID INT PRIMARY KEY,
    Product_Name VARCHAR(50),
    Price DECIMAL(10, 2),
    Quantity INT
);

CREATE TABLE IF NOT EXISTS Customer (
    Customer_ID INT PRIMARY KEY,
    Customer_Name VARCHAR(50),
    Email VARCHAR(100),
    Phone VARCHAR(15)
);

CREATE TABLE IF NOT EXISTS Course (
    Course_ID INT PRIMARY KEY,
    Course_Name VARCHAR(50),
    Duration VARCHAR(20),
    Fees DECIMAL(10, 2)
);

-- 1. Insert one record into the Student table
INSERT INTO Student (Student_ID, Name, Age, Course, City) 
VALUES (101, 'Aman Sharma', 20, 'B.Tech', 'Delhi');

-- 2. Insert five student records using separate INSERT statements
INSERT INTO Student (Student_ID, Name, Age, Course, City) VALUES (102, 'Rohan Verma', 21, 'BCA', 'Meerut');
INSERT INTO Student (Student_ID, Name, Age, Course, City) VALUES (103, 'Priya Singh', 19, 'B.Tech', 'Noida');
INSERT INTO Student (Student_ID, Name, Age, Course, City) VALUES (104, 'Ankit Kumar', 22, 'MCA', 'Meerut');
INSERT INTO Student (Student_ID, Name, Age, Course, City) VALUES (105, 'Sneha Patel', 20, 'B.Tech', 'Lucknow');
INSERT INTO Student (Student_ID, Name, Age, Course, City) VALUES (106, 'Vikas Gupta', 21, 'BBA', 'Dehradun');

-- 3. Insert multiple records into the Student table using a single statement
INSERT INTO Student (Student_ID, Name, Age, Course, City) VALUES 
(107, 'Rahul Mehra', 20, 'B.Tech', 'Meerut'),
(108, 'Neha Joshi', 21, 'BCA', 'Delhi');

-- 4. Insert records into the Employee table
INSERT INTO Employee (Emp_ID, Emp_Name, Department, Salary) VALUES 
(201, 'Rajesh Kumar', 'IT', 55000),
(202, 'Anita Roy', 'HR', 42000),
(203, 'Suresh Chandra', 'Finance', 48000),
(204, 'Deepak Rawat', 'IT', 28000);

-- 5. Insert records into the Department table
INSERT INTO Department (Dept_ID, Dept_Name, Location) VALUES 
(1, 'IT', 'Block A'),
(2, 'HR', 'Block B'),
(3, 'Finance', 'Block C');

-- 6. Insert records into the Product table
INSERT INTO Product (Product_ID, Product_Name, Price, Quantity) VALUES 
(301, 'Keyboard', 800.00, 15),
(302, 'Mouse', 450.00, 0),
(303, 'Monitor', 8500.00, 5);

-- 7. Insert records into the Customer table
INSERT INTO Customer (Customer_ID, Customer_Name, Email, Phone) VALUES 
(401, 'Amit Shah', 'amit@gmail.com', '9876543210'),
(402, 'Pooja Bhatt', 'pooja@gmail.com', '9811223344');

-- 8. Insert records into the Course table
INSERT INTO Course (Course_ID, Course_Name, Duration, Fees) VALUES 
(501, 'B.Tech', '4 Years', 120000),
(502, 'BCA', '3 Years', 70000),
(503, 'MCA', '2 Years', 85000);

-- 9. Insert a student record with values for all columns
INSERT INTO Student VALUES (109, 'Karan Malhotra', 22, 'B.Tech', 'Kanpur');

-- 10. Insert a student record by specifying only selected columns
INSERT INTO Student (Student_ID, Name, Course) VALUES (110, 'Divya Nair', 'BCA');

-- 11. Update the city of a particular student
UPDATE Student SET City = 'Gurugram' WHERE Student_ID = 101;

-- 12. Update the salary of a particular employee
UPDATE Employee SET Salary = 60000 WHERE Emp_ID = 201;

-- 13. Increase the salary of all employees by 10%
UPDATE Employee SET Salary = Salary * 1.10;

-- 14. Increase the price of all products by 5%
UPDATE Product SET Price = Price * 1.05;

-- 15. Change the course of a particular student
UPDATE Student SET Course = 'MCA' WHERE Student_ID = 102;

-- 16. Update the department of an employee
UPDATE Employee SET Department = 'Management' WHERE Emp_ID = 202;

-- 17. Update the city of all students from Meerut to Delhi
UPDATE Student SET City = 'Delhi' WHERE City = 'Meerut';

-- 18. Update the fees of a particular course
UPDATE Course SET Fees = 130000 WHERE Course_ID = 501;

-- 19. Update multiple columns of a student simultaneously
UPDATE Student SET Age = 23, City = 'Chandigarh' WHERE Student_ID = 104;

-- 20. Delete a particular student record using Student_ID
DELETE FROM Student WHERE Student_ID = 110;

-- 21. Delete all students belonging to a particular city
DELETE FROM Student WHERE City = 'Lucknow';

-- 22. Delete employees whose salary is below a specified amount
DELETE FROM Employee WHERE Salary < 35000;

-- 23. Delete products whose quantity is zero
DELETE FROM Product WHERE Quantity = 0;

-- 24. Delete records satisfying multiple conditions using AND/OR
DELETE FROM Student WHERE City = 'Delhi' AND Age > 21;

-- 25. Complete sequence of INSERT, UPDATE, DELETE operations with verification
INSERT INTO Student (Student_ID, Name, Age, Course, City) VALUES (999, 'Dummy User', 25, 'Diploma', 'Agra');
SELECT * FROM Student WHERE Student_ID = 999;

UPDATE Student SET City = 'Mathura' WHERE Student_ID = 999;
SELECT * FROM Student WHERE Student_ID = 999;

DELETE FROM Student WHERE Student_ID = 999;
SELECT * FROM Student WHERE Student_ID = 999;
