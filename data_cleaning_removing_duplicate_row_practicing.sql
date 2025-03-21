select * from layoffs;
-- creating table duplicate
 create table rikesh like layoffs;
 
 insert into rikesh
 select * from layoffs;
 
 select * from rikesh;
 
select *,
row_number() over(partition by company,location,industry,total_laid_off,percentage_laid_off,`date`,stage,country,funds_raised_millions) 
as row_num from rikesh;

with duplicate_cte as (
select *,
row_number() over(partition by company,location,industry,total_laid_off,percentage_laid_off,`date`,stage,country,funds_raised_millions) 
as row_num from rikesh
)
select * from duplicate_cte where row_num>1;

select * from rikesh where company = 'Casper';
 
 
CREATE TABLE `rikesh2` (
  `company` text,
  `location` text,
  `industry` text,
  `total_laid_off` int DEFAULT NULL,
  `percentage_laid_off` text,
  `date` text,
  `stage` text,
  `country` text,
  `funds_raised_millions` int DEFAULT NULL,
  `row_num` int
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

select * from rikesh2;

insert into rikesh2 
select *,
row_number() over(partition by company,location,industry,total_laid_off,percentage_laid_off,`date`,stage,country,funds_raised_millions) 
as row_num from rikesh;

select * from rikesh2;

select * from rikesh2;




delete
from rikesh2 where row_num >1;

-- standarizaing


select company, trim(company) from rikesh2;


update rikesh2
set company = trim(company);

 select * from rikesh2 ;
