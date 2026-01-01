
--Group By

SELECT gender, AVG(age), MAX(age), MIN (age), COUNT(age)
FROM dbo.employee_demographics
GROUP BY gender

SELECT occupation, salary
FROM dbo.employee_salary
GROUP BY occupation, salary;


--ORDER BY
SELECT *
FROM dbo.employee_demographics
ORDER BY first_name; --default ASC

SELECT *
FROM dbo.employee_demographics
ORDER BY gender, age DESC;

SELECT *
FROM dbo.employee_demographics
ORDER BY 5,4; -- dont recommend to use column position
