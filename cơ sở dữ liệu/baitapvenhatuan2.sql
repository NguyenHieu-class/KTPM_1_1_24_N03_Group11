create database studentdb;
use studentdb;
create table class101(
	id int,
    name varchar(50),
    gpa float
);
insert into class101(id, name, gpa)
values (1001,'Tan Ah Teck',4.5),(1002,'Mohammed Ali',4.8),(1003,'Kumar',4.8),(1004,'Kevin Jones',4.6);

select * from class101 where name like 'k%';
select * from class101 where name not like 'k%';
select * from class101 where gpa between 4.35 and 4.65;
select * from class101 where name like '%e%';
select * from class101 where name like '%e%' or name like '%a%';
select * from class101 where name like '%e%' and gpa >= 4.5;
