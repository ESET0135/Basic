use daythree;

create table employee (ID int Primary key Identity(1,1),name varchar(50), dept varchar(50), Salary Varchar(40))
select * from employee;
insert into employee values ('NB','SDE','100');
insert into employee values ('SD','IT','200');
insert into employee values ('manjit','HR','300');
insert into employee values ('PJ','Marketing','400');

alter table employee add phonenumber bigint;
alter table employee drop column Salary;
update employee set phonenumber=983372488 where ID<=5;
create table salary_table (s_id int, Salary int,foreign key(s_id) references employee(ID));
select * from salary_table;

drop table employee;

insert into salary_table values (1,1288);
insert into salary_table values (2,324);
insert into salary_table values (3,2486);
insert into salary_table values (4,5093);


