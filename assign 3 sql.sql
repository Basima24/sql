-- create database Company
create database Company;
use Company;
/* Create Table Name: Managers
Fields: Manager_id,First_Name,Last_Name,DOB,Age,
Last Update,Gender,Department,Salary
*/
Create table Managers(
Manager_id int primary key auto_increment,
First_Name varchar(50) not null,
Last_Name varchar(50) not null,
DoB date not null,
Age int check(Age >= 20),
Last_Update date not null,
Gender char(1) check (Gender in ('M','F','O')),
Department varchar(50) not null,
Salary int not null check(Salary >0)
);
desc Managers;

-- 1. insert 10 rows into table
insert into managers (Manager_id,First_Name,Last_Name,DoB,Age,Last_Update,Gender,Department,Salary)
values
(1,'Ajay', 'Thomas', '2000-01-01', 42, '2022-06-15', 'M', 'Sales', 50000),
(2,'Arun', 'James', '1990-03-15', 37, '2021-09-20', 'M', 'Marketing', 55000),
(3,'Basima', 'Yoosaf', '1983-08-20',41,'2020-11-01','F', 'IT', 65000),
(4,'Athifa','M','1990-05-12',32, '2023-01-01', 'F', 'HR', 45000),
(5,'Divya', 'Sree', '1985-11-30', 39, '2022-04-01', 'F', 'Finance', 60000),
(6,'Greeshma', 'Joseph', '1988-06-05', 36, '2021-07-15', 'F', 'Operations', 50000),
(7,'Nithin', 'Raj', '1978-02-28', 44, '2020-09-01', 'M', 'IT', 70000),
(8,'Mufeeda', 'Saleem', '1992-09-10', 30, '2022-11-01', 'F', 'Marketing', 48000),
(9,'Vivek', 'Mohan', '1983-04-22', 39, '2021-03-15', 'M', 'Sales', 21000),
(10,'Surabhi', 'A', '1995-12-01', 27, '2022-08-01', 'F', 'HR Trainee', 20000)
;

select * from managers;

insert into managers (Manager_id,First_Name,Last_Name,DoB,Age,Last_Update,Gender,Department,Salary)
values
(11,'Sufin','Yoosaf','1996-10-4',26,'2022-06-15','M','Finance',40000)
;

-- 2. retrieve the name and dob of manager with manager_id=1
select First_Name,Last_Name,DoB from Managers where Manager_id=1;

-- 3.display annual income of all managers
select first_name ,last_name,Salary * 12 as Annual_Income 
from Managers;

-- 4.display records of all managers except 'Aaliya'
Select * from managers
where First_Name != 'Aaliya';

insert into managers (Manager_id,First_Name,Last_Name,DoB,Age,Last_Update,Gender,Department,Salary)
values
(111,'Sufin','Yoosaf','1996-10-4',26,'2022-06-15','M','Finance',40000)
;
select * from Managers;

-- 5.details of Managers whose Dept='IT' and earns more than 25000 per month
Select * from managers where department = 'IT' and salary > 25000 ;

-- 6. Display details of managers whose salary between 10000 and 35000
select * from managers where salary between 10000 and 35000;











