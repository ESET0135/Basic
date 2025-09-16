use windowFunction;
SELECT TABLE_NAME
FROM INFORMATION_SCHEMA.TABLES
WHERE TABLE_TYPE = 'BASE TABLE';

Drop trigger msg

CREATE trigger msg 
on students2024 
instead of INSERT 
AS
BEGIN
PRINT 'A NEW Student ADDED.';
END;


CREATE trigger msg_afterdelete
on students2024 
instead of DELETE 
AS
BEGIN
PRINT 'A NEW Student ADDED.';
END;
		
insert into Students2024 values(1,'Shubham') ;

select * from Students2024;


CREATE TABLE SalaryAudit(
 AudID INT IDENTITY(1,1) PRIMARY KEY,
 EmpID INT,
 OldSalary INT,
 NewSalary INT,
 ChangeDate DATETIME DEFAULT GETDATE()
);

SELECT * FROM SalaryAudit

CREATE TABLE Employ (
    EmpID INT PRIMARY KEY,
    FirstName NVARCHAR(50),
    LastName NVARCHAR(50),
    Department NVARCHAR(50),
    Salary DECIMAL(10,2)
); 

SELECT * FROM Employ

INSERT INTO Employ (EmpID, FirstName, LastName, Department, Salary)
VALUES
(1, 'Nami', 'S', 'Managment', 5000000),
(2, 'Koushi', 'S', 'IT', 6500000),
(3, 'Rakesh', 'G', 'SDE', 720000);

DROP TABLE Employ

CREATE TRIGGER try_auditchage
ON Employ
AFTER UPDATE
AS
BEGIN
 INSERT INTO SalaryAudit (EmpID, OldSalary, NewSalary)
    SELECT d.EmpID, d.Salary, i.Salary
    FROM deleted d
    INNER JOIN inserted i ON d.EmpID = i.EmpID
    WHERE d.Salary <> i.Salary; 
END;

UPDATE Employ
SET Salary = 8000000
WHERE EmpID = 2;


CREATE view required_view
as
select EmpID, FirstName, LastName from Employ