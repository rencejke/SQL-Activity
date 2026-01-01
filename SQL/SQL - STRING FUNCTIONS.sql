--String Functions

--LEN lenght 
SELECT LEN('Sky')

SELECT first_name, LEN(first_name)
FROM employee_demographics
ORDER BY 2

--UPPER || LOWER
SELECT UPPER('sky')
SELECT LOWER('SKY')

SELECT first_name, UPPER(first_name)
FROM employee_demographics

--TRIM || LTRIM || RTRIM

SELECT TRIM('           sky      ')
SELECT '           sky      '
SELECT RTRIM('sky      ')
SELECT LTRIM('           sky      ')


--LEFT || RIGHT || SUBSTRING

SELECT first_name, 
LEFT(first_name, 4), --SELECT THE FIRST 4 character of the first name
RIGHT(first_name, 4), -- SELECT THE LAST 4 character of the first name
SUBSTRING(first_name, 3, 2), -- SELECT THE 3rd postion of the character and from it get the 2 character
birth_date,
SUBSTRING(CAST(birth_date AS VARCHAR), 6,2) [Birth Month]
FROM employee_demographics

--REPLACE
SELECT first_name, REPLACE(first_name, 'a', 'z') -- REPLACE the first poarameter with second parameter
FROM employee_demographics;

--LOCATE (CHARINDEX)
SELECT CHARINDEX('x', 'Alexander'); 
-- this shows the position of the first parameter from second parameter same as LOCATE

SELECT first_name, CHARINDEX('an', first_name)
FROM employee_demographics;

--CONCAT
SELECT first_name, last_name, CONCAT(first_name, ' ', last_name) [Full Name]
FROM employee_demographics;


