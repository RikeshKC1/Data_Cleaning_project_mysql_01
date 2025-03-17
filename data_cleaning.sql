select * from layoffs;

select *, 
row_number() over(partition by company, location,industry,total_laid_off,percentage_laid_off,`date`) from layoffs;

