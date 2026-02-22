use miniproject;
select * from salary;

-- 1)Which company offers the highest average salary in USD?
select Company,avg(`Salary (Annual)`) as avg_salary_USD from salary 
where `Currency`='USD' 
group by Company 
order by avg_salary_USD desc limit 1;

-- 2) What is the average job satisfaction score by industry?
select `Industry`,avg(`Job Satisfaction Score (1-10)`) as avg_job_sat_score from salary 
group by `Industry`;

-- 3) List the top 5 technologies used by Lead-level employees.
select distinct `Tech Stack` from Salary where `Experience Level`='Lead' limit 5;

-- 4)  Compare average salaries between remote and onsite jobs.
select `Remote Flexibility`,avg(`Salary (Annual)`)  as avg_salary from salary
where `Remote Flexibility` in ('Remote','Onsite')
group by `Remote Flexibility` ;

-- 5) How many employees have not been promoted in the last 2 years?
select count(*) as count_emp_pro from salary where `Last Promotion (Years Ago)`>=2;

-- 6) Which location has the most tech jobs using Python?
select Location,count(*) as count_job_py from salary 
where `Tech Stack`='Python' 
group by Location 
order by count_job_py desc limit 1; 

-- 7)What is the distribution of employment types across companies?
select `Company`,`Employment Type` from salary 
group by `Company`,`Employment Type` 
order by `Company`;

-- 8)Find the average salary for each combination of job title and experience level.
select `Job Role`,`Experience Level`,avg(`Salary (Annual)`) as avg_sal from Salary 
group by `Job Role`,`Experience Level`;

-- 9) Which perks are most common among Senior-level employees?
select `Perks`,count(*)as most_comm from salary 
where `Experience Level`='Senior' 
group by `Perks` 
order by most_comm limit 1;
