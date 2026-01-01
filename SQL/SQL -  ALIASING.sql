
--ALIASING

SELECT gender [Gender], AVG(age) [Average age]
FROM dbo.employee_demographics
GROUP BY gender
HAVING AVG(age) > 40;




