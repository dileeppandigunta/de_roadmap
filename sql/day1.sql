--Q1 Show all columns for all employees.
select * 
from employees;
--Q2 Show only first_name, last_name and salary.
select first_name,last_name,salary 
from employees;
--Q3 Show each employee's full name in one column using first_name || ' ' || last_name, aliased as full_name.
select first_name||''|| last_name as full_name 
from employees;
-- here i missed to give the space for concate at first then corrected
select first_name||' '|| last_name as full_name 
from employees;
--Q4 Show the distinct departments (hint: DISTINCT).
select distinct department 
from employees;
--Q5 Employees in the IT department.
select * 
from employees 
where department = 'IT';
--Q6 Employees earning more than 60000.
select * 
from employees 
where salary >60000;
--Q7 Employees in Hyderabad earning 40000 or less.
select * 
from employees 
where city = 'Hyderabad' and salary <=40000;
--Q8 Employees in Sales or HR (use OR).
select * 
from employees 
where job_title = 'HR Executive' or job_title = 'Sales Manager';
-- missunderstood the question completely wrote the wrong query
select * 
from employees 
where department in ('HR','Sales');
--Q9 Employees hired after 1 Jan 2021.
select * 
from employees 
where hire_date > '2021-01-01';
--Q10 All employees sorted by salary, highest first.
select * 
from employees 
order by salary desc;
--Q11 The 5 highest-paid employees.
select * 
from employees
order by salary desc 
limit 5;
--Q12 IT employees sorted by hire date, oldest first.
select *
from employees
where department = 'IT'
order by hire_date asc;
--Q13 The 3 most recently hired employees, showing only name and hire date.
select first_name,hire_date
from employees
order by hire_date desc
limit 3;
--Q14 Non-IT employees in Bengaluru or Pune, sorted by salary descending, top 3 only. (Watch your brackets with AND and OR.)
select *
from employees
where department != 'IT' and city in ('Bengaluru', 'Pune')
order by salary desc
limit 3;
-- i have used wrong not equal which is != but <> is the standard "not equal"
select *
from employees
where department <> 'IT' and city in ('Bengaluru', 'Pune')
order by salary desc
limit 3;
