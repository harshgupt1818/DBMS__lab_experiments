-- ============================================================================
-- Experiment 06: Stored Procedures, Error Handling, and Triggers (Audit & Validation)
-- Database: CompanyDB_Exp06
-- ============================================================================

CREATE DATABASE IF NOT EXISTS CompanyDB_Exp06;
USE CompanyDB_Exp06;

-- Drop existing procedures, triggers, and tables to allow clean re-execution
DROP PROCEDURE IF EXISTS transfer_employee;
DROP TABLE IF EXISTS Salary_Audit;
DROP TABLE IF EXISTS Employee;
DROP TABLE IF EXISTS Department;

-- 1. Department Table
CREATE TABLE Department (
    Dept_ID INT PRIMARY KEY,
    Dept_Name VARCHAR(100) NOT NULL
);

-- 2. Employee Table
CREATE TABLE Employee (
    Emp_ID INT PRIMARY KEY,
    Emp_Name VARCHAR(100) NOT NULL,
    Salary DECIMAL(10,2) NOT NULL,
    Dept_ID INT,
    FOREIGN KEY (Dept_ID) REFERENCES Department(Dept_ID)
);

-- 3. Salary Audit Log Table
CREATE TABLE Salary_Audit (
    Audit_ID INT AUTO_INCREMENT PRIMARY KEY,
    Emp_ID INT,
    Old_Salary DECIMAL(10,2),
    New_Salary DECIMAL(10,2),
    Changed_At TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

-- ============================================================================
-- Sample Data Insertion
-- ============================================================================

INSERT INTO Department (Dept_ID, Dept_Name) VALUES 
(1, 'Sales'),
(2, 'Engineering');

INSERT INTO Employee (Emp_ID, Emp_Name, Salary, Dept_ID) VALUES 
(1, 'Alex', 60000.00, 1);

-- ============================================================================
-- Stored Procedure: transfer_employee with Validation & Error Handling
-- ============================================================================

DELIMITER $$

CREATE PROCEDURE transfer_employee(
    IN p_emp_id INT,
    IN p_new_dept_id INT
)
BEGIN
    DECLARE emp_count INT DEFAULT 0;
    DECLARE dept_count INT DEFAULT 0;

    -- Validate employee existence
    SELECT COUNT(*) INTO emp_count
    FROM Employee
    WHERE Emp_ID = p_emp_id;

    -- Validate department existence
    SELECT COUNT(*) INTO dept_count
    FROM Department
    WHERE Dept_ID = p_new_dept_id;

    IF emp_count = 0 THEN
        SIGNAL SQLSTATE '45000'
        SET MESSAGE_TEXT = 'Employee does not exist';
    ELSEIF dept_count = 0 THEN
        SIGNAL SQLSTATE '45000'
        SET MESSAGE_TEXT = 'Department does not exist';
    ELSE
        UPDATE Employee
        SET Dept_ID = p_new_dept_id
        WHERE Emp_ID = p_emp_id;
    END IF;
END $$

DELIMITER ;

-- ============================================================================
-- Procedure Execution and Edge Cases Testing
-- ============================================================================

-- Valid transfer: Move Alex from Sales (1) to Engineering (2)
CALL transfer_employee(1, 2);

-- Verify department update
SELECT * FROM Employee WHERE Emp_ID = 1;

-- Intended Error Case 1: Non-existent employee (Uncomment to test)
-- Expected error: SQLSTATE '45000': Employee does not exist
-- CALL transfer_employee(999, 2);

-- Intended Error Case 2: Non-existent department (Uncomment to test)
-- Expected error: SQLSTATE '45000': Department does not exist
-- CALL transfer_employee(1, 999);

-- ============================================================================
-- Trigger 1: BEFORE UPDATE for Salary Validation (Prevent Negative Salaries)
-- ============================================================================

DELIMITER $$

CREATE TRIGGER before_employee_salary_update
BEFORE UPDATE ON Employee
FOR EACH ROW
BEGIN
    IF NEW.Salary < 0 THEN
        SIGNAL SQLSTATE '45000'
        SET MESSAGE_TEXT = 'Salary cannot be negative';
    END IF;
END $$

DELIMITER ;

-- Intended Error Case 3: Negative salary update (Uncomment to test)
-- Expected error: SQLSTATE '45000': Salary cannot be negative
-- UPDATE Employee SET Salary = -5000 WHERE Emp_ID = 1;

-- ============================================================================
-- Trigger 2: AFTER UPDATE for Audit Logging
-- ============================================================================

DELIMITER $$

CREATE TRIGGER after_employee_salary_update
AFTER UPDATE ON Employee
FOR EACH ROW
BEGIN
    IF OLD.Salary <> NEW.Salary THEN
        INSERT INTO Salary_Audit (
            Emp_ID,
            Old_Salary,
            New_Salary
        ) VALUES (
            OLD.Emp_ID,
            OLD.Salary,
            NEW.Salary
        );
    END IF;
END $$

DELIMITER ;

-- ============================================================================
-- Testing Triggers
-- ============================================================================

-- Update salary: Alex gets a raise from 60000.00 to 65000.00
UPDATE Employee
SET Salary = 65000.00
WHERE Emp_ID = 1;

-- Verify Audit Table has recorded the change
SELECT * FROM Salary_Audit;

-- Verify Employee Table contains updated salary
SELECT Emp_ID, Emp_Name, Salary, Dept_ID
FROM Employee
WHERE Emp_ID = 1;
