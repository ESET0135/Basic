create database Assign3;
CREATE TABLE Students2024 (ID INT, Name VARCHAR(50));
CREATE TABLE Students2025 (ID INT, Name VARCHAR(50));

INSERT INTO Students2024 VALUES
(1,'Ravi'),(2,'Asha'),(3,'John'),(4,'Meera'),(5,'Kiran'),
(6,'Divya'),(7,'Lokesh'),(8,'Anita'),(9,'Rahul'),(10,'Sneha');

INSERT INTO Students2025 VALUES
(2,'Asha'),(4,'Meera'),(5,'Kiran'),(11,'Prakash'),(12,'Vidya'),
(13,'Neha'),(14,'Manoj'),(15,'Ramesh'),(16,'Lata'),(17,'Akash');

CREATE TABLE Employees (EmpID INT, Name VARCHAR(50), Department VARCHAR(20));

INSERT INTO Employees VALUES 
(1,'Ananya','HR'),(2,'Ravi','IT'),(3,'Meera','Finance'),
(4,'John','IT'),(5,'Divya','Marketing'),(6,'Sneha','Finance'),
(7,'Lokesh','HR'),(8,'Asha','IT'),(9,'Kiran','Finance'),(10,'Rahul','Sales');

CREATE TABLE Projects (ProjectID INT, Name VARCHAR(50), StartDate DATE, EndDate DATE);
INSERT INTO Projects VALUES 
(1,'Bank App','2025-01-01','2025-03-15'),
(2,'E-Commerce','2025-02-10','2025-05-20');

CREATE TABLE Contacts (ID INT, Name VARCHAR(50), Email VARCHAR(50), Phone VARCHAR(20));
INSERT INTO Contacts VALUES
(1,'Ravi','ravi@gmail.com',NULL),
(2,'Asha',NULL,'9876543210'),
(3,'John',NULL,NULL);


-- TASKS
-- 1. Show a list of all student names (unique only)
SELECT Name FROM Students2024
UNION
SELECT Name FROM Students2025;

-- 2. Show a list of all student names (including duplicates)
SELECT Name FROM Students2024
UNION ALL
SELECT Name FROM Students2025;

-- Employee Queries
-- 3. Display employee names in UPPERCASE and LOWERCASE
SELECT Name, UPPER(Name) AS UpperName, LOWER(Name) AS LowerName FROM Employees;

-- 4. Find the length of each employee’s name
SELECT Name, LEN(Name) AS NameLength FROM Employees;

-- 5. Show only the first 3 letters of each name
SELECT Name, SUBSTRING(Name, 1,3) AS First3Letters FROM Employees;

-- 6. Replace Finance department with Accounts
SELECT EmpID, Name, REPLACE(Department, 'Finance', 'Accounts') AS Department FROM Employees;

-- 7. Create a new column showing "Name - Department"
SELECT Name, Department, CONCAT(Name, ' - ', Department) AS NameDepartment FROM Employees;


-- Date Functions
-- 8. Show today’s date using GETDATE()
SELECT GETDATE() AS TodayDate;

-- 9. Find the duration (in days) of each project using DATEDIFF
SELECT Name, DATEDIFF(DAY, StartDate, EndDate) AS DurationDays FROM Projects;

-- 10. Add 10 days to each project’s EndDate using DATEADD
SELECT Name, EndDate,DATEADD(DAY, 10, EndDate) AS EndDatePlus10 FROM Projects;

-- 11. Find how many days are left until each project ends
SELECT Name, EndDate,DATEDIFF(DAY, GETDATE(), EndDate) AS DaysLeft FROM Projects;

-- CAST, CONVERT, CASE
-- 12. Convert today’s date into DD/MM/YYYY format
SELECT CONVERT(VARCHAR(10), GETDATE(), 103) AS FormattedDate;

-- 13. Convert a float 123.456 into an integer
SELECT CAST(123.456 AS INT) AS IntegerValue;



