-- SQL Homework - Employee Database: A Mystery in Two Parts

-- Drop table for departments if it exists
DROP TABLE departments;

-- CREATE Table for departments
CREATE TABLE departments(
	dept_no VARCHAR(30) NOT NULL,
	dept_name VARCHAR(30) NOT NULL,
	PRIMARY KEY (dept_no)
);

-- Import departments csv file
SELECT * FROM departments;

-- Drop table for dep_emp if it exists
DROP TABLE dep_emp;

-- CREATE Table for dept_emp
CREATE TABLE dep_emp(
	emp_no INT NOT NULL,
	dept_no VARCHAR(30) NOT NULL,
	FOREIGN KEY (emp_no) REFERENCES employees (emp_no),
	FOREIGN KEY (dept_no) REFERENCES departments (dept_no),
	PRIMARY KEY (emp_no, dept_no)
);

-- Import dept_emp csv file

-- Drop table for dept_manager if it exists
DROP TABLE dept_manager;

-- CREATE Table for dept_manager
CREATE TABLE dept_manager(
	dept_no VARCHAR(30) NOT NULL,
   	emp_no INT NOT NULL,
   	FOREIGN KEY (emp_no)  REFERENCES employees (emp_no),
   	FOREIGN KEY (dept_no) REFERENCES departments (dept_no),
   	PRIMARY KEY (emp_no,dept_no)
);

-- Import dept_manager csv file

-- Drop table for employees if it exists
DROP TABLE employees;

-- CREATE Table for employees
CREATE TABLE employees(
	emp_no INT NOT NULL,
	emp_title_id VARCHAR(30),
	birth_date DATE NOT NULL,
	first_name VARCHAR(255) NOT NULL,
	last_name VARCHAR(255) NOT NULL,
	sex VARCHAR(1) NOT NULL,
	hire_date DATE NOT NULL,
	PRIMARY KEY (emp_no)
);

-- Import employees csv file
SELECT * FROM employees

-- Drop table for salaries if it exists
DROP TABLE salaries;

-- CREATE Table for salaries
CREATE TABLE salaries(
	emp_no INT NOT NULL,
	salary INT NOT NULL,
	FOREIGN KEY (emp_no) REFERENCES employees (emp_no),
	PRIMARY KEY (emp_no)
);

-- Import salaries csv file

-- Drop table for titles if it exists
DROP TABLE titles;

-- CREATE Table for titles
CREATE TABLE titles(
	title_id VARCHAR(30) NOT NULL,
	title VARCHAR(30) NOT NULL
);

-- Import titles csv file

-----QUERIES----
SELECT * FROM departments;
SELECT * FROM dep_emp;
SELECT * FROM dept_manager;
SELECT * FROM employees;
SELECT * FROM salaries;
SELECT * FROM titles;


-- List the following details of each employee: employee number, last name, first name, sex, and salary.

SELECT 
employees.emp_no,
employees.last_name,
employees.first_name,
employees.sex,
salaries.salary
FROM employees
JOIN salaries
ON employees.emp_no = salaries.emp_no;

-- List first name, last name, and hire date for employees who were hired in 1986. 

SELECT
first_name,
first_name,
hire_date
FROM employees
WHERE extract(year from hire_date) = '1986'; 


-- List the manager of each department with the following information: department number, department name, the manager's employee number, last name, first name.
SELECT
dept_manager.dept_no,
dept_name,
dept_manager.emp_no,
first_name,
last_name
FROM dept_manager
LEFT JOIN departments on dept_manager.dept_no = departments.dept_no
LEFT JOIN employees on dept_manager.emp_no = employees.emp_no;


-- List the department of each employee with the following information: employee number, last name, first name, and department name

SELECT
employees.emp_no, 
first_name, 
last_name,
dept_name
FROM employees
LEFT JOIN dep_emp
ON employees.emp_no = dep_emp.emp_no
LEFT JOIN departments
ON dep_emp.dept_no = departments.dept_no;

-- List first name, last name, and sex for employees whose first name is "Hercules" and last names begin with "B."

SELECT
employees.first_name, 
last_name,
sex
FROM employees
WHERE(first_name LIKE 'Hercules' AND last_name LIKE '%B%');

-- List all employees in the Sales department, including their employee number, last name, first name, and department name.

SELECT
employees.emp_no, 
first_name, 
last_name,
dept_name
FROM employees
LEFT JOIN dep_emp
ON employees.emp_no = dep_emp.emp_no
LEFT JOIN departments
ON dep_emp.dept_no = departments.dept_no 
WHERE departments.dept_name lIKE 'Sales';

-- List all employees in the Sales and Development departments, including their employee number, last name, first name, and department name.

SELECT
employees.emp_no, 
first_name, 
last_name,
dept_name
FROM employees
LEFT JOIN dep_emp
ON employees.emp_no = dep_emp.emp_no
LEFT JOIN departments
ON dep_emp.dept_no = departments.dept_no 
WHERE departments.dept_name lIKE 'Sales'
OR departments.dept_name LIKE  'Development';

--In descending order, list the frequency count of employee last names, i.e., how many employees share each last name.

SELECT
last_name,
COUNT(last_name) AS "name_frequency"
FROM employees
GROUP BY
last_name
ORDER BY name_frequency DESC;