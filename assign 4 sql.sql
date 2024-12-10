-- create database
create database NewCompany;
use NewCompany;country

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
 
 -- 1.Distinct country names from person table
 select distinct Country_name from Persons;
 
 -- 2. select first name and last name from person table with aliases
 select Fname AS First_Name ,Lname AS Last_Name from Persons;
 
 -- 3.find persons with rating >4.0
 select * from Persons where rating > 4.0;
 
 -- 4.Countries with Population >10 lakhs
 select * from Country where Population > 1000000 ;
 
 -- 5. find persons from usa or having a rating greater than 4.5
 select * from Persons where Country_name = 'USA' or Rating > 4.5;
 
 -- 6. find all persons where the country name is null
 select * from Persons where Country_name is Null;
 
 -- 7. find all persons from USA,Canada and uk
 select * from Persons where Country_name in ('United States','Canada','United Kingdom');
 
 -- 8. find all persons NOT from INDIA and AUSTRALIA
 select * from Persons where Country_name NOT in ('India','Australia');
 
 -- 9. find all countries with population between 5 and 20 laks
 select * from Country where Population between 500000 and 2000000 ;
 
 select * from Country;
 
 -- 10. find all countries whose names do not start with 'C'
 select * from Country where Country_name not like 'C%';
 
 
 
 
 
 
 