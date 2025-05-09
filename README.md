# Employee Database Analysis Using SQL

## 📘 Project Overview

This project showcases my work in designing, building, and querying a relational database using PostgreSQL. The dataset simulates employee records for a fictional company, and the goal was to import raw CSV data into a normalized schema and perform analytical queries using SQL.

This project was completed as part of my learning journey in data engineering and analytics, with guidance from Xpert Learning Assistant.

---

## 🗂️ Repository Structure

sql-challenge/
├── data/ # Raw CSV files containing employee data
├── ERD.png # Entity-Relationship Diagram of the database schema
├── schema.sql # SQL script to create tables
├── queries.sql # SQL script containing analysis queries
└── README.md # Project documentation


---

## 🧱 Database Design

The database is designed using a normalized schema to reduce redundancy and enforce data integrity. The key tables include:

- `employees`: Employee ID, name, birth date, gender, hire date
- `departments`: Department names and IDs
- `dept_emp`: Employee-department relationships
- `dept_manager`: Department managers
- `salaries`: Historical salary data
- `titles`: Job titles over time

![Entity-Relationship Diagram](ERD.png)

---

## 🔧 Data Engineering Process

1. **Schema Creation**: Used `schema.sql` to create all necessary tables.
2. **Data Import**: Loaded CSV files into PostgreSQL using `COPY` commands.
3. **Data Integrity Checks**: Verified relationships using JOINs and foreign key constraints.

---

## 📊 Data Analysis

A series of SQL queries were executed to answer business-relevant questions. Highlights include:

- **List all employees and their current salaries**  
```sql
SELECT e.emp_no, e.first_name, e.last_name, s.salary
FROM employees e
JOIN salaries s ON e.emp_no = s.emp_no
WHERE s.to_date = '9999-01-01';
```

- **Find employees hired in 1986
```sql
SELECT emp_no, first_name, last_name, hire_date
FROM employees
WHERE EXTRACT(YEAR FROM hire_date) = 1986;
```

- **Average salary by department
```sql
SELECT d.dept_name, AVG(s.salary) AS average_salary
FROM departments d
JOIN dept_emp de ON d.dept_no = de.dept_no
JOIN salaries s ON de.emp_no = s.emp_no
GROUP BY d.dept_name;
```

## 🧠 Lessons Learned
Encountered syntax issues due to column misordering during table creation; resolved by reviewing schema structure and ERD.

Gained deeper understanding of foreign key constraints and JOIN operations.

Improved ability to troubleshoot import and data consistency problems in PostgreSQL.

## 🧰 Tools & Resources
PostgreSQL

pgAdmin

SQL

Entity-Relationship Diagram (drawn using draw.io)

Xpert Learning Assistant

## 🚀 Future Improvements
Implement stored procedures or views for common queries

Add indexing for performance optimization

Explore integration with Python or BI tools for visualization

## 📝 Acknowledgments
This project was created as part of my ongoing development in data analysis and engineering. Thanks to open-source resources and communities that supported this journey.




