--CASE STATEMENT

SELECT 
CONCAT(first_name, ' ', last_name), 
CASE
	WHEN age <= 30 THEN 'Young'
	WHEN age BETWEEN 31 AND 50 THEN 'OLD'
	WHEN age >= 50 THEN 'On Death' + '''' + 's Door'
END
FROM dbo.employee_demographics


-- Pay Increase and Bonus
-- < 50000 = 5%
-- > 50000 = 7%
-- Finance = 10% bonus

SELECT 
CONCAT(first_name, ' ', last_name) [Full Name] ,salary,
CASE
	WHEN salary < 50000 THEN salary + (salary * 0.05) 
	WHEN salary > 50000 THEN salary + (salary * 0.07) 
END [New Salary],
CASE
	WHEN dept_id = 6 THEN salary * 0.10
END [Bonus]
FROM dbo.employee_salary
ORDER BY [Full Name]

