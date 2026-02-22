use miniproject;
select * from salary;

-- 1) Who are the employees with over 5 years of experience and a salary above $100,000?
create view Experienced_High_Earners as
select `Employment Type`, `Job Role`, `Salary (Annual)`, `Years of Experience`
from salary
where `Years of Experience` > 5 AND `Salary (Annual)` > 100000;

SELECT * FROM Experienced_High_Earners;

-- 2) What is the average salary for each job title?
create view Avg_Salary_By_Jobrole as 
select `Job Role`,Round(avg(`Salary (Annual)`),2) as avg_salary
from salary 
group by `Job Role`;

select * from Avg_Salary_By_Jobrole;

-- 3) Which employees work with Python?
create view Python_user as 
select `Employment Type`,`Job Role`,`Tech Stack` 
from salary
where `Tech Stack`='Python';

select * from Python_user;
