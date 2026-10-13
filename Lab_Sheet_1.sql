-- ========================================================
-- Lab Sheet 1: DDL Commands - CREATE, ALTER and DROP
-- Database: MySQL
-- ========================================================

-- 1. Create a database named CollegeDB
CREATE DATABASE IF NOT EXISTS CollegeDB;
USE CollegeDB;

-- 2. Create a Student table with columns: Student_ID, Name, Age, Course, and City
CREATE TABLE Student (
    Student_ID INT,
    Name VARCHAR(50),
    Age INT,
    Course VARCHAR(50),
    City VARCHAR(50)
);

-- 3. Create an Employee table with Emp_ID, Emp_Name, Department, and Salary
CREATE TABLE Employee (
    Emp_ID INT,
    Emp_Name VARCHAR(50),
    Department VARCHAR(50),
    Salary DECIMAL(10, 2)
);

-- 4. Create a Department table with Dept_ID, Dept_Name, and Location
CREATE TABLE Department (
    Dept_ID INT,
    Dept_Name VARCHAR(50),
    Location VARCHAR(50)
);

-- 5. Create a Product table with Product_ID, Product_Name, Price, and Quantity
CREATE TABLE Product (
    Product_ID INT,
    Product_Name VARCHAR(50),
    Price DECIMAL(10, 2),
    Quantity INT
);

-- 6. Create a Customer table with Customer_ID, Customer_Name, Email, and Phone
CREATE TABLE Customer (
    Customer_ID INT,
    Customer_Name VARCHAR(50),
    Email VARCHAR(100),
    Phone VARCHAR(15)
);

-- 7. Create a Course table with Course_ID, Course_Name, Duration, and Fees
CREATE TABLE Course (
    Course_ID INT,
    Course_Name VARCHAR(50),
    Duration VARCHAR(20),
    Fees DECIMAL(10, 2)
);

-- 8. Create a Faculty table with Faculty_ID, Faculty_Name, Subject, and Salary
CREATE TABLE Faculty (
    Faculty_ID INT,
    Faculty_Name VARCHAR(50),
    Subject VARCHAR(50),
    Salary DECIMAL(10, 2)
);

-- 9. Create a Library table with Book_ID, Book_Name, Author, and Price
CREATE TABLE Library (
    Book_ID INT,
    Book_Name VARCHAR(100),
    Author VARCHAR(50),
    Price DECIMAL(10, 2)
);

-- 10. Create a Department table with Dept_ID as the Primary Key
CREATE TABLE Department_PK (
    Dept_ID INT PRIMARY KEY,
    Dept_Name VARCHAR(50),
    Location VARCHAR(50)
);

-- 11. Create a Student table with Student_ID as Primary Key and Name as NOT NULL
CREATE TABLE Student_PK (
    Student_ID INT PRIMARY KEY,
    Name VARCHAR(50) NOT NULL,
    Age INT,
    Course VARCHAR(50),
    City VARCHAR(50)
);

-- 12. Create an Employee table with a UNIQUE constraint on Email
CREATE TABLE Employee_Unique (
    Emp_ID INT PRIMARY KEY,
    Emp_Name VARCHAR(50),
    Email VARCHAR(100) UNIQUE,
    Salary DECIMAL(10, 2)
);

-- 13. Create a Product table with a CHECK constraint that Price > 0
CREATE TABLE Product_Check (
    Product_ID INT PRIMARY KEY,
    Product_Name VARCHAR(50),
    Price DECIMAL(10, 2) CHECK (Price > 0),
    Quantity INT
);

-- 14. Add a new column Email to the Student table using ALTER TABLE
ALTER TABLE Student ADD Email VARCHAR(100);

-- 15. Add a Phone column to the Student table
ALTER TABLE Student ADD Phone VARCHAR(15);

-- 16. Modify the datatype/size of the Name column in the Student table
ALTER TABLE Student MODIFY Name VARCHAR(100);

-- 17. Rename the Student table to Student_Details
RENAME TABLE Student TO Student_Details;

-- 18. Rename the column City to Address
ALTER TABLE Student_Details RENAME COLUMN City TO Address;

-- 19. Add a Salary column to the Employee table
ALTER TABLE Employee ADD Salary_New DECIMAL(10, 2);

-- 20. Drop the Phone column from the Student_Details table
ALTER TABLE Student_Details DROP COLUMN Phone;

-- 21. Drop the Email column from the Student_Details table
ALTER TABLE Student_Details DROP COLUMN Email;

-- 22. Remove all records from a table using TRUNCATE
TRUNCATE TABLE Library;

-- 23. Drop the Course table from the database
DROP TABLE IF EXISTS Course;

-- 24. Drop the Customer table from the database
DROP TABLE IF EXISTS Customer;

-- 25. Complete Student table using Primary Key, NOT NULL, UNIQUE, CHECK and ALTER/DROP demonstration
CREATE TABLE Student_Complete (
    Student_ID INT PRIMARY KEY,
    Name VARCHAR(50) NOT NULL,
    Email VARCHAR(100) UNIQUE,
    Age INT CHECK (Age >= 17),
    Marks INT CHECK (Marks >= 0 AND Marks <= 100)
);

ALTER TABLE Student_Complete ADD Department VARCHAR(50);
ALTER TABLE Student_Complete DROP COLUMN Marks;
DROP TABLE Student_Complete;