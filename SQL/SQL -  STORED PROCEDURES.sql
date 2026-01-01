-- STORED PROCEDURES

--CREATE PROCEDURE largeSalaries()
--SELECT * 
--FROM dbo.employee_salary
--WHERE salary >= 5000 -- INVALID IN SQL SERVER SYNTAX UNLESS YOU ARE DECLARING PARAMETER
					   -- INSTEAD DO THE QUERY BELOW

CREATE PROCEDURE largeSalaries
AS
BEGIN 
	SELECT * 
	FROM dbo.employee_salary
	WHERE salary >= 5000
END

-- CALL(Use to call the stored procedure)  equivalent to EXEC
EXEC largeSalaries

CREATE PROCEDURE largeSalaries2
AS
BEGIN 
	SELECT * 
	FROM dbo.employee_salary
	WHERE salary >= 50000
	SELECT * 
	FROM dbo.employee_salary
	WHERE salary >= 10000
END

EXEC largeSalaries2


CREATE PROCEDURE largeSalaries4
(
	--@EmployeeID INT NULL
	@EmployeeID INT
)
AS 
BEGIN
	SELECT *
	FROM dbo.employee_salary
	WHERE employee_id = @EmployeeID
END

EXEC largeSalaries4  1 
--OR
EXEC largeSalaries4  @EmployeeID = 1 

