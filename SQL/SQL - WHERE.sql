SELECT * 
FROM dbo.employee_salary
WHERE first_name = 'Leslie';

SELECT * 
FROM dbo.employee_salary
WHERE salary <= 50000;


SELECT * 
FROM dbo.employee_demographics
WHERE Gender = 'Female'

SELECT * 
FROM dbo.employee_demographics
WHERE Gender != 'Female'

SELECT * 
FROM dbo.employee_demographics
WHERE birth_date > '1985-01-01'

SELECT * 
FROM dbo.employee_demographics
WHERE birth_date > '1985-01-01' 
AND gender = 'male'

SELECT * 
FROM dbo.employee_demographics
WHERE birth_date > '1985-01-01' 
OR NOT gender = 'male'

SELECT * 
FROM dbo.employee_demographics
WHERE (first_name = 'Leslie' AND age = 44) OR age > 55

--LIKE
--% and _
SELECT * 
FROM dbo.employee_demographics
WHERE first_name LIKE 'jer%';

SELECT * 
FROM dbo.employee_demographics
WHERE first_name LIKE 'a%';


SELECT * 
FROM dbo.employee_demographics
WHERE first_name LIKE 'a___%'; -- starts with a and 3 characters after

SELECT * 
FROM dbo.employee_demographics
WHERE birth_date LIKE '1989%'; 