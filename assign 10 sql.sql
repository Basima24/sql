create database NewIndianSchool;
use NewIndianSchool;
-- 1. Create teachers table and insert sample data
CREATE TABLE teachers (
    id INT PRIMARY KEY AUTO_INCREMENT,
    name VARCHAR(50),
    subject VARCHAR(50),
    experience INT,
    salary DECIMAL(10,2)
);

-- Create teacher_log table for tracking changes
CREATE TABLE teacher_log (
    log_id INT PRIMARY KEY AUTO_INCREMENT,
    teacher_id INT,
    action VARCHAR(50),
    timestamp TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

-- Insert sample data
INSERT INTO teachers (name, subject, experience, salary) VALUES
    ('Abin John', 'Mathematics', 2, 25000.00),
    ('Aliya N', 'English', 5, 35000.00),
    ('Saheer Harry', 'Physics', 15, 80000.00),
    ('Minna Sam', 'Chemistry', 9,72000.00),
    ('Harry Johnson', 'History', 15, 70000.00),
    ('Louis Philpp', 'Biology', 9, 68000.00),
    ('Prelet B', 'Computer Science', 7, 72000.00),
    ('Basima Yoosaf', 'Geography', 10, 60000.00);
    select * from teachers;

-- 2. Create before insert trigger to check salary
DELIMITER $$
CREATE TRIGGER before_insert_teacher
BEFORE INSERT ON teachers
FOR EACH ROW
BEGIN
    IF NEW.salary < 0 THEN
        SIGNAL SQLSTATE '45000'
        SET MESSAGE_TEXT = 'Salary cannot be negative';
    END IF;
END $$
DELIMITER ;
INSERT INTO teachers (name, subject, experience, salary) 
VALUES
('Alice Maman', 'Computer', 3, -35000.00);
    
-- 3. Create after insert trigger to log new entries
DELIMITER $$
CREATE TRIGGER after_insert_teacher
AFTER INSERT ON teachers
FOR EACH ROW
BEGIN
    INSERT INTO teacher_log (teacher_id, action, timestamp)
    VALUES (NEW.id, 'INSERT', CURRENT_TIMESTAMP);
END $$
DELIMITER ;

INSERT INTO teachers (name, subject, experience, salary)
VALUES ('Hanna Montana', 'Graphics', 5, 55000.00);
select * from teachers;

-- 4. Create before delete trigger to prevent deletion of experienced teachers

DELIMITER $$
CREATE TRIGGER before_delete_teacher
BEFORE DELETE ON teachers
FOR EACH ROW
BEGIN
    IF OLD.experience > 10 THEN
        SIGNAL SQLSTATE '45000'
        SET MESSAGE_TEXT = 'Cannot delete teachers with more than 10 years of experience';
    END IF;
END $$
DELIMITER ;

DELETE FROM teachers WHERE name = 'Harry Johnson';

-- 5. Create after delete trigger to log deletions
DELIMITER $$
CREATE TRIGGER after_delete_teacher
AFTER DELETE ON teachers
FOR EACH ROW
BEGIN
    INSERT INTO teacher_log (teacher_id, action, timestamp)
    VALUES (OLD.id, 'DELETE', CURRENT_TIMESTAMP);
END $$
DELIMITER ;

SELECT * FROM teacher_log ORDER BY timestamp DESC;
