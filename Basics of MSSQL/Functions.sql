use joins;

-- Create first table
CREATE TABLE employees_office1 (
    emp_id INT PRIMARY KEY,
    name VARCHAR(50),
    department VARCHAR(30)
);

-- Insert some records
INSERT INTO employees_office1 VALUES 
(1, 'Alice', 'HR'),
(2, 'Bob', 'Finance'),
(3, 'Charlie', 'IT');

-- Create second table
CREATE TABLE employees_office2 (
    emp_id INT PRIMARY KEY,
    name VARCHAR(50),
    department VARCHAR(30)
);

-- Insert some records
INSERT INTO employees_office2 VALUES 
(4, 'David', 'IT'),
(5, 'Eva', 'Marketing'),
(6, 'Frank', 'Finance');

-- UNION 
SELECT name, department FROM employees_office1
UNION
SELECT name, department FROM employees_office2;

--UNION ALL
SELECT name, department FROM employees_office1
UNION ALL
SELECT name, department FROM employees_office2;

--Name Uppercase
select UPPER(name) from employees_office1;
select Upper('djfsdk') as Uppertext;

select * from employees_office1;


select LOWER(name) from employees_office1;
select LOWER('djfsdk') as Uppertext;

select * from employees_office1;

select LEN(name) from employees_office1;
select LEN('djfsdk') as Uppertext;

select * from employees_office2;

select SUBSTRING('Shubham',3,1) as shubham;
select reverse(substring(name,2,len(name))) from employees_office1;


Select replace ('Shubham Liek tea','tea','coffee') as coffee
select replace (name,'alice','Shubham') from employees_office1;

select concat('A','B','C') as fdsjk;

select concat('Shubham',' is great') as from employees_office1;

select * from employees_office1;

select cast('emp_id' as string) from employees_office1;

SELECT CONVERT(VARCHAR(10), GETDATE(), 103) as ddmmyyyy




