--data cleaning

-- 1. remove duplicates
-- 2. standardize the data
-- 3. null values or blank values
-- 4. remove any columns (create a backup/hist first)

select * 
from dbo.layoffs;

--copy table structure from dbo.layoffs
SELECT TOP 0 *
INTO layoffs_staging
FROM dbo.layoffs;

--copy all data from dbo.layoffs
INSERT INTO dbo.layoffs_staging 
SELECT * 
FROM dbo.layoffs;

--fast and easy way to copy the table structure and copy its data
SELECT * 
INTO dbo.layoffs_staging 
FROM dbo.layoffs;


--check duplicates
SELECT *, ROW_NUMBER() OVER(
PARTITION BY company, industry, total_laid_off, percentage_laid_off, [date] ORDER BY company)  AS rowNumber
FROM dbo.layoffs_staging; 


WITH duplicate_CTE AS 
(
	SELECT *, ROW_NUMBER() OVER(
	PARTITION BY company, [location], industry, total_laid_off, percentage_laid_off, [date],
	stage, country, funds_raised_millions
	ORDER BY company)  AS rowNumber
	FROM dbo.layoffs_staging
)
SELECT * 
FROM duplicate_CTE
WHERE rowNumber > 1

SELECT * FROM dbo.layoffs_staging where company = 'Casper'

DELETE
dbo.layoffs_staging2
WHERE row_num > 1

SELECT * FROM dbo.layoffs_staging2

--2. Standardizing data (check every column)

SELECT company, TRIM(company)  
FROM dbo.layoffs_staging2

--removes white spaces
UPDATE dbo.layoffs_staging2
SET company = TRIM(company)


SELECT DISTINCT industry  
FROM dbo.layoffs_staging2
ORDER BY 1

--in this column there are 
--data name crypto currency and crypto so to make 
--it standardize i make it just crypto
SELECT *   
FROM dbo.layoffs_staging2
WHERE INDUSTRY LIKE 'Crypto%' 

UPDATE layoffs_staging2
SET industry = 'Crypto'
WHERE INDUSTRY LIKE 'Crypto%'


SELECT DISTINCT country FROM dbo.layoffs_staging2
order by country

SELECT *   
FROM dbo.layoffs_staging2
WHERE country LIKE 'United States.%' 


SELECT DISTINCT country, TRIM(TRAILING '.' FROM country)   
FROM dbo.layoffs_staging2
order by country

--TRAILING removes character at the end of the data in the column
--LEADING removes character at the beginning of the data in the column
UPDATE dbo.layoffs_staging2
SET country = TRIM(TRAILING '.' FROM country)  
WHERE country LIKE 'United States%';


UPDATE t1
SET t1.industry = t2.industry
FROM dbo.layoffs_staging2 t1
JOIN dbo.layoffs_staging2 t2
  ON t2.company = t1.company
 AND t2.location = t1.location
WHERE t1.industry IS NULL
  AND t2.industry IS NOT NULL;

SELECT [date]
FROM layoffs_staging2;

UPDATE [dbo].[layoffs_staging2] SET [date] = NULL
WHERE [date] = 'NULL'

ALTER TABLE [dbo].[layoffs_staging2]
ALTER COLUMN [date] DATE;

UPDATE [dbo].[layoffs_staging2] SET [date] = FORMAT([Date], 'yyyy-MM-dd')
SELECT * FROM [dbo].[layoffs_staging2]

--3
SELECT * 
FROM dbo.layoffs_staging2
WHERE total_laid_off = 'NULL'
AND percentage_laid_off = 'NULL'

DELETE
FROM dbo.layoffs_staging2
WHERE total_laid_off = 'NULL'
AND percentage_laid_off = 'NULL'

--4.
ALTER TABLE dbo.layoffs_staging2
DROP COLUMN row_num





