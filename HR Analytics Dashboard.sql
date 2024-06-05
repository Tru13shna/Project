create database Project ;
select* from project_file;
use project;

-- (1)-- 
select Department ,
concat(format(count(case when Attrition = 'Yes' then 1 end)/count(*) *100,2),'%') as Attition_Rate from project_file
group by Department;

-- (2)-- 
select avg(HourlyRate) as HourlyRate  from project_file
where Gender like 'Male' and Department like 'Research%';

-- (3) -- 
select Department , round(avg(MonthlyIncome),2) as monthly_income_avg,
concat(format(count(case when Attrition = 'Yes' then 1 end)/count(*) *100,2),'%') as Attition_Rate from project_file
group by Department;

 -- (4) -- 
select distinct(Department) as Department,
round(avg(TotalWorkingYears),2 )AS Average_Working_Years from project_file
group by Department;

  -- (5) -- 
select distinct(JobRole) as JobRole ,
round(avg(WorkLifeBalance),2)as Average_WorkLifeBalance from project_file
group by JobRole;
    
  -- (6)  -- 
select 
ifnull(JobRole,'Total') as JobRole,
count(case when WorkLifeBalance = 1 then 1 end) as Poor_1,
count(case when WorkLifeBalance = 2 then 1 end) as Average_2,
count(case when WorkLifeBalance = 3 then 1 end) as Good_3,
count(case when WorkLifeBalance = 4 then 1 end) as Excellent_4,
count(*) as Total_count
from project_file
where Attrition ='Yes'
group by JobRole with rollup;

  
  
  
  
  
 

  
  
  
