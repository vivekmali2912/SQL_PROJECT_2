use miniproject;
select * from salary;
#1) describe the data
desc salary;

#2) finding the null data 

select count(*) from salary where company is null;
select count(*) from salary where `Job Title` is null;
select count(*) from salary where `Industry` is null;
select count(*) from salary where `Location` is null;
select count(*) from salary where `Employment Type` is null;
select count(*) from salary where `Experience Level` is null;
select count(*) from salary where `Remote Flexibility` is null;
select count(*) from salary where `Salary (Annual)` is null;
select count(*) from salary where `Currency` is null;
select count(*) from salary where `Years of Experience` is null;
select count(*) from salary where `Job Satisfaction Score (1-10)` is null;
select count(*) from salary where `Tech Stack` is null;
select count(*) from salary where `Perks` is null;
select count(*) from salary where `Last Promotion (Years Ago)` is null;

#3)identify duplicate rows in dataset
select company,`Job Title`,`Industry`,`Location` as occurance from salary 
group by company,`Job Title`,`Industry`,`Location` having count(*)>1;

#4)extract the data from the tech stack data
update salary
set `Tech Stack`=
    CASE
        WHEN `Tech Stack` LIKE '%Python%' THEN 'Python'
        WHEN `Tech Stack` LIKE '%SQL%' THEN 'SQL'
        WHEN `Tech Stack` LIKE '%React%' THEN 'React'
        WHEN `Tech Stack` LIKE '%JavaScript%' THEN 'JavaScript'
        when `Tech Stack` LIKE '%C#%' THEN 'C#'
        when `Tech Stack` LIKE '%.NET%' then '.NET'
        when `Tech Stack` LIKE '%Go%' then 'Go'
        when `Tech Stack` LIKE '%Kubernetes%' then 'Kubernetes'
        when `Tech Stack` LIKE '%Java%' then 'Java'
        when `Tech Stack` LIKE '%Spring%' then 'Spring'
        when `Tech Stack` LIKE '%R%' then 'R'
        -- Add more as needed
    END;

SET SQL_SAFE_UPDATES = 0;

#5)Alter the name of the column
alter table Salary rename column `Job Title` to `Job Role`;
