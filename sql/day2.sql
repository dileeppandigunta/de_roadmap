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
