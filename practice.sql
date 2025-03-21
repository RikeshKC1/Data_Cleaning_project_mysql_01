select * from layoffs;

create table layoff_duplicate 
select * from layoffs;

select * from layoff_duplicate;

select *, row_number() over(partition by company , location, industry ,total_laid_off,percentage_laid_off,`date`,stage , country, funds_raised_millions) 
as row_num from layoff_duplicate;

with example_cte as (
select *, row_number() over(partition by company , location, industry ,total_laid_off,percentage_laid_off,`date`,stage , country, funds_raised_millions) 
as row_num from layoff_duplicate
)
select * from example_cte where row_num >1 ;

CREATE TABLE `layoff_duplicate1` (
  `company` text,
  `location` text,
  `industry` text,
  `total_laid_off` int DEFAULT NULL,
  `percentage_laid_off` text,
  `date` text,
  `stage` text,
  `country` text,
  `funds_raised_millions` int DEFAULT NULL,
  row_num int
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

select * from layoff_duplicate1 ;

insert into layoff_duplicate1 
select *, row_number() over(partition by company , location, industry ,total_laid_off,percentage_laid_off,`date`,stage , country, funds_raised_millions) 
as row_num from layoff_duplicate;

select * from layoff_duplicate1 where company = 'Casper';

delete from layoff_duplicate1 where row_num >1 ;

select * from layoff_duplicate1 where row_num >1;

-- standarization

select * from layoff_duplicate1 ;

select company, trim(company) from layoff_duplicate1 ;


SET SQL_SAFE_UPDATES = 0;
update layoff_duplicate1
set company = trim(company);

select * from layoff_duplicate1;

select industry from layoff


