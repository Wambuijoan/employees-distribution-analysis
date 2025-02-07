-- Data cleaning with SQL
-- Description: This script performs data cleaning operations on a Human Resource table.

-- Adatabase that will hold the Table is created and the table is imported.
CREATE DATABASE projects;
USE projects;

-- This query renames id column to a readable and easily writable name, emp_id.
ALTER TABLE hr 
CHANGE COLUMN ï»¿id emp_id VARCHAR(20) NULL;
DESCRIBE hr;

-- birthdate column has text instead of date datatype.
SELECT birthdate FROM hr;

-- This is a SQL DB security feature. = 0 allows for updating and '= 1' prevents updates from being made.
SET sql_safe_updates = 0;

-- This step converts birthdate column from string to date datatype.
-- the date type is then converted to SQL standard date format 'YYYY-MM-DD'.
UPDATE hr
SET birthdate = CASE 
	WHEN birthdate LIKE '%/%' THEN date_format(str_to_date(birthdate, '%m/%d/%Y'), '%Y-%m-%d')
    WHEN birthdate LIKE '%-%' THEN date_format(str_to_date(birthdate, '%m-%d-%Y'), '%Y-%m-%d')
    ELSE NULL
END;

-- The birthdate column is still in a text datatype.
SELECT birthdate FROM hr;

-- This step changes birthdate datatype to date.
ALTER TABLE hr
MODIFY COLUMN birthdate DATE;

-- This step also converts hire_date to date datatype.
-- It then permanently save the changes to the 'hr' table.
UPDATE hr
SET hire_date = CASE 
	WHEN hire_date LIKE '%/%' THEN date_format(str_to_date(hire_date, '%m/%d/%Y'), '%Y-%m-%d')
    WHEN hire_date LIKE '%-%' THEN date_format(str_to_date(hire_date, '%m-%d-%Y'), '%Y-%m-%d')
    ELSE NULL
END;

ALTER TABLE hr
MODIFY COLUMN hire_date DATE;

SELECT hire_date FROM hr;

-- This step updates termdate column from string to date datatype and replaces empty cells.
-- it them parmanently save the changes to the 'hr' table.
UPDATE hr
SET termdate = IF(termdate IS NOT NULL AND termdate != '', date(str_to_date(termdate, '%Y-%m-%d %H:%i:%s UTC')), '0000-00-00')
WHERE true;

SELECT termdate from hr;

SET sql_mode = 'ALLOW_INVALID_DATES';

ALTER TABLE hr
MODIFY COLUMN termdate DATE;

SELECT * FROM hr;

-- This query adds a new column, 'age', and use TIMESTAMPDIFF Function to divide the given date to the current date.
ALTER TABLE hr ADD COLUMN age INT;

UPDATE hr
SET age = TIMESTAMPDIFF(YEAR, birthdate, CURDATE());

-- This query checks the outliers in the data
SELECT 
	MIN(age) AS youngest, 
    MAX(age) AS oldest
FROM hr;

SELECT COUNT(*)
FROM hr
WHERE age < 18;

