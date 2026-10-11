# Experiment 02: Relational Schema, Constraints & Referential Integrity
-- Database: CollegeDB

CREATE DATABASE IF NOT EXISTS CollegeDB;
USE CollegeDB;

-- Drop existing tables to allow clean re-execution (child tables dropped first)
DROP TABLE IF EXISTS Enrollment;
DROP TABLE IF EXISTS Student;
DROP TABLE IF EXISTS Course;
DROP TABLE IF EXISTS Department;

-- 1. Department Table
CREATE TABLE Department (
    Dept_ID INT PRIMARY KEY,
    Dept_Name VARCHAR(50) NOT NULL UNIQUE
);

-- 2. Student Table
-- Department foreign key configured with ON DELETE SET NULL
CREATE TABLE Student (
    Student_ID INT PRIMARY KEY,
    Student_Name VARCHAR(50) NOT NULL,
    Email VARCHAR(100) UNIQUE,
    Dept_ID INT,
    FOREIGN KEY (Dept_ID) REFERENCES Department(Dept_ID)
        ON DELETE SET NULL
);

-- 3. Course Table
CREATE TABLE Course (
    Course_ID INT PRIMARY KEY,
    Course_Name VARCHAR(50) NOT NULL,
    Credits INT NOT NULL
);

-- 4. Enrollment Table
-- Student and Course foreign keys configured with ON DELETE CASCADE
CREATE TABLE Enrollment (
    Enroll_ID INT PRIMARY KEY,
    Student_ID INT,
    Course_ID INT,
    FOREIGN KEY (Student_ID) REFERENCES Student(Student_ID)
        ON DELETE CASCADE,
    FOREIGN KEY (Course_ID) REFERENCES Course(Course_ID)
        ON DELETE CASCADE
);

-- ============================================================================
-- Sample Data Insertion
-- ============================================================================

-- Insert into Department
INSERT INTO Department (Dept_ID, Dept_Name) VALUES
(1, 'CSE'),
(2, 'AIML');

-- Insert into Student
INSERT INTO Student (Student_ID, Student_Name, Email, Dept_ID) VALUES
(101, 'RAHUL', 'rahul@gmail.com', 1),
(102, 'VANSH', 'vansh@gmail.com', 2);

-- Insert into Course
INSERT INTO Course (Course_ID, Course_Name, Credits) VALUES
(201, 'DBMS', 4),
(202, 'OPERATING SYSTEM', 4);

-- Insert into Enrollment
INSERT INTO Enrollment (Enroll_ID, Student_ID, Course_ID) VALUES
(1, 101, 201),
(2, 102, 202);

-- Verify Initial Data
SELECT * FROM Department;
SELECT * FROM Student;
SELECT * FROM Course;
SELECT * FROM Enrollment;

-- ============================================================================
-- Referential Integrity & Constraint Verification Tests
-- ============================================================================

-- Test 1: Verify ON DELETE SET NULL on Student when Department is deleted
-- Deleting Department 1 should set Rahul's Dept_ID to NULL
DELETE FROM Department WHERE Dept_ID = 1;
SELECT * FROM Student;

-- Test 2: Verify ON DELETE CASCADE on Enrollment when Student is deleted
-- Deleting Student 102 should automatically delete their enrollment record (Enroll_ID = 2)
DELETE FROM Student WHERE Student_ID = 102;
SELECT * FROM Enrollment;

-- Test 3: Demonstrate Referential Integrity Violations (Uncomment to test)
-- Expected Error: Cannot add or update a child row (foreign key constraint fails)
-- INSERT INTO Student (Student_ID, Student_Name, Email, Dept_ID) VALUES (103, 'Amit', 'amit@gmail.com', 999);

-- Test 4: Demonstrate UNIQUE Constraint Violation (Uncomment to test)
-- Expected Error: Duplicate entry 'rahul@gmail.com' for key 'Email'
-- INSERT INTO Student (Student_ID, Student_Name, Email, Dept_ID) VALUES (104, 'Rohan', 'rahul@gmail.com', 2);

-- Test 5: Demonstrate NOT NULL Constraint Violation (Uncomment to test)
-- Expected Error: Column 'Student_Name' cannot be null
-- INSERT INTO Student (Student_ID, Student_Name, Email, Dept_ID) VALUES (105, NULL, 'test@gmail.com', 2);
