-- create employees table	
CREATE TABLE employees1(
employee_id SERIAL PRIMARY KEY,
first_name VARCHAR(50),
last_name varchar(50),
department_id int
);

-- insert data into employee
INSERT INTO employees1 (first_name, last_name, department_id)
VALUES
('Muneeb','Badar',101),
('Kaleem','Adeeb',102),
('Naji','Ullah',103),
('ABC','XYZ',null),
('Safi','Ullah',101);

SELECT * FROM employees1;
DROP TABLE employees1;

--create department table
CREATE TABLE departments(
department_id INT PRIMARY KEY,
department_name varchar(50)
);

INSERT INTO departments (department_id, department_name)
VALUES
(101,'Sales'),
(102,'Marketing'),
(103,'IT'),
(104,'HR');

SELECT * FROM departments;

SELECT e.employee_id, e.first_name, e.last_name,
		d.department_id, d.department_name
FROM employees1 e
RIGHT JOIN
departments d
ON e.department_id=d.department_id;