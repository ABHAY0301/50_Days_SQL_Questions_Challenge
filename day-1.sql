-- 01/50 Days SQL Questions challenge


/*
-- Write the SQL query to find the second highest salary ?
*/


-- Create the employees table

CREATE TABLE employees(
	employess_id SERIAL PRIMARY KEY,
	name VARCHAR(100),
	department VARCHAR(100),
	salary DECIMAL(10,2)
);


-- Insert records into employees table
INSERT INTO employees (name, department, salary) VALUES 
('John Doe', 'Engineering', 63000),
('Jane Smith', 'Engineering', 55000),
('Michael Johnson', 'Engineering', 64000),
('Emily Davis', 'Marketing', 58000),
('Chris Brown', 'Marketing', 56000),
('Emma Wilson', 'Marketing', 59000),
('Alex Lee', 'Sales', 58000),
('Sarah Adams', 'Sales', 58000),
('Ryan Clark', 'Sales', 61000);

-- My Solution

WITH CTE AS (
	SELECT 
		name,
		salary,
		department,
		DENSE_RANK() OVER(ORDER BY salary DESC) AS rank
	FROM employees
)

SELECT 
	name,
	salary,
	department
FROM CTE
WHERE rank = 2


/*
-- Get the details of the employee with the second-highest salary from each department ?
*/

WITH CTE AS (
	SELECT 
		name,
		salary,
		department,
		DENSE_RANK() OVER(PARTITION BY department ORDER BY salary DESC) AS rank
	FROM employees
)

SELECT 
	name,
	salary,
	department
FROM CTE
WHERE rank = 2

