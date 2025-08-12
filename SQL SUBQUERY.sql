-- Get each employee's salary and how much above the average salary they earn
SELECT emp_name,
       salary,
       salary - (SELECT AVG(salary) FROM employees) AS above_avg_salary
FROM employees;
-- Get employees who earn more than the average salary
SELECT emp_name, salary
FROM employees
WHERE salary > (SELECT AVG(salary) FROM employees);
-- Get employees who earn more than the average salary of their department
SELECT emp_name, dept_id, salary
FROM employees e
WHERE salary > (
    SELECT AVG(salary)
    FROM employees
    WHERE dept_id = e.dept_id
);
-- Get employees who work in departments having a project
SELECT emp_name, dept_id
FROM employees
WHERE dept_id IN (
    SELECT DISTINCT dept_id
    FROM projects
);
-- Get employees who are in a department that has at least one project
SELECT emp_name, dept_id
FROM employees e
WHERE EXISTS (
    SELECT 1
    FROM projects p
    WHERE p.dept_id = e.dept_id
);

