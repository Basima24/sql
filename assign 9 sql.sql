create database Factory;
use Factory;
CREATE TABLE Worker (
    Worker_Id INT PRIMARY KEY,
    FirstName CHAR(25),
    LastName CHAR(25),
    Salary INT,
    JoiningDate datetime,
    Department CHAR(25)
);
-- 1.
DELIMITER $$
CREATE PROCEDURE AddWorker(
    IN p_worker_id INT,
    IN p_firstname CHAR(25),
    IN p_lastname CHAR(25),
    IN p_salary INT,
    IN p_joiningdate DATETIME,
    IN p_department CHAR(25)
)
BEGIN
    INSERT INTO Worker (Worker_Id, FirstName, LastName, Salary, JoiningDate, Department)
    VALUES (p_worker_id, p_firstname, p_lastname, p_salary, p_joiningdate, p_department);
END $$
DELIMITER ;
desc worker;

-- Call the AddWorker procedure
CALL AddWorker(1, 'Davis', 'Tomy', 60000, '2023-01-01 09:00:00', 'Production');
call addworker(2, 'Rinchu', 'Karthik',55000,'2024-05-08 10:00:00','HR');
call addworker(3, 'Paul', 'Johnson',62000,'2024-05-08 11:30:00','Production');
select * from worker;

-- 2. Procedure to get worker's salary
DELIMITER $$
CREATE PROCEDURE GetWorkerSalary(
    IN p_worker_id INT,
    OUT p_salary INT
)
BEGIN
    SELECT Salary INTO p_salary
    FROM Worker
    WHERE Worker_Id = p_worker_id;
END $$
DELIMITER ;

-- Call the GetWorkerSalary procedure
SET @salary = 0;
CALL GetWorkerSalary(1, @salary);
SELECT @salary AS worker_salary;

-- 3. Procedure to update worker's department
DELIMITER $$
CREATE PROCEDURE UpdateWorkerDepartment(
    IN p_worker_id INT,
    IN p_department CHAR(25)
)
BEGIN
    UPDATE Worker 
    SET Department = p_department
    WHERE Worker_Id = p_worker_id;
END $$
DELIMITER ;

-- Call the UpdateWorkerDepartment procedure
CALL UpdateWorkerDepartment(1, 'IT');

-- 4. Procedure to count workers in a department
DELIMITER $$
CREATE PROCEDURE GetDepartmentWorkerCount(
    IN p_department CHAR(25),
    OUT p_workerCount INT
)
BEGIN
    SELECT COUNT(*) INTO p_workerCount
    FROM Worker
    WHERE Department = p_department;
END $$
DELIMITER ;

-- Call the GetDepartmentWorkerCount procedure
SET @worker_count = 0;
CALL GetDepartmentWorkerCount('IT', @worker_count);
SELECT @worker_count AS department_worker_count;

-- 5. Procedure to get average salary by department
DELIMITER $$
CREATE PROCEDURE GetDepartmentAvgSalary(
    IN p_department CHAR(25),
    OUT p_avgSalary DECIMAL(10,2)
)
BEGIN
    SELECT AVG(Salary) INTO p_avgSalary
    FROM Worker
    WHERE Department = p_department;
END $$
DELIMITER ;

-- Call the GetDepartmentAvgSalary procedure
SET @avg_salary = 0;
CALL GetDepartmentAvgSalary('IT', @avg_salary);
SELECT @avg_salary AS department_avg_salary;





