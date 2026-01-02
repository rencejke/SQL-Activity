--Explanatory Data Analysis

UPDATE dbo.layoffs_staging2 SET total_laid_off = NULL
WHERE total_laid_off = 'NULL'

UPDATE dbo.layoffs_staging2 SET percentage_laid_off = NULL
WHERE percentage_laid_off = 'NULL'

ALTER TABLE dbo.layoffs_staging2 
ALTER COLUMN total_laid_off INT NULL

ALTER TABLE dbo.layoffs_staging2 
ALTER COLUMN percentage_laid_off NUMERIC(18, 2) NULL

SELECT max(total_laid_off), MAX(percentage_laid_off) FROM 
dbo.layoffs_staging2 -- means 12000 people are laid off and 1.00 = 100% of the company are totally laid off

SELECT * FROM 
dbo.layoffs_staging2
WHERE percentage_laid_off = 1
ORDER BY total_laid_off desc

SELECT company, SUM(total_laid_off) FROM 
dbo.layoffs_staging2
GROUP BY company
ORDER BY 2 DESC -- per compay total laid off

SELECT MIN([date]), MAX([date]) FROM 
dbo.layoffs_staging2 --this starts on march 11, 2020 (pandemic days)

SELECT industry, SUM(total_laid_off) FROM 
dbo.layoffs_staging2
GROUP BY industry
ORDER BY 2 DESC --consumer industry hits really hard


SELECT country, SUM(total_laid_off) FROM 
dbo.layoffs_staging2
GROUP BY country
ORDER BY 2 DESC -- united states have the most total laid off


SELECT YEAR([date]), SUM(total_laid_off) FROM 
dbo.layoffs_staging2
GROUP BY YEAR([date])
ORDER BY 1 DESC -- 2022 have the most worst year because a lot of laid offs