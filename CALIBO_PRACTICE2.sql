-- Create a table employees with:
-- 1. employee_id as a PRIMARY KEY
-- 2. employee_id should AUTO_INCREMENT by 1
-- 3. employee_name should NOT be NULL
-- 4. employee_salary should be greater than 10,000
-- 5. _employee_department_id should be a FOREIGN KEY
USE calibo_practice;

ALTER TABLE department
ADD PRIMARY KEY (department_id);

CREATE TABLE employees (
    employee_id INT AUTO_INCREMENT PRIMARY KEY,
    employee_name VARCHAR(100) NOT NULL,
    employee_salary DECIMAL(10,2) CHECK (employee_salary > 10000),
    employee_department_id INT,
    FOREIGN KEY (employee_department_id)
        REFERENCES department(department_id)
);
SELECT * FROM employees;
DESC employees;

ALTER TABLE employees
MODIFY employee_name VARCHAR(100) NOT NULL;

SELECT CONSTRAINT_NAME,
 
       CONSTRAINT_TYPE
 
FROM INFORMATION_SCHEMA.TABLE_CONSTRAINTS
 
WHERE TABLE_NAME = 'Employees';


SELECT * FROM department;
INSERT INTO department (department_id, department_name)
VALUES
(1, 'HR'),
(2, 'IT'),
(3, 'Finance');
ALTER TABLE employees AUTO_INCREMENT = 1;
INSERT INTO employees

(employee_name, employee_salary, employee_department_id)
VALUES
('Madhu', 30000, 1),
('Nani', 45000, 2),
('Venkat', 55000, 3),
('Ram', 40000, 1);
SELECT * FROM employees;
ALTER TABLE employees
ADD CONSTRAINT chk_salary
CHECK (employee_salary > 10000);

-- 1. Create a table with PRIMARY KEY on a single column
CREATE TABLE employees (
    employee_id INT PRIMARY KEY,
    employee_name VARCHAR(100)
);
-- 2. Add PRIMARY KEY to an existing table
ALTER TABLE employees
ADD PRIMARY KEY (employee_id);

-- 3.  Create a composite PRIMARY KEY on multiple columns
CREATE TABLE employee_department (
    employee_id INT,
    department_id INT,
    PRIMARY KEY (employee_id, department_id)
);
-- 4. Add FOREIGN KEY to an existing table
ALTER TABLE employees
ADD CONSTRAINT fk_employee_department
FOREIGN KEY (employee_department_id)
REFERENCES department(department_id);

-- 5. Drop PRIMARY KEY from a table
ALTER TABLE employees
DROP PRIMARY KEY;

-- 6. Create a UNIQUE constraint

ALTER TABLE employees
ADD CONSTRAINT uq_employee_name UNIQUE (employee_name);

-- 7. Drop a UNIQUE constraint
ALTER TABLE employees
DROP INDEX uq_employee_name;

-- 8. Enforce NOT NULL on a column
ALTER TABLE employees
MODIFY employee_name VARCHAR(100) NOT NULL;

-- 9. Modify existing column to NOT NULL
ALTER TABLE employees
MODIFY employee_name VARCHAR(100) NOT NULL;

-- 10. Define DEFAULT constraint
ALTER TABLE employees
ALTER COLUMN employee_department_id SET DEFAULT 1;

-- 11. Add DEFAULT to existing column
ALTER TABLE employees
ALTER COLUMN employee_department_id SET DEFAULT 1;

-- 12. Add CHECK constraint for a specific range
ALTER TABLE employees
ADD CONSTRAINT chk_employee_salary
CHECK (employee_salary BETWEEN 10000 AND 100000);

-- 13. Drop check salary
ALTER TABLE employees
DROP CHECK chk_salary;

-- 14. Disable all constraints temporarily
SET FOREIGN_KEY_CHECKS = 0;

-- 15. Re-enable constraints
SET FOREIGN_KEY_CHECKS = 1;


-- 16. Rename an existing constraint
ALTER TABLE employees
DROP CHECK chk_salary,
ADD CONSTRAINT chk_employee_salary CHECK (employee_salary > 10000);

-- 17. Ensure column value matches a predefined list
ALTER TABLE employees
ADD CONSTRAINT chk_employee_department
CHECK (employee_department_id IN (1, 2, 3));

-- 18. Ensure column value is greater than a threshold
ALTER TABLE employees
ADD CONSTRAINT chk_employee_salary
CHECK (employee_salary > 20000);

-- 19. Ensure column value is based on other columns
ALTER TABLE employees
ADD CONSTRAINT chk_salary_calculation
CHECK (employee_salary = basic_salary + bonus);
