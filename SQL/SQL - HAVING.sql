SELECT gender, AVG(age)
FROM dbo.employee_demographics
GROUP BY gender
HAVING AVG(age) > 40


SELECT occupation, AVG(salary)
FROM dbo.employee_salary
WHERE occupation LIKE '%Manager%'
GROUP BY occupation
HAVING AVG(salary) > 75000 


