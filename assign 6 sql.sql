-- create database
create database NewCompany;
use NewCompany;

-- creating tables

 create table Country(Id int primary key auto_increment,
 Country_Name varchar(30) not null,
 Population int not null,
 Area float not null
 );
 
 create table Persons (Id int primary key auto_increment,
 Fname varchar(50) not null,
 Lname varchar(50) not null,
 Population int not null,
 Rating float not null,
 Country_id int not null,
 Country_Name varchar(30) not null,
 foreign key (Country_id) references Country(Id)
 );
 
 desc Country;
 desc Persons;
 
 -- insert values into tables
INSERT INTO Country (Country_name, Population, Area)
VALUES
  ('United States', 32727000, 9833517.56),
  ('Canada', 37742154, 9093510.0),
  ('United Kingdom', 67886011, 24295.9),
  ('India', 1380004385, 3287263.3),
  ('Australia', 25499884, 7692024.0),
  ('China', 1439323776, 9596961.0),
  ('Brazil', 211049527, 8515767.56),
  ('Germany', 83024745, 357022.17),
  ('France', 67064000, 643801.98),
  ('Japan', 126476461, 377930.0)
  ;
  select * from Country;
  

INSERT INTO Persons (Fname, Lname, Population, Rating, Country_Id, Country_name)
VALUES
  ('Baby', 'John', 32000, 4.2, 1, 'United States'),
  ('Mike', 'Tyson', 28000, 4.5, 2, 'Africa'),
  ('Michael', 'Johnson', 31000, 4.8, 3, 'United Kingdom'),
  ('Emily', 'Davis', 27000, 4.0, 4, 'India'),
  ('Abraham', 'Williams', 29000, 4.3, 5, 'Australia'),
  ('Majid', 'Khan', 26000, 4.7, 6, 'Bahrain'),
  ('Leo', 'Fernandez', 30000, 4.1, 7, 'Brazil'),
  ('Olivia', 'Müller', 33000, 4.6, 8, 'Germany'),
  ('Noah', 'Dupont', 25000, 4.4, 9, 'France'),
  ('Ching', 'Chan', 28000, 4.9, 10, 'Singapore')
  ;
 select * from persons;
 select * from Country;
 
-- 1)Perform inner join, Left join, and Right join on the tables. 
-- INNER JOIN
select C.Country_name, C.Population as Country_Population, 
       P.Fname, P.Lname, P.Population as Person_Population
from Country C INNER JOIN Persons P on C.Id = P.Country_Id;

-- LEFT JOIN
select C.Country_name, C.Population as Country_Population, 
       P.Fname, P.Lname, P.Population as Person_Population
from Country C LEFT JOIN Persons P on C.Id = P.Country_Id;

-- RIGHT JOIN
select C.Country_name, C.Population as Country_Population, 
       P.Fname, P.Lname, P.Population as Person_Population
from Country C RIGHT JOIN Persons P on C.Id = P.Country_Id;

-- (2)List all distinct country names from both the Country and Persons tables.
select Country_name from Country UNION SELECT Country_name from Persons;

-- (3)List all country names from both the Country and Persons tables, including duplicates. 
select Country_name from Country UNION ALL SELECT Country_name from Persons;

-- (4)Round the ratings of all persons to the nearest integer in the Persons table.
select Fname, Lname, Rating, ROUND(Rating) as Rounded_Rating from Persons;

 
 

   