-- Temporary Tables

CREATE TABLE #temp_table
(first_name VARCHAR(50),
 last_name VARCHAR(50),
 favorite_movie VARCHAR(100)
 );

 INSERT INTO #temp_table VALUES('Clarence Jake', 'Bonilla', 'The Wolf of Wall Street')

 SELECT *
 FROM #temp_table


 SELECT * 
 FROM employee_salary 

 --CREATE TABLE #salaryOver50K
 --SELECT * 
 --FROM dbo.employee_salary 
 --WHERE salary >= 50000 -- IN SQL SERVER  YOU CANT DO THIS INSTEAD DO THE QUERYT BELOW

SELECT *
INTO #salaryOver50K
FROM dbo.employee_salary
WHERE salary >= 50000;

SELECT * 
FROM #salaryOver50K; --  Temp Table will last within a session



 