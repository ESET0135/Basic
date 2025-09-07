Create database employees;
use employees;
create table employees(EMPID int, Name VARCHAR(50),Branch Varchar(100),salary int)
drop table employees; 
select * from employees;
Insert into employees values (1,'A','Mech',10000),(2,'B','Industrial',20000),(3,'C','ENtc',30000),(4,'D','Civil',40000),(5,'E','Thermal',50000)
select * from employees where salary > 20000;
update employees set name='Shivam' where EMPID=4;
delete from employees where name='Shivam'; 
alter table employees add phonennumber varchar(50);
alter table employees alter column phonennumber bigint;
exec sp_help 'employees';
alter table employees drop column phonennumber;
exec sp_rename 'employees.Name','empname','column';
exec sp_help emp;
exec sp_rename 'employees','emp';