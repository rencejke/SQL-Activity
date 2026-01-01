SELECT *
FROM dbo.employee_demographics
ORDER BY age DESC
OFFSET 0 ROWS FETCH NEXT 3 ROWS ONLY; --this works like a LIMIT, you can skip a specific rows

--OR

SELECT TOP 3 *
FROM dbo.employee_demographics
ORDER BY age DESC  --this works like a LIMIT, quick and simple but not flexible like the query above












