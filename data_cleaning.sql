select * from layoffs;

select *, 
row_number() over(partition by company, location,industry,total_laid_off,percentage_laid_off,`date`,stage,funds_raised_millions) 
as row_num from layoffs;

select * from layoffs where row_num>1;


with ram as (
select *, 
row_number() over(partition by company, location,industry,total_laid_off,percentage_laid_off,`date`,stage,funds_raised_millions) 
as row_num from layoffs
)