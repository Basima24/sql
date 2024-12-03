-- DDL Commands
-- create the database
create database School;
use School;

-- create the table
create table STUDENT(
Roll_No int primary key,
Name varchar(50),
Marks int,
Grade char(1)
);

-- ADDING VALUES TO STUDENT TABLE
INSERT INTO STUDENT (Roll_No,Name,Marks,Grade) values
(1,'ANU',85,'B'),
(2,'ABEL',50,'P'),
(3,'BOB',63,'D'),
(4,'JOHN',70,'C'),
(5,'MAX',80,'B'),
(6,'RONY',90,'A'),
(7,'MICHEL',73,'C'),
(8,'ROSE',99,'A');

desc STUDENT;

-- 1. display the content of Student table
select * from Student;

-- 2 .add new column contact to student table
alter table Student add column contact varchar(30);

-- 3.remove grade column from student table
alter table student drop column grade;

-- 4. rename the table 
rename table Student to ClassTen;

-- 5.Delete all rows from the table 
truncate table ClassTen;

desc ClassTen;

-- remove the table from database
drop table ClassTen;












