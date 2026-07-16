-- Determine the Structure of DEPT Table and its Contents.
select first_name,salary,commission_pct from hr.EMPLOYEES where commission_pct is not NULL order by 2 desc, 3 desc

-- The HR department needs a query to display all unique job codes from the EMP table
select distinct(job_id) from hr.EMPLOYEES;

-- The HR department wants more descriptive column headings for its report on employees. Name the column headings Emp #, Employee, Job, and Hire Date, respectively by giving Column Alias.
select employee_id as "emp #",
first_name  as "Employee",
JOB_ID as "Job",
hire_date as "Hire Date"
FROM HR.employees;

-- The HR department has requested a report of all employees and their job IDs. Display the last name concatenated with the job ID (separated by a comma and space) and name the column Employee and Title by giving Column Alias
SELECT last_name || ', ' || job_id AS EMPLOYEE
FROM hr.employees;

-- To familiarize yourself with the data in the EMP table, create a query to display all the data from that table. Separate each column output by a comma. ENAME,JOB,HIREDATE,MGR.Name the column title THE_OUTPUT.
SELECT first_name || ',' || job_id || ',' || hire_date || ',' || manager_id AS THE_OUTPUT
FROM hr.EMPLOYEES;

-- Create a report to display the ename, job, and Hiredate for the employees name is SCOTT or TURNER. Order the query in ascending order by hiredate.
SELECT first_name, job_id, hire_date
FROM hr.employees
WHERE first_name IN ('Scott', 'Turner')
ORDER BY hire_date ASC;

-- Create a query to display the last name and salary for all employees. Format the salary to be 15 characters long, left-padded with the $ symbol. Label the column SALARY.
SELECT last_name,
LPAD(salary, 15, '$') AS SALARY
FROM hr.employees;

-- Display the last name, hire date, and day of the week on which the employee started. Label the column DAY. Order the results by the day of the week, starting with Monday.
SELECT last_name,
hire_date,
TO_CHAR(hire_date, 'fmDay') AS DAY
FROM hr.employees
ORDER BY MOD(TRUNC(hire_date) - DATE '1900-01-01', 7);

-- Display the ename and department number of all employees in departments 20 or 30 in ascending alphabetical order by ename
SELECT first_name, department_id
FROM hr.employees
WHERE department_id = 20 OR department_id = 30
ORDER BY first_name ASC;

-- Modify the previous query to display the last name and salary of employees who earn between 2000 and 3000 and are in department 20 or 30. Label the columns Employee and Monthly Salary, respectively giving Column Alias.
SELECT
last_name AS "Employee",
salary AS "Monthly salary"
FROM hr.employees
WHERE (salary BETWEEN 2000 AND 3000)
AND (department_id IN (20, 30));

-- The HR department needs a report that displays the last name and hire date for all employees who were hired in 1981
SELECT last_name, hire_date
FROM hr.employees
WHERE TO_CHAR(hire_date, 'YYYY') = '1981';

-- Display the Ename, Sal of employees who earn more than an amount the user specifies after a Prompt.
SELECT ename, sal
FROM emp
WHERE sal > &user_specified_amount;

-- Create a report to display the last name and job title of all employees who do not have a manager.
SELECT last_name, job_id
FROM hr.employees
WHERE manager_id IS NULL;

-- Create a query that prompts the user for Manager ID and generate EMPNO, ENAME, SAL, DEPTNO. The user should have the ability to sort the records on a selected Column.
SELECT
employee_id AS "EMPNO",
first_name AS "ENAME",
salary AS "SAL",
department_id AS "DEPTNO"
FROM hr.employees
WHERE manager_id = &prompt_manager_id
ORDER BY &prompt_sort_column;

-- The HR department wants to run reports based on a manager. Create a query that prompts the user for a MGR and generates the empno, ename, salary, and department for that manager’s employees. The HR department wants the ability to sort the report on a selected column
SELECT
employee_id AS "EMPNO",
first_name AS "ENAME",
salary AS "SAL",
department_id AS "DEPTNO"
FROM hr.employees
WHERE manager_id = &prompt_manager_id
ORDER BY &prompt_sort_column;

-- Display all employee last names in which the third letter of the name is A
SELECT last_name
FROM hr.employees
WHERE last_name LIKE '__A';

-- Display the Ename, Job, Sal for all employees whose jobs are CLERK and whose salary is in 800 or 950 or 1300.
SELECT first_name, job_id, salary
FROM hr.employees
WHERE job_id = 'CLERK'
AND salary IN (800, 950, 1300);

-- Write a query to display the current date. Label the column Date.
SELECT SYSDATE AS "Date"
FROM dual;

-- The HR department needs a report to display the employee number, last name, salary, and salary increased by 15.5% (expressed as a whole number) for each employee. Label the column New Salary.
SELECT
employee_id,
last_name,
salary,
ROUND(salary * 1.155) AS "New Salary"
FROM hr.employees;

-- Modify the previous query to add a column alias that subtracts the old salary from the new salary. Label the column Increase
SELECT
employee_id,
last_name,
salary,
ROUND(salary * 1.155) AS "New Salary",
ROUND(salary * 1.155) - salary AS "Increase"
FROM hr.employees;

-- Find the highest, lowest, sum, and average salary of all employees. Label the columns Maximum, Minimum, Sum, and Average, respectively. Round your results to the nearest whole number.
SELECT MAX(salary) AS Maximum,
MIN(salary) AS Minimum,
SUM(salary) AS Sum,
ROUND(AVG(salary)) AS Average
FROM hr.employees;

-- Query
SELECT job_id,
MIN(salary) AS Minimum,
MAX(salary) AS Maximum,
SUM(salary) AS Sum,
ROUND(AVG(salary)) AS Average
FROM hr.employees
GROUP BY job_id;

-- Write a query to display the number of people with the same job.
SELECT job_id,
COUNT(*) AS "Number of People"
FROM hr.employees
GROUP BY job_id;

-- Determine the number of managers without listing them. Label the column Number of Managers.
SELECT COUNT(DISTINCT manager_id) AS "Number of Managers"
FROM hr.employees;

-- Find the difference between the highest and lowest salaries. Label the column DIFFERENCE.
select max(salary)-min(salary) as "difference" from hr.employees ;

-- Create a report to display the manager number and the salary of the lowest-paid employee for that manager. Exclude anyone whose manager is not known. Exclude any groups where the minimum salary is $2000 or less. Sort the output in descending order of salary.
SELECT manager_id, MIN(salary) AS "MIN_SALARY"
FROM hr.employees
WHERE manager_id IS NOT NULL
GROUP BY manager_id
HAVING MIN(salary) > 2000
ORDER BY "MIN_SALARY" DESC;

-- JOINS
SELECT employee_id, first_name, salary, department_name, location_id
FROM hr.employees
NATURAL JOIN (

-- ) d;
SELECT

-- e.job_id,
SELECT
