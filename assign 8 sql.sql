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
  
INSERT INTO Country (Country_name, Population, Area)
VALUES
('Egypt',347289012,566789.56)
;
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
 INSERT INTO Country (Country_name, Population, Area)
VALUES
('Germany',847289012,888899.35)
;
 INSERT INTO Persons (Fname, Lname, Population, Rating, Country_Id, Country_name,DOB)
VALUES
  ('Rumu', 'Charm', 52000, 4.2, 11, 'United States','2005-06-11');
 -- 1.Find the number of persons in each country
 SELECT c.Country_Name, COUNT(p.Id) AS number_of_persons
FROM Country c
LEFT JOIN Persons p ON c.Id = p.Country_id
GROUP BY c.Country_Name;

-- 2.Find the number of persons in each country sorted from high to low
SELECT c.Country_Name, COUNT(p.Id) AS number_of_persons
FROM Country c
LEFT JOIN Persons p ON c.Id = p.Country_id
GROUP BY c.Country_Name
ORDER BY number_of_persons DESC;

-- 3.Find out average rating for Persons in respective countries if the average is greater than 3.0
SELECT Country_Name, AVG(Rating) as average_rating
FROM Persons
GROUP BY Country_Name
HAVING Avg(Rating) > 3.0;

 -- 4. Find the countries with the same rating as the USA (Using Subqueries)

          INSERT INTO Persons (Fname, Lname, Population, Rating, Country_Id, Country_name,DOB)
		VALUES
            ('John','Kennedy',847289012,4.2,12,'Germany','2005-01-10');

    SELECT DISTINCT p1.Country_Name
    FROM Persons p1
    WHERE p1.Rating IN (
    SELECT DISTINCT p2.Rating
    FROM Persons p2
    WHERE p2.Country_Name = 'United States'
                       )
AND p1.Country_Name != 'United States';

-- 5.Select all countries whose population is greater than the average population of all nations

 SELECT Country_Name, Population
FROM Country
WHERE Population > (
    SELECT AVG(Population)
    FROM Country
);

-- --------------------------------------***********************-----------------------------------
-- Create database
CREATE DATABASE Product;

-- Use the database
USE Product;

-- Create Customer table
CREATE TABLE Customer (
    Customer_Id INT PRIMARY KEY AUTO_INCREMENT,
    First_name VARCHAR(50),
    Last_name VARCHAR(50),
    Email VARCHAR(100),
    Phone_no VARCHAR(20),
    Address VARCHAR(200),
    City VARCHAR(50),
    State VARCHAR(50),
    Zip_code VARCHAR(10),
    Country VARCHAR(50)
);

-- Insert sample data into Customer table
INSERT INTO Customer (First_name, Last_name, Email, Phone_no, Address, City, State, Zip_code, Country)
VALUES
('Basima', 'Yoosaf', 'myhadi.basima@gmail.com', '+91-343-123456', 'PMNRA 35', 'Thattamala', 'Kollam', '691020', 'IND'),
('Jack', 'Jones', 'jones.jack@gmail.com', '+81-505-565656', '456 Oak Avenue', 'Los Angeles', 'California', '987630', 'USA'),
('Asif', 'Khan', 'xyzkhan@outlook.com', '+92-321-1234567', 'Minister Road', 'Bastille.', 'street', '7777	', 'Paris'),
('Manson', 'Saju', 'manson123@yahoo.com', '+44-91-1234567', 'Srinagar 124', 'Lanka', 'Mandra', '28001', 'Srilanka')
;

SELECT * FROM Customer;



-- 1. Create customer_info view

CREATE VIEW customer_info AS
SELECT 
    CONCAT(First_name, ' ', Last_name) AS Full_name,
    Email
FROM Customer;

-- displaying the view customer_info
SELECT * FROM customer_info;

-- 2. Create US_Customers view

CREATE VIEW US_Customers AS
SELECT *
FROM Customer
WHERE Country = 'USA';

select * from US_Customers;

-- 3. creating Customer_details view

CREATE VIEW Customer_details AS
SELECT 
    CONCAT(First_name, ' ', Last_name) AS full_name,
    Email,
    Phone_no,
    State
FROM Customer;

select * from Customer_details;

-- 4.Update phone numbers for California customers
/*UPDATE Customer
SET Phone_no = '+11-010-33445566'
WHERE State = 'California';
*/
UPDATE Customer
SET Phone_no = '+11-010-33445566'
WHERE State = 'California' AND Customer_Id = 2;

SELECT * FROM Customer;

-- 5.Count the number of customers in each state and show only states with more than 5 customers

INSERT INTO Customer (First_name, Last_name, Email, Phone_no, Address, City, State, Zip_code, Country)
VALUES
('Ben', 'Sam', 'abc@gmail.com', '+12-45-123456', 'little land', 'Varkala', 'Kollam', '691021', 'IND'),
('Aju', 'Sam', 'Sam123@gmail.com', '+12-45-178955', 'Aju villa', 'Varkala', 'Kollam', '691021', 'IND'),
('Manu', 'Donald', 'mandld@gmail.com', '+91-95-456898', 'heavens', 'Thevally', 'Kollam', '691023', 'IND'),
('Peter', 'Parker', 'petparker121@express.com', '+67-45-1702596', 'Sweet home', 'Varkala', 'Kollam', '691027', 'IND'),
('Xavio', 'Antony', '666Xavio@hotmail.com', '+18-45-999000', 'golden moments', 'Pallimukk', 'Kollam', '691030', 'IND')
;

SELECT * FROM Customer;
SELECT State, COUNT(*) AS Customer_Count
FROM Customer
GROUP BY State
HAVING COUNT(*) > 5;

-- 6.Write a query that will return the number of customers in each state, 
--   based on the "state" column in the "customer_details" view

SELECT State, COUNT(*) AS Customer_Count
FROM customer_details
GROUP BY State;

-- 7. Write a query that returns all the columns from the "customer_details" view, sorted by the "state" column in ascending order
SELECT *
FROM customer_details
ORDER BY State ASC;

-- ****************************------------------------------*********************************-------------------------------------------





