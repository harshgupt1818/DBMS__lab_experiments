# Experiment 03: Basic SQL DDL, DML, Aggregations, Grouping, and Conditional Logic

## Aim
To create an Employee–Department–Project relational schema, populate it with at least 30 employee records distributed across 5 departments and 8 projects, and execute SQL queries demonstrating selection, projection, aggregate functions, `GROUP BY`, `HAVING`, conditional `CASE` expressions, and `ORDER BY` sorting.

## Database Entities & Relationships
- **Department** (`dept_id`, `dept_name`)
- **Project** (`project_id`, `project_name`, `dept_id` $\rightarrow$ FK to `Department`)
- **Employee** (`emp_id`, `emp_name`, `dept_id` $\rightarrow$ FK, `project_id` $\rightarrow$ FK, `salary`, `city`)

## Operations Demonstrated
1. **Selection (`WHERE`)**: Filter employees based on location (`city = 'Delhi'`).
2. **Projection (`SELECT columns`)**: Extract specific attributes (`emp_name`, `salary`).
3. **Aggregation & Grouping (`GROUP BY`, `AVG`)**: Compute departmental salary averages.
4. **Group Filtering (`HAVING`)**: Isolate departments with headcount greater than 5.
5. **Conditional Logic (`CASE`)**: Segment workforce into salary brackets (`< 50000`: Low, `50000 - 60000`: Medium, `> 60000`: High).
6. **Sorting (`ORDER BY`)**: Rank employees in descending order of compensation.

## Execution Instructions
Run using MySQL CLI:
```bash
mysql -u root -p < experiment_03.sql
```
