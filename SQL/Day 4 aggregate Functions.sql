use daythree;

select * from salary_table;
select * from employee;
select * from employee where ID=1;
select * from employee where ID!=1;
select * from employee where ID in (3,4);

select * from employee where ID>2;

select * from employee where ID between 2 and 3;

select * from employee where name like 'SD';

select * from employee where name like '%A%';

select * from employee where name not like '%D';

select * from employee where dept is not null;

alter table employee add Salary Varchar(25);

alter table drop Salary from employee;

select max(id) as topID from employee;

select count(*) as topID from employee;

select count(*) from employee;

