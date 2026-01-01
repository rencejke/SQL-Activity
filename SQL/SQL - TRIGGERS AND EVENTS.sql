--TRIGGERS AND EVENTS

-- TRIGGERS
GO
CREATE TRIGGER employee_insert
ON employee_salary
AFTER INSERT
AS
BEGIN
    INSERT INTO employee_demographics (employee_id, first_name, last_name)
    SELECT employee_id, first_name, last_name
    FROM inserted;
END;
GO -- AFTER AN EMPLOYEE ID, FIRST NAME, AND LAST NAME IS INSERTED ON EMPLOYEE SALARY
   -- IT WILL ALSO INSERT ON EMPLOYEE DEMOGRAPHICS


--EVENTS
SELECT * 
FROM employee_demographics

GO
CREATE EVENTS delete_retirees
ON SCHEDULE EVERY 30 SECOND
DO
BEGIN
	DELETE
	FROM employee_demographics
	WHERE age >= 60
END
GO