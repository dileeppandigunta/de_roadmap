--Q1 How many employees are there in total?
select count(*) as emp_count
from employees;
--Q2 In one query, show total, average, maximum and minimum salary.
select sum(salary),avg(salary),max(salary),min(salary) 
from employees;
--Q3 How many employees are in the IT department?
select count(*)
from employees 
where department = 'IT'
group by department;

-- here group by is not requried where conditions is enough and it will conut the employees whos is in IT 
select count(*) 
from employees 
where department = 'IT';

--Q4 Employee count per department.
select department,count(*)
from employees
group by department;
--Q5 Average salary per department, rounded to 2 decimals, highest first (use ROUND(AVG(salary), 2)).
select department,(ROUND(AVG(salary), 2)) as avg_sal_dept
from employees
group by department
order by avg_sal_dept desc;
--Q6 Employee count per city.
select city,count(*)
from employees
group by city;
--Q7 For each department, show the count, minimum salary and maximum salary.
select department,count(department)as cnt_dept,min(salary),max(salary)
from employees
group by department;
--Q8 Employee count for each department and city combination (two columns in GROUP BY).
select department,city,count(department)
from employees
group by department,city;
--Q9 Departments with more than 3 employees.
select department,count(*)
from employees
group by department
having count(*)>3;
--Q10 Departments whose average salary is above 60000.
select department,avg(salary)
from employees
group by department
having avg(salary)>60000;
--Q11 Cities with at least 4 employees, sorted by count descending.
select city,count(*)
from employees 
group by city
having count(*)>=4
order by count(*)desc;
--Q12 Employees whose first name starts with 'S'.
select *
from employees
where first_name like 'S%';
--Q13 Employees whose job title contains 'Manager'.
select * 
from employees
where job_title like '%Manager%';
--Q14 Employees earning between 50000 and 70000.
select *
from employees
where salary between 50000 and 70000;
--Q15 Employees in Pune or Mumbai who earn more than 50000.
select * 
from employees
where city in ('Mumbai','Pune') and salary >50000;
--Q16 Count employees by hire year (hint: EXTRACT(YEAR FROM hire_date), then group by it).
select EXTRACT(YEAR FROM hire_date) as hire_year,count(*)
from employees
group by hire_year;

--Without ORDER BY, the years can come back in any order:

select extract(year from hire_date) as hire_year, count(*) as emp_count
from employees
group by hire_year
order by hire_year;
--Q17 Which department has the highest total salary? Show only that one row.
select department,sum(salary)
from employees
group by department
order by sum(salary) desc
limit 1;






-------------------------------------These i tried with another table --------------------------------------





--Q1 Find the total number of employees in the employees table.
select count(*) 
from employees;
--Q2 Count how many employees have a dept_id assigned (notice how COUNT(*) differs from COUNT(dept_id)).
select count(dept_id)
from employees;
-- when i use * its showing all the employees count but when i use dept_id it showing the all the 
--employees who is having the dept_id only

--Q3 Display the minimum salary, maximum salary, and average salary 
--(rounded to 2 decimal places) across the entire company.
select (round(avg(salary),2)),max(salary),min(salary)
from employees;
--Q4 Show each dept_id and the total number of employees working in that department.
select dept_id,count(dept_id)
from employees
group by dept_id;

--(COUNT(dept_id) vs COUNT(*)): When grouping by dept_id, COUNT(dept_id) returns 0 for 
--the NULL department row (Siddharth Rao) instead of 1. Using COUNT(*) counts the actual row in that group:
SELECT dept_id, COUNT(*)
FROM employees
GROUP BY dept_id;

--Q5 Calculate the total salary (SUM) spent on each dept_id, sorted from the highest-spending department to the lowest.
select dept_id,sum(salary) as spend_dept
from employees
group by dept_id
order by spend_dept desc;
--Q6 Find the average salary for each role, sorted in descending order of average salary.
select role,(round(avg(salary),2)) 
from employees
group by role
order by Avg(salary) desc;
--Q7 Count how many employees report to each manager_id (include the NULL group as well).
select manager_id,count(*)
from employees
group by manager_id;
--Q8 Count how many departments exist in each location in the departments table.
select location,count(*)
from departments
group by location;
--Q9 Find the employee count for each dept_id, excluding rows where dept_id is NULL.
select dept_id,count(dept_id)
from employees
where dept_id is not null
group by dept_id;
--Q10 Count how many employees earn more than 1,000,000 in each dept_id.
select dept_id,count(*)
from employees
where salary >1000000
group by dept_id;
--Q11 Find the average salary per dept_id considering only employees hired on or after 2022-01-01.
select dept_id,(round(avg(salary),2))as avg_salary
from employees
where hire_date >='2022-01-01'
group by dept_id;
--Q12 For roles containing the word 'Engineer' (case-insensitive), 
--display each role and its total salary payout, sorted alphabetically by role.
select role,sum(salary) as total_payout
from employees
where role like '%Engineer%'
group by role
order by role asc;

--(LIKE vs ILIKE): LIKE in PostgreSQL is case-sensitive. It happened to match your current data because 'Engineer' is capitalized,
--but for true case-insensitive matching, use ILIKE (or LOWER(role) LIKE '%engineer%'):

SELECT role, SUM(salary) AS total_payout
FROM employees
WHERE role ILIKE '%Engineer%'
GROUP BY role
ORDER BY role ASC;

--Q13 For employees who actually have a manager (manager_id IS NOT NULL), 
--find the minimum and maximum salary under each manager_id.
select manager_id,min(salary),max(salary)
from employees
where manager_id is not null
group by manager_id;
--Q14 Group employees by their hiring year (EXTRACT(YEAR FROM hire_date)) 
--and count how many employees joined in each year, sorted chronologically.
select (EXTRACT(YEAR FROM hire_date)) as hired_year,count(*)
from employees
group by hired_year
order by hired_year asc;
--Q15 Find all dept_ids that have more than 2 employees.
select dept_id,count(dept_id)
from employees
group by dept_id
having count(dept_id)>2;

--Q16 List the dept_id and total salary for departments whose 
--total salary exceeds 3,000,000, sorted from highest to lowest total salary.
select dept_id,sum(salary)
from employees
group by dept_id
having sum(salary)>3000000
order by sum(salary) desc;
---Q17 Find the roles where the average salary is greater than 1,200,000.
select role,(round(avg(salary),2))
from employees
group by role
having avg(salary)>1200000;
--Q18 Display manager_id and their team size for managers who manage at 
--least 2 employees (exclude manager_id IS NULL).
select manager_id,count(*)
from employees
where manager_id is not null
group by manager_id
having count(*)>=2;
--Q19 Consider only employees earning at least 900,000 who have a valid dept_id. Group them 
--by dept_id, keep only those departments where the average salary of 
--these filtered employees is above 1,300,000, and sort the result by dept_id ascending.
select dept_id,(round(avg(salary),2))
from employees
where dept_id is not null and salary>900000
group by dept_id
having avg(salary)>1300000
order by dept_id asc;

--(> vs >=): The prompt specifies "at least 900,000", which includes 900,000 (>= instead of >):

SELECT dept_id, ROUND(AVG(salary), 2)
FROM employees
WHERE dept_id IS NOT NULL AND salary >= 900000
GROUP BY dept_id
HAVING AVG(salary) > 1300000
ORDER BY dept_id ASC;

--Q20 For each assigned dept_id, calculate the difference between the highest and lowest salary (MAX(salary) - MIN(salary)). 
--Show only departments where this salary gap is greater than 500,000, ordered by the gap from largest to smallest.
select dept_id,(max(salary)-min(salary))
from employees
group by dept_id
having (max(salary)-min(salary))>500000
order by (max(salary)-min(salary)) desc;

--(Missing WHERE dept_id IS NOT NULL): The prompt asks for "each assigned dept_id". 
--Without WHERE dept_id IS NOT NULL, PostgreSQL includes the NULL department group (though its gap of 0 gets filtered 
--out by HAVING anyway, filtering in WHERE is cleaner and avoids unnecessary grouping):

SELECT dept_id, (MAX(salary) - MIN(salary)) AS salary_gap
FROM employees
WHERE dept_id IS NOT NULL
GROUP BY dept_id
HAVING (MAX(salary) - MIN(salary)) > 500000
ORDER BY salary_gap DESC;
