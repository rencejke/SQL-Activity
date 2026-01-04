--Explanatory Data Analysis

UPDATE dbo.layoffs_staging2 SET total_laid_off = NULL
WHERE total_laid_off = 'NULL';

UPDATE dbo.layoffs_staging2 SET percentage_laid_off = NULL
WHERE percentage_laid_off = 'NULL';

ALTER TABLE dbo.layoffs_staging2 
ALTER COLUMN total_laid_off INT NULL;

ALTER TABLE dbo.layoffs_staging2 
ALTER COLUMN percentage_laid_off NUMERIC(18, 2) NULL;

SELECT max(total_laid_off), MAX(percentage_laid_off) FROM 
dbo.layoffs_staging2; -- means 12000 people are laid off and 1.00 = 100% of the company are totally laid off

SELECT * FROM 
dbo.layoffs_staging2
WHERE percentage_laid_off = 1
ORDER BY total_laid_off desc;

SELECT company, SUM(total_laid_off) FROM 
dbo.layoffs_staging2
GROUP BY company
ORDER BY 2 DESC; -- per compay total laid off

SELECT MIN([date]), MAX([date]) FROM 
dbo.layoffs_staging2; --this starts on march 11, 2020 (pandemic days)

SELECT industry, SUM(total_laid_off) FROM 
dbo.layoffs_staging2
GROUP BY industry
ORDER BY 2 DESC; --consumer industry hits really hard


SELECT country, SUM(total_laid_off) FROM 
dbo.layoffs_staging2
GROUP BY country
ORDER BY 2 DESC; -- united states have the most total laid off


SELECT YEAR([date]), SUM(total_laid_off) FROM 
dbo.layoffs_staging2
GROUP BY YEAR([date])
ORDER BY 1 DESC; -- 2022 have the most worst year because a lot of laid offs


SELECT stage, SUM(total_laid_off) FROM 
dbo.layoffs_staging2
GROUP BY stage
ORDER BY 2 DESC;


SELECT company, AVG(percentage_laid_off) FROM 
dbo.layoffs_staging2
GROUP BY company
ORDER BY 2 DESC;


SELECT SUBSTRING(CAST([date] AS VARCHAR (80)), 1, 7) AS [MONTH],  SUM(total_laid_off) FROM 
dbo.layoffs_staging2
WHERE SUBSTRING(CAST([date] AS VARCHAR (80)), 1, 7) IS NOT NULL
GROUP BY SUBSTRING(CAST([date] AS VARCHAR (80)), 1, 7) --YEAR AND MONTHS
ORDER BY 1 ASC;

SELECT MONTH([date])[MONTH], SUM(total_laid_off) FROM 
dbo.layoffs_staging2
GROUP BY MONTH([date]);


--ROLLING TOTAL
WITH ROLLING_TOTAL
AS (
	SELECT SUBSTRING(CAST([date] AS VARCHAR (80)), 1, 7) AS [MONTH],  SUM(total_laid_off) [sum_laidoff] FROM 
	dbo.layoffs_staging2
	WHERE SUBSTRING(CAST([date] AS VARCHAR (80)), 1, 7) IS NOT NULL
	GROUP BY SUBSTRING(CAST([date] AS VARCHAR (80)), 1, 7) --YEAR AND MONTHS
	
)
SELECT [MONTH], [sum_laidoff], SUM([sum_laidoff]) OVER(ORDER BY [MONTH]) [rolling total]
FROM ROLLING_TOTAL
ORDER BY 1 ASC --[sum_laidoff] are getting add row by row in rolling total column


SELECT company, SUM(total_laid_off) FROM 
dbo.layoffs_staging2
GROUP BY company;


SELECT company, YEAR([date]), SUM(total_laid_off) FROM 
dbo.layoffs_staging2
GROUP BY company, YEAR([date])
ORDER BY 3 DESC;


WITH CompanyYear AS
(
	SELECT company, YEAR([date])[Year], SUM(total_laid_off) [sum_laidoff] FROM 
	dbo.layoffs_staging2
	GROUP BY company, YEAR([date])
), CompanyYearRank AS
(
	SELECT *, 
	DENSE_RANK() OVER(PARTITION BY [Year] ORDER BY [sum_laidoff] desc) [rank] 
	FROM CompanyYear
	WHERE [Year] IS NOT NULL

)
SELECT * 
FROM CompanyYearRank
WHERE [rank] <=5 
--We can see here the top 5 companies who has total laid off per year

WITH IndustryYear AS
(
	SELECT Industry, YEAR([date])[Year], SUM(total_laid_off) [sum_laidoff] FROM 
	dbo.layoffs_staging2
	GROUP BY Industry, YEAR([date])
), IndustryYearRank AS
(
	SELECT *, 
	DENSE_RANK() OVER(PARTITION BY [Year] ORDER BY [sum_laidoff] desc) [rank] 
	FROM IndustryYear
	WHERE [Year] IS NOT NULL

)
SELECT * 
FROM IndustryYearRank
WHERE [rank] <=5
--We can see here the top 5 industries who has total laid off per year

