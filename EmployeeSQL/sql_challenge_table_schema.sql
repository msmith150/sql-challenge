-- Create departments table and relevant columns
CREATE TABLE departments (
    dept_no VARCHAR(10) PRIMARY KEY,
    dept_name VARCHAR(40) UNIQUE NOT NULL
);

-- Create titles table and relevant columns
CREATE TABLE titles (
    title_id VARCHAR(10) PRIMARY KEY,
    title VARCHAR(50) NOT NULL
);

-- Create employees table and relevant columns
CREATE TABLE employees (
    emp_no INTEGER PRIMARY KEY,
    emp_title_id VARCHAR(10) NOT NULL,
    birth_date DATE,
    first_name VARCHAR(30) NOT NULL,
    last_name VARCHAR(40) NOT NULL,
    sex VARCHAR(1),
    hire_date DATE NOT NULL,
    FOREIGN KEY (emp_title_id) REFERENCES titles(title_id) ON DELETE SET NULL
);

-- Create salaries table and relevant columns
CREATE TABLE salaries (
    emp_no INTEGER PRIMARY KEY,
    salary DECIMAL(10, 2) NOT NULL,
    FOREIGN KEY (emp_no) REFERENCES employees(emp_no) ON DELETE CASCADE
);

-- Create dept_manager table and relevant columns
CREATE TABLE dept_manager (
    dept_no VARCHAR(10),
    emp_no INTEGER,
    PRIMARY KEY (dept_no, emp_no),
    FOREIGN KEY (dept_no) REFERENCES departments(dept_no) ON DELETE CASCADE,
    FOREIGN KEY (emp_no) REFERENCES employees(emp_no) ON DELETE CASCADE
);

-- Create dept_emp table and relevant columns
CREATE TABLE dept_emp (
    emp_no INTEGER,
    dept_no VARCHAR(10),
    PRIMARY KEY (emp_no, dept_no),
    FOREIGN KEY (emp_no) REFERENCES employees(emp_no),
    FOREIGN KEY (dept_no) REFERENCES departments(dept_no)
);