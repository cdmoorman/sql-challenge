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