SELECT * 
FROM dbo.employee_demographics

SELECT * 
FROM dbo.employee_salary

--JOIN || INNER JOIN
SELECT *
FROM dbo.employee_demographics empdmgrps
INNER JOIN dbo.employee_salary empslry 
	ON empslry.employee_id =  empdmgrps.employee_id

-- LEFT JOIN || RIGHT JOIN
-- Same result as above because the employee_id in employee_demographics
-- has the same match with employee_salary
SELECT *
FROM dbo.employee_demographics empdmgrps
LEFT JOIN dbo.employee_salary empslry 
	ON empslry.employee_id =  empdmgrps.employee_id;

-- Different result because in the right table there is an employee_id = 2 
-- that isn’t available in employee_demographics, so some columns will show NULL
SELECT *
FROM dbo.employee_demographics empdmgrps
RIGHT JOIN dbo.employee_salary empslry 
	ON empslry.employee_id =  empdmgrps.employee_id;


--SELF JOIN
SELECT emp1.employee_id [Employee Santa],
emp1.first_name [First Name Santa],
emp1.last_name [Last Name Santa],
emp2.employee_id [Employee Name],
emp2.first_name [First Name],
emp2.last_name [Last Name]
FROM dbo.employee_salary emp1
JOIN employee_salary emp2 
	ON emp1.employee_id + 1 = emp2.employee_id;


--JOINING MULTIPLE TABLE
SELECT *
FROM dbo.employee_demographics empdmgrps
INNER JOIN dbo.employee_salary empslry 
	ON empslry.employee_id =  empdmgrps.employee_id
INNER JOIN parks_departments prkdpt ON prkdpt.department_id = empslry.dept_id

