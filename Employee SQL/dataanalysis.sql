-- List the employee number, last name, first name, sex, and salary of each employee.
SELECT e.emp_no, e.last_name, e.first_name, e.sex, s.salary
FROM employees AS e
INNER JOIN salaries AS s
ON e.emp_no = s.emp_no;



-- List the first name, last name, and hire date for the employees who were hired in 1986.
SELECT first_name, last_name, hire_date
FROM employees
WHERE extract (year from hire_date) = '1986';
-- OR 
--WHERE hire_date BETWEEN '1986-01-01' AND '1986-12-31';



-- List the manager of each department along with their department number, department name, employee number, last name, and first name.
SELECT  f.dept_no,f.dept_name, e.emp_no,e.first_name,e.last_name
FROM employees AS e
INNER JOIN dept_managers AS d
ON e.emp_no = d.emp_no
INNER JOIN departments AS f
ON d.dept_no = f.dept_no;
-- List the department number for each employee along with that employee’s employee number, last name, first name, and department name.

SELECT f.dept_no, e.emp_no,e.last_name, e.first_name, f.dept_name 
FROM employees AS e
INNER JOIN dept_emp AS d
ON e.emp_no = d.emp_no
INNER JOIN departments AS f
ON d.dept_no = f.dept_no;
-- List first name, last name, and sex of each employee whose first name is Hercules and whose last name begins with the letter B.
SELECT first_name, last_name, sex 
FROM employees 
WHERE first_name = 'Hercules' and last_name LIKE 'B%';

-- List each employee in the Sales department, including their employee number, last name, and first name.

SELECT e.emp_no,e.last_name, e.first_name, f.dept_name 
FROM employees AS e
INNER JOIN dept_emp AS d
ON e.emp_no = d.emp_no
INNER JOIN departments AS f
ON d.dept_no = f.dept_no
WHERE dept_name = 'Sales' ;


-- SELECT e.emp_no,e.last_name, e.first_name
-- FROM employees AS e
-- WHERE e.emp_no IN (
-- SELECT d.emp_no
-- FROM dept_emp AS d
-- WHERE d.dept_no IN (
-- SELECT dept_no
-- FROM departments
-- WHERE dept_name = 'Sales'))


-- List each employee in the Sales and Development departments, including their employee number, last name, first name, and department name.
SELECT e.emp_no, e.last_name, e.first_name, f.dept_name
FROM employees AS e
INNER JOIN dept_emp AS d
ON e.emp_no = d.emp_no
INNER JOIN departments AS f
ON d.dept_no = f.dept_no
WHERE dept_name IN ('Sales','Development');

-- List the frequency counts, in descending order, of all the employee last names (that is, how many employees share each last name).

SELECT last_name, COUNT(last_name) as freq_count
FROM employees
GROUP BY 1
ORDER BY 2 DESC;
