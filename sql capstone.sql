-- Create database
CREATE DATABASE library;
USE library;

-- Create Branch table
CREATE TABLE Branch (
    Branch_no INT PRIMARY KEY,
    Manager_Id INT,
    Branch_address VARCHAR(100),
    Contact_no VARCHAR(15)
);

-- Create Employee table
CREATE TABLE Employee (
    Emp_Id INT PRIMARY KEY,
    Emp_name VARCHAR(50),
    Position VARCHAR(50),
    Salary DECIMAL(10,2),
    Branch_no INT,
    FOREIGN KEY (Branch_no) REFERENCES Branch(Branch_no)
);

-- Create Books table
CREATE TABLE Books (
    ISBN VARCHAR(13) PRIMARY KEY,
    Book_title VARCHAR(100),
    Category VARCHAR(50),
    Rental_Price DECIMAL(10,2),
    Status VARCHAR(3),
    Author VARCHAR(50),
    Publisher VARCHAR(50)
);

-- Create Customer table
CREATE TABLE Customer (
    Customer_Id INT PRIMARY KEY,
    Customer_name VARCHAR(50),
    Customer_address VARCHAR(100),
    Reg_date DATE
);

-- Create IssueStatus table
CREATE TABLE IssueStatus (
    Issue_Id INT PRIMARY KEY,
    Issued_cust INT,
    Issued_book_name VARCHAR(100),
    Issue_date DATE,
    Isbn_book VARCHAR(13),
    FOREIGN KEY (Issued_cust) REFERENCES Customer(Customer_Id),
    FOREIGN KEY (Isbn_book) REFERENCES Books(ISBN)
);

-- Create ReturnStatus table
CREATE TABLE ReturnStatus (
    Return_Id INT PRIMARY KEY,
    Return_cust INT,
    Return_book_name VARCHAR(100),
    Return_date DATE,
    Isbn_book2 VARCHAR(13),
    FOREIGN KEY (Isbn_book2) REFERENCES Books(ISBN)
);

-- Insert sample data into Branch table
INSERT INTO Branch VALUES
(1, 101, 'PMNRA 35 BRIGADE STREET City1', '1234567890'),
(2, 102, '123 GANDI St City2', '26468788901'),
(3, 103, '456 BALAJI St City3', '38008945012');

select * from branch;


-- Insert sample data into Employee table
INSERT INTO Employee VALUES
(1, 'Alice Johnson', 'Manager', 60000.00, 1),
(2, 'Basima Yoosaf', 'Librarian', 55000.00, 1),
(3, 'Sam Abraham', 'Manager', 62000.00, 2),
(4, 'Zerin Willaim', 'Assistant', 35000.00, 2),
(5, 'Jomol John', 'Manager', 58000.00, 3),
(6, 'Lisa Andrew', 'Librarian', 47000.00, 3);

-- Insert sample data into Books table
INSERT INTO Books VALUES
('9780001234567', 'World History', 'History', 25.00, 'Yes', 'John Historian', 'History Press'),
('9780001234568', 'Modern Science', 'Science', 30.00, 'Yes', 'Sarah Scientist', 'Science Books'),
('9780001234569', 'Ancient History', 'History', 28.00, 'No', 'Mark Writer', 'History Press'),
('9780001234570', 'Programming 101', 'Technology', 35.00, 'Yes', 'Tech Author', 'Tech Books'),
('9780001234571', 'Programming 102', 'Technology', 35.00, 'Yes', 'Tanenbaum', 'Tech Books'),
('9780001234572', 'Digital Communication','Technology', 35.00, 'Yes', 'Sanjay Sharma', 'Pearson'),
('9780001234573', 'Data Science','Technology', 35.00, 'Yes', 'Shukla', 'Pearson'),
('978000123454', 'Data Science','Technology', 35.00, 'No', 'Sanjay Sharma', 'Bentley'),
('9780001234575', 'Digital Communication','Technology', 35.00, 'Yes', 'Ravi Sethi', 'Pearson')
;
select * from Books;

-- Insert sample data into Customer table
INSERT INTO Customer VALUES
(1, 'Arjun', '321 Elm St, City1', '2021-06-15'),
(2, 'Hari dev', '654 Maple St, City2', '2022-03-20'),
(3, 'Leah John', '987 Birch St, City3', '2021-12-28'),
(4, 'Sharon', '147 Pine St, City1', '2023-01-10');

-- Insert sample data into IssueStatus table
INSERT INTO IssueStatus VALUES
(1, 1, 'World History', '2023-06-15', '9780001234567'),
(2, 2, 'Modern Science', '2023-06-20', '9780001234568'),
(3, 3, 'Programming 101', '2023-07-01', '9780001234570')
;
-- Insert sample data into ReturnStatus table
INSERT INTO ReturnStatus VALUES
(1, 1, 'World History', '2023-06-30', '9780001234567'),
(2, 2, 'Modern Science', '2023-07-05', '9780001234568');

-- Queries

-- 1. Retrieve available books
SELECT Book_title, Category, Rental_Price 
FROM Books 
WHERE Status = 'Yes';

-- 2. List employees by salary
SELECT Emp_name, Salary 
FROM Employee 
ORDER BY Salary DESC;

-- 3. Book titles and customers who issued them
SELECT b.Book_title, c.Customer_name
FROM Books b
JOIN IssueStatus i ON b.ISBN = i.Isbn_book
JOIN Customer c ON i.Issued_cust = c.Customer_Id;

-- 4. Count of books in each category
SELECT Category, COUNT(*) as book_count
FROM Books
GROUP BY Category;

-- 5. Employees with salary > 50000
SELECT Emp_name, Position
FROM Employee
WHERE Salary > 50000;

-- 6. Customers registered before 2022 with no issues
SELECT c.Customer_name
FROM Customer c
LEFT JOIN IssueStatus i ON c.Customer_Id = i.Issued_cust
WHERE c.Reg_date < '2022-01-01' AND i.Issue_Id IS NULL;

-- 7. Employee count by branch
SELECT Branch_no, COUNT(*) as emp_count
FROM Employee
GROUP BY Branch_no;

-- 8. Customers who issued books in June 2023
SELECT DISTINCT c.Customer_name
FROM Customer c
JOIN IssueStatus i ON c.Customer_Id = i.Issued_cust
WHERE MONTH(i.Issue_date) = 6 AND YEAR(i.Issue_date) = 2023;

-- 9. Books containing 'history'
SELECT Book_title
FROM Books
WHERE Book_title LIKE '%History%';

-- 10. Branches with more than 5 employees
SELECT e.Branch_no, COUNT(*) as emp_count
FROM Employee e
GROUP BY e.Branch_no
HAVING COUNT(*) > 5;

-- 11. Branch managers and addresses
SELECT e.Emp_name, b.Branch_address
FROM Employee e
JOIN Branch b ON e.Branch_no = b.Branch_no
WHERE e.Position = 'Manager';

-- 12. Customers who issued expensive books
SELECT DISTINCT c.Customer_name
FROM Customer c
JOIN IssueStatus i ON c.Customer_Id = i.Issued_cust
JOIN Books b ON i.Isbn_book = b.ISBN
WHERE b.Rental_Price > 25
;
