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
  
 
 -- 1. adding new column DOB in Persons table with data type as Date
 alter table Persons add DOB date;
 desc persons;
INSERT INTO Persons (Fname, Lname, Population, Rating, Country_Id, Country_name,DOB)
VALUES
  ('Baby', 'John', 32000, 4.2, 1, 'United States','1993-05-11'),
  ('Mike', 'Tyson', 28000, 4.5, 2, 'Africa','1990-09-16'),
  ('Michael', 'Johnson', 31000, 4.8, 3, 'United Kingdom','1993-04-28'),
  ('Emily', 'Davis', 27000, 4.0, 4, 'India','1995-09-25'),
  ('Abraham', 'Williams', 29000, 4.3, 5, 'Australia','2000-09-03'),
  ('Majid', 'Khan', 26000, 4.7, 6, 'Bahrain','2001-07-17'),
  ('Leo', 'Fernandez', 30000, 4.1, 7, 'Brazil','1996-01-27'),
  ('Olivia', 'Müller', 33000, 4.6, 8, 'Germany','1994-10-30'),
  ('Noah', 'Dupont', 25000, 4.4, 9, 'France','2001-05-21'),
  ('Ching', 'Chan', 28000, 4.9, 10, 'Singapore','2002-08-13');

 select * from persons;
 select * from Country;

 -- 2. Write a user-defined function to calculate age using DOB. 
 DELIMITER $$
CREATE FUNCTION calculate_age(dob DATE)
RETURNS INT
DETERMINISTIC
BEGIN
    RETURN TIMESTAMPDIFF(YEAR, dob, CURDATE());
END $$
DELIMITER ;

 -- 3. Write a select query to fetch the Age of all persons using the function that has been created. 
  select Fname, calculate_age(DOB) as Age from Persons;
 
 -- 4. Find the length of each country name in the Country table.
 SELECT country_name, length(country_name) as name_length FROM Country;
 
 -- 5. Extract the first three characters of each country's name in the Country table.
 SELECT LEFT(country_name, 3) as country_code FROM Country;
 
 -- 6. Convert all country names to uppercase and lowercase in the Country table.
 SELECT UPPER(country_name) as uppercase_name,
       LOWER(country_name) as lowercase_name
FROM Country;

 

 
 

   
