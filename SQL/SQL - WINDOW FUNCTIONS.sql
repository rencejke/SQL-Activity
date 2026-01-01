--Window Functions


SELECT empdmgrps.first_name, empdmgrps.last_name, gender, AVG(salary) [Average Salary]
FROM employee_demographics empdmgrps
JOIN employee_salary empsl
	ON empsl.employee_id = empdmgrps.employee_id
GROUP BY gender

--OVER () [Everything] || PARTITITON BY
SELECT empdmgrps.first_name, empdmgrps.last_name,  AVG(salary) OVER(PARTITION BY gender) -- salary per individiual row
FROM employee_demographics empdmgrps
JOIN employee_salary empsl
	ON empsl.employee_id = empdmgrps.employee_id

SELECT empdmgrps.first_name, empdmgrps.last_name, salary, SUM(salary)OVER(PARTITION BY gender ORDER BY empdmgrps.employee_id) [Rolling Total]
FROM employee_demographics empdmgrps
JOIN employee_salary empsl
	ON empsl.employee_id = empdmgrps.employee_id

SELECT empdmgrps.first_name, empdmgrps.last_name, gender, salary, 
SUM(salary)OVER(PARTITION BY gender ORDER BY empdmgrps.employee_id) [Rolling Total] 
-- ROLLING TOTAL IS START ON A SPECIFIC VALUE THEN ADD THE SUBSEQUENT ROWS BASED ON THE PARTITION
FROM employee_demographics empdmgrps
JOIN employee_salary empsl
	ON empsl.employee_id = empdmgrps.employee_id


--ROW NUMBER

SELECT empdmgrps.first_name, empdmgrps.last_name, gender, salary, 
ROW_NUMBER() OVER(PARTITION BY gender ORDER BY salary desc) [row number] -- CREATES ROW NUMBER PER GENDER AND WHICH SALARY IS THE HIGHEST
FROM employee_demographics empdmgrps
JOIN employee_salary empsl
	ON empsl.employee_id = empdmgrps.employee_id

--RANK()
--Rank is also based on the ORDER BY.
--If there are duplicate values, the same position or rank will be assigned to them.
--When this happens, the next rank will skip numbers.
--Example: If two rows have a salary of 5000 and their rank is 5, both will 
--be assigned rank 5. The following row will then be assigned rank 7 (skipping 6 because of the duplication).

SELECT empdmgrps.first_name, empdmgrps.last_name, gender, salary, 
ROW_NUMBER() OVER(PARTITION BY gender ORDER BY salary desc) [row number], 
RANK() OVER(PARTITION BY gender ORDER BY salary desc) [rank]
FROM employee_demographics empdmgrps
JOIN employee_salary empsl
	ON empsl.employee_id = empdmgrps.employee_id

--DENSE_RANK()
--THIS FUNCTION NEVER SKIP NEXT NUMBER UNLIKE RANK
SELECT empdmgrps.first_name, empdmgrps.last_name, gender, salary, 
ROW_NUMBER() OVER(PARTITION BY gender ORDER BY salary desc) [row number], 
RANK() OVER(PARTITION BY gender ORDER BY salary desc) [rank],
DENSE_RANK() OVER(PARTITION BY gender ORDER BY salary desc) [dense_rank]
FROM employee_demographics empdmgrps
JOIN employee_salary empsl
	ON empsl.employee_id = empdmgrps.employee_id


