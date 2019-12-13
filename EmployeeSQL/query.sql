-- Query File for DABC 9 - SQL Challenge
-- List the following details of each employee: employee number, last name, first name, gender, and salary.
SELECT e.emp_no, e.last_name, e.first_name, e.gender, s.salary
FROM employees as e
JOIN salaries as s
ON (e.emp_no = s.emp_no)
ORDER BY e.emp_no
;
-- List employees who were hired in 1986.
-- https://stackoverflow.com/questions/5052656/select-lines-whose-date-field-is-in-a-given-month-and-year
SELECT e.emp_no, e.last_name, e.first_name, e.hire_date
FROM employees as e
WHERE EXTRACT(year FROM e.hire_date) = 1986		
;

-- List the manager of each department with the following information: 
-- department number, department name, the manager's employee number, last name, first name, and start and end employment dates.
SELECT d.dept_no as "Dept No", 
	d.dept_name as "Dept Name", 
	dm.emp_no as "Dept Mgr Employee No", 
	e.last_name as "Dept Mgr Last Name", 
	e.first_name as "Dept Mgr First Name", 
	dm.from_date as "Dept Mgr Start", 
	dm.to_date as "Dept Mgr End"
FROM departments as d
JOIN dept_manager as dm
ON (d.dept_no = dm.dept_no)
JOIN employees as e
ON (dm.emp_no = e.emp_no)
ORDER BY d.dept_no
;

-- List the department of each employee with the following information: 
-- employee number, last name, first name, and department name.
SELECT e.emp_no, e.last_name, e.first_name,
	d.dept_name
FROM employees as e
JOIN dept_emp as de
ON (de.emp_no = e.emp_no)
JOIN departments as d
ON (d.dept_no = de.dept_no)
ORDER BY e.emp_no
;

-- List all employees whose first name is "Hercules" and last names begin with "B."
SELECT e.emp_no, e.last_name, e.first_name
FROM employees as e
WHERE ((e.first_name = 'Hercules') AND
	  (e.last_name LIKE 'B%'))
;

-- List all employees in the Sales department, including their employee number, last name, first name, and department name.
SELECT e.emp_no, e.last_name, e.first_name, d.dept_name
FROM employees as e
JOIN dept_emp as de
ON (de.emp_no = e.emp_no)
JOIN departments as d
ON (d.dept_no = de.dept_no)
WHERE (d.dept_name = 'Sales')
;

-- List all employees in the Sales and Development departments, including their employee number, last name, first name, and department name.
SELECT e.emp_no, e.last_name, e.first_name, d.dept_name
FROM employees as e
JOIN dept_emp as de
ON (de.emp_no = e.emp_no)
JOIN departments as d
ON (d.dept_no = de.dept_no)
WHERE ((d.dept_name = 'Sales') OR
	   (d.dept_name = 'Development'))
;

-- In descending order, list the frequency count of employee last names, i.e., how many employees share each last name.
SELECT COUNT(e.last_name) as "Last Name Count", e.last_name
FROM employees as e
GROUP BY e.last_name
ORDER BY "Last Name Count" DESC
;

-- April Foolsday!
SELECT e.first_name, e.last_name, e.emp_no, e.hire_date, e.birth_date, 
	d.dept_no, d.dept_name, s.salary, tt.title
FROM employees as e
LEFT JOIN dept_emp as de
ON (de.emp_no = e.emp_no)
JOIN departments as d
ON (d.dept_no = de.dept_no)
JOIN salaries as s
ON (s.emp_no = e.emp_no)
JOIN titles as tt
ON (tt.emp_no = e.emp_no)
WHERE e.last_name = 'Foolsday'
;
