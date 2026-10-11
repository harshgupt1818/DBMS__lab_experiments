# Experiment 02: Relational Schema, Constraints & Referential Integrity

## Aim
To convert the E-R diagram of a College / Academic platform into a relational schema, create MySQL tables with `PRIMARY KEY`, `NOT NULL`, `UNIQUE`, `ON DELETE CASCADE`, and `ON DELETE SET NULL` constraints, insert sample data, and demonstrate referential integrity maintenance and violation handling.

## Schema Architecture (`CollegeDB`)
- **Department** (`Dept_ID` PK, `Dept_Name` UNIQUE NOT NULL)
- **Student** (`Student_ID` PK, `Student_Name` NOT NULL, `Email` UNIQUE, `Dept_ID` FK $\rightarrow$ `Department(Dept_ID)` with `ON DELETE SET NULL`)
- **Course** (`Course_ID` PK, `Course_Name` NOT NULL, `Credits` NOT NULL)
- **Enrollment** (`Enroll_ID` PK, `Student_ID` FK $\rightarrow$ `Student(Student_ID)` with `ON DELETE CASCADE`, `Course_ID` FK $\rightarrow$ `Course(Course_ID)` with `ON DELETE CASCADE`)

## Key Concepts Demonstrated
1. **Primary Key Constraints**: Entity integrity across all tables.
2. **Unique & Not Null Constraints**: Enforcing valid emails and non-empty student/course names.
3. **Foreign Keys with `ON DELETE SET NULL`**: When a department is removed, affiliated students remain in the database with their `Dept_ID` set to `NULL`.
4. **Foreign Keys with `ON DELETE CASCADE`**: When a student or course is deleted, associated enrollment records are automatically purged to prevent orphaned references.
5. **Referential Integrity Violation Handling**: Preventing insertions referencing non-existent parent records.

## Execution Instructions
Run the script using MySQL client or CLI:
```bash
mysql -u root -p < experiment_02.sql
```
Or execute inside MySQL Workbench / phpMyAdmin.
