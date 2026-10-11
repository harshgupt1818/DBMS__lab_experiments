# Experiment 05: Views, View Updatability, and Recursive Common Table Expressions (CTEs)

## Aim
To create SQL views for departmental salary summaries and employee organizational hierarchy, assess the updatability of views under aggregation and join conditions, and formulate a recursive Common Table Expression (CTE) to traverse and output hierarchical reporting chains.

## Key Concepts & Mechanisms
1. **Aggregated Views (`Department_Salary_Summary`)**:
   - Computes `COUNT`, `AVG`, `MAX`, and `MIN` salary metrics grouped by department.
   - Demonstrates read-only non-updatable views resulting from group functions and aggregate projections.
2. **Join Views (`Employee_Hierarchy`)**:
   - Joins `Employee` with itself (`LEFT JOIN Employee M ON E.Manager_ID = M.Emp_ID`) to attach manager names to subordinates.
3. **Self-Referencing Foreign Key (`FK_Employee_Manager`)**:
   - Relational modeling of tree/graph structures where `Manager_ID` references `Emp_ID` in the same table.
4. **Recursive CTE (`WITH RECURSIVE Employee_Chain`)**:
   - **Anchor Member**: Base case selecting top-level executives (`Manager_ID IS NULL`) assigned to Level 1.
   - **Recursive Member**: Iterative step joining employees to their supervisors, incrementing `Level + 1` until all reporting tiers are mapped.

## Requirements
- **MySQL Version**: MySQL 8.0+ (required for `WITH RECURSIVE` CTE support).

## Execution Instructions
Run using MySQL CLI:
```bash
mysql -u root -p < experiment_05.sql
```
