
--CTEs
;WITH CTE_Example AS 
(

SELECT dem.gender, 
AVG(empsl.salary) [Average salary], 
MAX(empsl.salary) [Maximun salary], 
MIN(empsl.salary) [Minimum salary], 
COUNT(empsl.salary) [Count salary]
FROM dbo.employee_demographics dem
JOIN dbo.employee_salary empsl 
	ON empsl.employee_id = dem.employee_id
GROUP BY dem.gender
 )
 SELECT AVG([Average Salary])
 FROM CTE_Example


;WITH CTE_Example (Gender, [Average Salary], [Maximun Salary],
					[Minimum Salary],[Count Salary]) AS 
(
SELECT dem.gender, 
AVG(empsl.salary), 
MAX(empsl.salary), 
MIN(empsl.salary), 
COUNT(empsl.salary)
FROM dbo.employee_demographics dem
JOIN dbo.employee_salary empsl 
	ON empsl.employee_id = dem.employee_id
GROUP BY dem.gender
 )
 SELECT *
 FROM CTE_Example


 ;WITH CTE_Examplee AS
 (
  SELECT employee_id, gender, birth_date 
  FROM dbo.employee_demographics
  WHERE birth_date > '1985-01-01'
 ),
 CTE_Examplee2 AS
 (
  SELECT employee_id, salary
  FROM dbo.employee_salary
  WHERE salary > 50000
 )
 SELECT * 
 FROM CTE_Examplee
 JOIN CTE_Examplee2 
	ON CTE_Examplee2.employee_id = CTE_Examplee.employee_id





