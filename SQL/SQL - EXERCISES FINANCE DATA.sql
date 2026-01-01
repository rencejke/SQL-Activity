--SQL EXCERCISES

--1
SELECT * 
FROM dbo.Finance_data;

--2
SELECT gender, age 
FROM dbo.Finance_data;

--3
SELECT DISTINCT * 
FROM dbo.Finance_data;

--4
SELECT 
COUNT(gender)
FROM dbo.Finance_data


--5
SELECT *
FROM dbo.Finance_data
WHERE gender = 'Male'

--6
SELECT TOP 5 *
FROM dbo.Finance_data
ORDER BY age ASC

--7
SELECT * 
FROM dbo.Finance_data
WHERE Investment_Avenues = 1 -- 1 Means Yes Else No

--8
SELECT MAX(Mutual_Funds) --7
FROM dbo.Finance_data 

--9
SELECT AVG(age) --27
FROM dbo.Finance_data 

--10 
SELECT Equity_Market [Equity Score]
FROM dbo.Finance_data 

--MEDIUM

--11
SELECT gender, 
COUNT(gender) [Number of Male/Female]
FROM dbo.Finance_data
GROUP BY gender

--12
SELECT gender, AVG(Fixed_Deposits) [Fixed_Deposits]
FROM dbo.Finance_data
GROUP BY gender

--13
SELECT *
FROM dbo.Finance_data
WHERE Gold > 5

--14
SELECT * 
FROM dbo.Finance_data
WHERE age BETWEEN 25 AND 35

--15
SELECT * 
FROM dbo.Finance_data
WHERE Invest_Monitor = 'Daily'

--16
SELECT 
CASE
	WHEN age < 30 THEN 'Young'
	ELSE 'Old'
END [Age Category]
FROM dbo.Finance_data

--17
SELECT * 
FROM dbo.Finance_data
WHERE Expect = '20%-30%' AND Avenue = 'Equity'

--18
SELECT *
FROM  dbo.Finance_data
WHERE age > (SELECT AVG(age)FROM dbo.Finance_data);

--19
SELECT TOP 3 * 
FROM dbo.Finance_data
ORDER BY Mutual_Funds DESC

--20
SELECT DISTINCT Objective
FROM dbo.Finance_data
UNION
SELECT DISTINCT Purpose
FROM dbo.Finance_data

--HARD
--21
SELECT RANK() OVER(PARTITION BY gender ORDER BY Equity_Market) [Rank], *
FROM dbo.Finance_data

--22
--FEMALE = 63
--MALE = 80
SELECT gender, age, fixed_deposits, 
SUM(Fixed_Deposits) OVER(PARTITION BY gender ORDER BY age)
FROM dbo.Finance_data

--23
;WITH calculateAverage AS(
	
	SELECT duration, AVG(Mutual_Funds) [Mutual Funds]
	FROM dbo.Finance_data
	GROUP BY Duration
	HAVING AVG(Mutual_Funds) > 3
)
SELECT duration, [Mutual Funds]
FROM calculateAverage

--24
--Female = 2
--Male = 1
SELECT gender, AVG(PPF)
FROM dbo.Finance_data
GROUP BY gender
HAVING AVG(PPF) > 4 -- NO RESULT


--25
--more universal
SELECT gender,
       Equity_Market,
       Equity_Market - (SELECT AVG(Equity_Market) 
                        FROM dbo.Finance_data) [Difference]
FROM dbo.Finance_data

--sql server specific
SELECT gender,
       Equity_Market,
       Equity_Market - (a.[AvgEquity]) 
FROM dbo.Finance_data
OUTER APPLY(SELECT AVG(Equity_Market) [AvgEquity]
                   FROM dbo.Finance_data) a

--26

;WITH FinanceWithID AS (
    SELECT 
        ROW_NUMBER() OVER (ORDER BY (SELECT NULL)) AS RespondentID, --create an id
        Mutual_Funds,
        Equity_Market,
        Government_Bonds,
        Fixed_Deposits,
        PPF,
        Gold,
        Stock_Marktet
    FROM dbo.Finance_data
),
Unpivoted AS ( --turns columns into rows.
    SELECT RespondentID, 'Mutual_Funds' AS InvestmentType, Mutual_Funds AS Score FROM FinanceWithID
    UNION ALL
    SELECT RespondentID, 'Equity_Market', Equity_Market FROM FinanceWithID
    UNION ALL
    SELECT RespondentID, 'Government_Bonds', Government_Bonds FROM FinanceWithID
    UNION ALL
    SELECT RespondentID, 'Fixed_Deposits', Fixed_Deposits FROM FinanceWithID
    UNION ALL
    SELECT RespondentID, 'PPF', PPF FROM FinanceWithID
    UNION ALL
    SELECT RespondentID, 'Gold', Gold FROM FinanceWithID
    UNION ALL
    SELECT RespondentID, 'Stock_Marktet', Stock_Marktet FROM FinanceWithID
),
Ranked AS (
    SELECT RespondentID, InvestmentType, Score,
           RANK() OVER(PARTITION BY RespondentID ORDER BY Score DESC) AS rnk
    FROM Unpivoted
    WHERE Score IS NOT NULL
)
SELECT *
FROM Ranked
WHERE rnk <= 2;

--27
SELECT
CASE 
	WHEN age < 25 THEN 'Youth'
	WHEN age between 25 AND 40 THEN 'Adult'
	ELSE 'Senior'
END [Age Group],
COUNT(*) Total
FROM dbo.Finance_data
GROUP BY 
CASE 
       WHEN age < 25 THEN 'Youth'
       WHEN age BETWEEN 25 AND 40 THEN 'Adult'
       ELSE 'Senior'
END

--28
SELECT * 
INTO #HighEquity 
FROM dbo.Finance_data 
WHERE Equity_Market > 5;

--29
SELECT 
ROW_NUMBER() OVER (ORDER BY (SELECT NULL)) [RespondentID],
(Fixed_Deposits * 100.0 / (SELECT MAX(Fixed_Deposits) FROM dbo.Finance_data)) [Fixed Deposits Interests],
(SELECT MAX(Fixed_Deposits) FROM dbo.Finance_data) [Maximum Fixed Deposits]
FROM dbo.Finance_data

