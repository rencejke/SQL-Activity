--SUBQUERIES

SELECT * 
FROM dbo.employee_demographics
WHERE employee_id IN (
		SELECT employee_id
		FROM employee_salary 
		where dept_id = 1
);


SELECT first_name, salary, 
(SELECT AVG(salary) FROM dbo.employee_salary) [Average Salary]
FROM dbo.employee_salary
GROUP BY first_name, salary;


SELECT AVG(MaxAge) 
FROM 
(SELECT gender, 
	AVG(age) [AvgAge], 
	MAX(age)[MaxAge], 
	MIN(age)[MinAge], 
	COUNT(age) [CountAge]
FROM dbo.employee_demographics
GROUP BY gender) AS AggTable



