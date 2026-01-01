SELECT first_name, last_name  
FROM dbo.employee_demographics
UNION ALL -- SELECT ALL THE DATA EVEN THOUGH THERE ARE DUPLICATES
SELECT first_name, last_name 
FROM dbo.employee_salary


SELECT first_name, last_name  
FROM dbo.employee_demographics
UNION -- SELECT DISTINCT DATA
SELECT first_name, last_name 
FROM dbo.employee_salary


SELECT first_name, last_name , 'Old Men' [Label]
FROM dbo.employee_demographics
WHERE age > 40 AND gender = 'Male'
UNION
SELECT first_name, last_name , 'Old Lady' [Label]
FROM dbo.employee_demographics
WHERE age > 40 AND gender = 'Female'
UNION
SELECT first_name, last_name , 'Highly Paid Employee' [Label]
FROM dbo.employee_salary
WHERE salary > 70000
ORDER BY first_name, last_name
