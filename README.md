# Database Management Systems (DBMS) Laboratory Experiments

Comprehensive collection of structured MySQL lab experiments covering relational schema design, integrity constraints, query operations, joins, views, recursive CTEs, stored procedures, and triggers.

---

## 📑 Experiments Index

| Experiment | Title | Description | MySQL Script | Documentation |
| :--- | :--- | :--- | :--- | :--- |
| **Experiment 02** | Relational Schema & Referential Integrity | CollegeDB schema with `PRIMARY KEY`, `NOT NULL`, `UNIQUE`, `ON DELETE SET NULL`, and `ON DELETE CASCADE`. | [experiment_02.sql](file:///c:/Users/Dell/OneDrive/Desktop/dbms/Experiment-02/experiment_02.sql) | [README.md](file:///c:/Users/Dell/OneDrive/Desktop/dbms/Experiment-02/README.md) |
| **Experiment 03** | DDL, DML, Aggregations & Grouping | Employee–Department–Project schema (30 rows, 5 depts, 8 projects), `GROUP BY`, `HAVING`, `CASE`, and `ORDER BY`. | [experiment_03.sql](file:///c:/Users/Dell/OneDrive/Desktop/dbms/Experiment-03/experiment_03.sql) | [README.md](file:///c:/Users/Dell/OneDrive/Desktop/dbms/Experiment-03/README.md) |
| **Experiment 04** | Joins, Subqueries & Execution Plans | `INNER JOIN`, `LEFT JOIN`, self-join, 3-way join, correlated subqueries, `EXISTS`, set operation simulations, and `EXPLAIN`. | [experiment_04.sql](file:///c:/Users/Dell/OneDrive/Desktop/dbms/Experiment-04/experiment_04.sql) | [README.md](file:///c:/Users/Dell/OneDrive/Desktop/dbms/Experiment-04/README.md) |
| **Experiment 05** | Views & Recursive Common Table Expressions | Aggregated views, hierarchy join views, view updatability rules, and organizational chain traversal with recursive CTEs. | [experiment_05.sql](file:///c:/Users/Dell/OneDrive/Desktop/dbms/Experiment-05/experiment_05.sql) | [README.md](file:///c:/Users/Dell/OneDrive/Desktop/dbms/Experiment-05/README.md) |
| **Experiment 06** | Stored Procedures & Triggers | `transfer_employee` stored procedure with custom error handling (`SIGNAL SQLSTATE`), validation trigger, and audit logging trigger. | [experiment_06.sql](file:///c:/Users/Dell/OneDrive/Desktop/dbms/Experiment-06/experiment_06.sql) | [README.md](file:///c:/Users/Dell/OneDrive/Desktop/dbms/Experiment-06/README.md) |

---

## 🛠️ Prerequisites & MySQL Requirements

- **Database Server**: MySQL 8.0 or higher (required for Recursive CTE support in Experiment 5).
- **Client Tools**: MySQL Command Line Client (`mysql`), MySQL Workbench, or any compliant SQL IDE.

---

## 🚀 Execution Instructions

You can run any experiment individually using the MySQL CLI:

```bash
# Connect to MySQL and run an experiment
mysql -u <username> -p < Experiment-02/experiment_02.sql
mysql -u <username> -p < Experiment-03/experiment_03.sql
mysql -u <username> -p < Experiment-04/experiment_04.sql
mysql -u <username> -p < Experiment-05/experiment_05.sql
mysql -u <username> -p < Experiment-06/experiment_06.sql
```

Alternatively, open and execute each script inside MySQL Workbench.

---

## 🧪 Testing & Validation Status

- **Static Syntax & Dependency Analysis**: ✅ Completed. All table creation orders, foreign key dependencies, recursive CTE anchor/recursive structures, delimiter definitions, and trigger specifications have been strictly validated against MySQL 8.0+ standards.
- **Runtime Execution**: ⚠️ Static verification performed. Local MySQL server CLI was not detected in PATH during environment inspection; execute against your active MySQL server instance following the instructions above.
