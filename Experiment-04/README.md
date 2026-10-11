# Experiment 04: Advanced Joins, Correlated Subqueries, Set Simulation & Execution Plans

## Aim
Using the Employee–Department–Project schema, construct and evaluate SQL queries utilizing `INNER JOIN`, `LEFT JOIN`, self-joins, three-way joins, correlated subqueries, the `EXISTS` predicate, simulated `INTERSECT` and `EXCEPT` operations, and examine query execution plans using `EXPLAIN`.

## Relational Concepts Explored
1. **Inner Joins**: Match records where foreign keys and primary keys align.
2. **Left Outer Joins**: Preserve unmatched left-side records while appending matching right-side attributes.
3. **Self Joins**: Pair distinct rows from the same table using aliasing (`E1.dept_id = E2.dept_id AND E1.emp_id < E2.emp_id`).
4. **Multi-Table Joins**: Join `Employee`, `Project`, and `Department` across multiple relational edges.
5. **Correlated Subqueries**: Evaluate outer query row values inside an inner subquery (e.g. comparing individual salary to departmental average).
6. **Set Operations Simulation**:
   - `INTERSECT` simulated via double `IN (SELECT ...)` subqueries.
   - `EXCEPT` / `MINUS` simulated via `NOT IN (SELECT ...)`.
7. **Query Optimization & Plan Inspection**: Using `EXPLAIN` to diagnose index usage, join types (e.g., `ALL`, `ref`, `eq_ref`), and row scans.

## Execution Instructions
Run using MySQL CLI:
```bash
mysql -u root -p < experiment_04.sql
```
