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
 
 -- 1. Write an SQL query to print the first three characters of Country_name from the Country table.
 
       SELECT LEFT(Country_name, 3) as Country_prefix from Country;
 
 -- 2. Write an SQL query to concatenate first name and last name from Persons table. 
      
      select concat(Fname,' ',Lname) as Full_Name from Persons;
 
 -- 3.Write an SQL query to count the number of unique country names from Persons table. 
      select count(distinct Country_Name) as Unique_Country_count from Persons;
      
 -- 4. Write a query to print the maximum population from the Country table. 
 select max(Population) as Max_population from Country;
 
 -- 5. Write a query to print the minimum population from Persons table.
       
       select min(Population) as Min_Population from Persons;
 
 -- 6. Insert 2 new rows to the Persons table making the Lname NULL.Then write another query to count Lname from Persons table. 
       
       ALTER TABLE Persons MODIFY Lname VARCHAR(50) NULL;
       
       insert into Persons (Fname, Lname, Population, Rating, Country_Id, Country_name)
	   values
          ('Soniya',null, 35000, 4.7, 1, 'United States'),
          ('Ahsan',null, 29000, 4.2, 2, 'Singapore');
          
          select * from persons;
          
         select COUNT(Lname) as Not_Null_Lnames
         FROM Persons;
       
 -- 7. Write a query to find the number of rows in the Persons table. 
 select count(*) as Total_No_Rows from Persons;
 
 -- 8. Write an SQL query to show the population of the Country table for the first 3 rows. (Hint: Use LIMIT) 
      select Population FROM Country limit 3;
 
 -- 9. Write a query to print 3 random rows of countries. (Hint: Use rand() function and LIMIT) 
       select * from Country order by RAND() limit 3;
 
 -- 10. List all persons ordered by their rating in descending order. 
       select * from Persons order by Rating desc;
       
 -- 11. Find the total population for each country in the Persons table.
    select Country_Name, SUM(Population) as Total_Population FROM Persons GROUP BY Country_name;
 
--   12. Find countries in the Persons table with a total population greater than 50,000 
 select Country_name, SUM(Population) as Total_Population from Persons GROUP BY Country_Name
 having SUM(Population) > 50000;

-- 13. List the total number of persons and average rating for each country, but only for countries with more than 2 persons

          insert into Persons (Fname, Lname, Population, Rating, Country_Id, Country_name)
	      values
          ('Bilal','Sam', 85000, 4.5, 1, 'Singapore'),
          ('Reema','lal', 73000, 4.6, 2, 'Singapore');
      select Country_Name, count(*) as Total_Persons, avg(Rating) as Avg_Rating from Persons
      group by Country_name having count(*) > 2 order by Avg_Rating ASC;    
          

   