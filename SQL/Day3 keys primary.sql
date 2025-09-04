Create Database daythree;

use daythree;
create table university (ID int Primary key Identity(1,1),name varchar(25), dept varchar(100), fees float )
drop table university;
insert into university values ('Shivam','Btech',43222);
alter table university add mail_id varchar(25) unique;
select * from university;
insert into university values ('Shivam','Btech',43222,NULL);
delete from university where ID=1;


insert into university values ('A','Btech',43222,'fdsih');
insert into university values ('B','BA',44222,'dfbdj');
insert into university values ('C','MA',6748,'sdbhsj');

create table student (s_id int, Name varchar(50),class varchar(10),foreign key(s_id) references university (ID));
select * from student;

insert into student values (3,'ABC',2022);
insert into student values (4,'CDE',2021);