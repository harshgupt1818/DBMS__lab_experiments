# Experiment 06: Stored Procedures, Error Handling, and Triggers (Audit & Validation)

## Aim
To create a stored procedure `transfer_employee(emp_id, new_dept_id)` with validation and custom error handling using `SIGNAL SQLSTATE`, and to implement `BEFORE UPDATE` and `AFTER UPDATE` triggers for data integrity validation and automated audit logging, including testing edge cases.

## Database Objects Implemented
1. **Tables**:
   - `Department`: Holds departmental references.
   - `Employee`: Stores personnel records with foreign key relationship to `Department`.
   - `Salary_Audit`: Audit log recording `Emp_ID`, `Old_Salary`, `New_Salary`, and timestamp `Changed_At`.
2. **Stored Procedure (`transfer_employee`)**:
   - Parameters: `IN p_emp_id INT`, `IN p_new_dept_id INT`.
   - Error Handling: Checks existence of employee and department. Uses `SIGNAL SQLSTATE '45000'` with informative error messages when IDs are missing before performing an `UPDATE`.
3. **Validation Trigger (`before_employee_salary_update`)**:
   - Fires `BEFORE UPDATE ON Employee FOR EACH ROW`.
   - Validates that `NEW.Salary >= 0`. If negative, raises `SIGNAL SQLSTATE '45000'` ("Salary cannot be negative").
4. **Audit Trigger (`after_employee_salary_update`)**:
   - Fires `AFTER UPDATE ON Employee FOR EACH ROW`.
   - If `OLD.Salary <> NEW.Salary`, inserts an audit entry into `Salary_Audit`.

## Execution Instructions
Run using MySQL CLI:
```bash
mysql -u root -p < experiment_06.sql
```
*(Ensure delimiter support is present in client; MySQL CLI and Workbench execute `DELIMITER $$` natively).*
