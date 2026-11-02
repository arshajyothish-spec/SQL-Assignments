-- DDL Commands 
-- Table Creation (CREATE): Write the SQL statements to create a database named “employee” and the following tables based on the provided schema:
-- ⦿ Departments
-- ⦿ Location
-- ⦿ Employees

CREATE DATABASE employee;
USE employee;
SHOW DATABASES;


CREATE TABLE departments(department_id INT,
department_name VARCHAR(100));
DESCRIBE departments;


CREATE TABLE location(location_id INT,
location VARCHAR(30));
DESCRIBE location;


CREATE TABLE employees(employee_id INT,
employee_name VARCHAR(50),
gender ENUM('male','female'),
age INT,
hire_date DATE,
designation VARCHAR(100),
department_id INT,
location_id INT,
salary DECIMAL(10,2));
DESCRIBE employees;


-- Table Alteration (ALTER): Consider the following scenarios and write the SQL statements to alter the structure of the tables accordingly:
-- ⦿ Add a new column named "email" to the Employees table to store employee email addresses.
-- ⦿ Modify the data type of the "designation" column in the Employees table to support a wider range of values.
-- ⦿ Drop the “age” column from the Employees table.
-- ⦿ Rename the “hire_date” column to “date_of_joining”.

ALTER TABLE employees ADD COLUMN email VARCHAR(100);
DESCRIBE employees;

ALTER TABLE employees MODIFY COLUMN designation VARCHAR(255);
DESCRIBE employees;

ALTER TABLE employees DROP COLUMN age;
DESCRIBE employees;

ALTER TABLE employees RENAME COLUMN hire_date TO date_of_joining;
DESCRIBE employees;


-- Table Renaming (RENAME): Rewrite the SQL statements to rename the following tables:
-- ⦿ Rename the "Departments" table to "Departments_Info".
-- ⦿ Rename the "Location" table to "Locations".

RENAME TABLE departments TO department_info;
DESCRIBE department_info;

RENAME TABLE location TO locations;
DESCRIBE locations;
SHOW TABLES;


-- Table Truncation (TRUNCATE): Write an SQL statement to truncate the Employees table.

TRUNCATE TABLE employees;


-- Database & Table Dropping (DROP): Write the SQL statements to drop the Employees table and then the “employee” database

DROP TABLE employees;
DROP DATABASE employee;


-- Constraints :
-- 1. Database Recreation:
-- ⦿ Drop the 'employee' database if it exists and recreate it using the provided schema, ensuring that all tables are created with the appropriate constraints as instructed

CREATE DATABASE employee;
USE employee;


-- Departments Table:
-- ⦿ Ensure that the "department_id" uniquely identifies each department.
-- ⦿ Set up constraints on the "department_name" to avoid duplicate and null entries.

CREATE TABLE departments(department_id INT PRIMARY KEY,
department_name VARCHAR(100)NOT NULL UNIQUE);
DESCRIBE departments;


-- Location Table:
-- ⦿ Establish a mechanism to automatically generate unique identifiers for each location, ensuring that they are incremented sequentially.
-- ⦿ Implement constraints to prevent the insertion of null and duplicate locations.

CREATE TABLE location(location_id INT PRIMARY KEY AUTO_INCREMENT,
location VARCHAR(30) NOT NULL UNIQUE);
DESCRIBE location;


-- Employees Table:
-- ⦿ Guarantee that each employee has a distinct identifier.
-- ⦿ Create a restriction to ensure that the employee's name is always provided.
-- ⦿ Limit the acceptable values for the "gender" field to only 'M' or 'F'.
-- ⦿ Enforce a condition to ensure that the employee's age is 18 or above.
-- ⦿ Automatically assign the current date to the "hire_date" field if not specified.
-- ⦿ Establish links between the "department_id" and "location_id" fields in the "employees" table and their respective tables.


CREATE TABLE employees(employee_id INT PRIMARY KEY,
employee_name VARCHAR(50) NOT NULL,
gender ENUM('M','F'),
age INT CHECK(age>=18),
hire_date DATE DEFAULT(current_date),
designation VARCHAR(100),
department_id INT,
location_id INT,
FOREIGN KEY (department_id) REFERENCES departments(department_id),
FOREIGN KEY (location_id) REFERENCES location(location_id),
salary DECIMAL(10,2));
DESCRIBE employees;
