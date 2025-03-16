-- data cleaning
select * from layoffs;

select * from layoff;


-- 1. Remove duplicate
-- 2. Standarize data
-- 3. Null Values or blank values remove
-- 4 .Remove any column

CREATE TABLE layoff_staging 
LIKE  layoffs;

insert into layoff_staging
select * from layoffs;

select *,
row_number() over(partition by company,location, industry,total_laid_off,percentage_laid_off,`date`) as Row_num from layoff_staging;

-- using cte
with duplicate_cte as  (
select *,
row_number() over(partition by company,location, industry,total_laid_off,percentage_laid_off,`date`,stage, country , funds_raised_millions) as Row_num from layoff_staging
)
 select * from duplicate_cte 
 where Row_num > 1;
 
 select * from layoff_staging where company = 'Casper';
 











CREATE TABLE `layoff_staging2` (
  `company` text,
  `location` text,
  `industry` text,
  `total_laid_off` int DEFAULT NULL,
  `percentage_laid_off` text,
  `date` text,
  `stage` text,
  `country` text,
  `funds_raised_millions` int DEFAULT NULL,
  `Row_num` INT
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

select * from layoff_staging2;

insert into layoff_staging2
select *,
row_number() over(partition by company,location, industry,total_laid_off,percentage_laid_off,`date`,stage, country , funds_raised_millions)
 as Row_num from layoff_staging;
 
select * from layoff_staging2 where 
Row_num >1;

DELETE
from layoff_staging2 where 
Row_num >1;

SET SQL_SAFE_UPDATES = 0;


delete from layoff_staging2 where 
Row_num >1;

select * from layoff_staging2;































































































































































































