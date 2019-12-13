-- Oringially Exported from QuickDBD: https://www.quickdatabasediagrams.com/
-- Link to schema: https://app.quickdatabasediagrams.com/#/d/SYN44d

-- UPDATED BY Jim Comas

DROP TABLE IF EXISTS dept_emp;
DROP TABLE IF EXISTS dept_manager;
DROP TABLE IF EXISTS salaries;
DROP TABLE IF EXISTS titles;
DROP TABLE IF EXISTS departments;
DROP TABLE IF EXISTS employees;

-- -- Catalog of departments
CREATE TABLE departments (
    dept_no VARCHAR(8)   NOT NULL,
    dept_name VARCHAR(50)   NOT NULL,
   	PRIMARY KEY (dept_no)
);

-- -- Catalog of employees
CREATE TABLE employees (
    emp_no INTEGER   NOT NULL,
    birth_date DATE  NOT NULL,
    first_name VARCHAR(30)   NOT NULL,
    last_name VARCHAR(30)   NOT NULL,
    gender VARCHAR(30)   NOT NULL,
    hire_date DATE  NOT NULL,
    PRIMARY KEY (emp_no)
);

-- -- Dept x Employee relationship
-- -- A dept can have many employees
-- -- An employee can have many depts in career
CREATE TABLE dept_emp (
    emp_no INTEGER   NOT NULL,
    dept_no VARCHAR(8)   NOT NULL,
    from_date DATE  NOT NULL,
    to_date DATE   NOT NULL,
   	PRIMARY KEY (emp_no, dept_no),
	FOREIGN KEY (emp_no) REFERENCES employees(emp_no),
	FOREIGN KEY (dept_no) REFERENCES departments(dept_no)
);

-- -- Dept x Manager relationship
-- -- A dept can have many mgrs thru lifecycle
-- -- An employee cam be mgr of multiple depts thru career
CREATE TABLE dept_manager (
    dept_no VARCHAR(8)   NOT NULL,
    emp_no INTEGER   NOT NULL,
    from_date DATE   NOT NULL,
    to_date DATE   NOT NULL,
    PRIMARY KEY (dept_no, emp_no),
	FOREIGN KEY (emp_no) REFERENCES employees(emp_no),
	FOREIGN KEY (dept_no) REFERENCES departments(dept_no)
);

-- -- Employee Salary history table
-- -- An employee can have multiple salaries across career (by date range)
CREATE TABLE salaries (
    emp_no INTEGER NOT NULL,
    salary DECIMAL   NOT NULL,
    from_date DATE NOT NULL,
    to_date DATE   NOT NULL,
	PRIMARY KEY (emp_no, from_date),
	FOREIGN KEY (emp_no) REFERENCES employees(emp_no)
);

-- -- Employee Title history table
-- -- An employee can have multiple titles across career (by date range)
CREATE TABLE titles (
    emp_no INTEGER   NOT NULL,
    title VARCHAR(30)   NOT NULL,
    from_date DATE   NOT NULL,
    to_date DATE   NOT NULL,
	PRIMARY KEY (emp_no, from_date),
	FOREIGN KEY (emp_no) REFERENCES employees(emp_no)
);

select * from departments;
select * from employees;
select * from dept_emp;
select * from dept_manager;
select * from salaries;
select * from titles;

SELECT * FROM salaries ORDER BY emp_no LIMIT 10;
SELECT * FROM salaries ORDER BY emp_no DESC LIMIT 10;

SELECT * FROM titles ORDER BY emp_no LIMIT 10;
SELECT * FROM titles ORDER BY emp_no DESC LIMIT 10;