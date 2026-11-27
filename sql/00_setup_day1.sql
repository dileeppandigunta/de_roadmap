CREATE SCHEMA IF NOT EXISTS day1;
SET search_path = day1;

CREATE TABLE employees (
  emp_id     INT PRIMARY KEY,
  first_name VARCHAR(30),
  last_name  VARCHAR(30),
  department VARCHAR(20),
  job_title  VARCHAR(30),
  salary     INT,
  hire_date  DATE,
  city       VARCHAR(20)
);

INSERT INTO employees VALUES
(1,'Arjun','Reddy','IT','Developer',65000,'2019-03-15','Bengaluru'),
(2,'Priya','Sharma','HR','HR Executive',45000,'2020-07-01','Hyderabad'),
(3,'Rahul','Verma','IT','Senior Developer',95000,'2017-01-10','Bengaluru'),
(4,'Sneha','Iyer','Finance','Accountant',52000,'2018-11-20','Chennai'),
(5,'Kiran','Kumar','Sales','Sales Executive',40000,'2021-02-14','Hyderabad'),
(6,'Anitha','Rao','IT','Data Analyst',70000,'2020-09-05','Bengaluru'),
(7,'Vikram','Singh','Sales','Sales Manager',88000,'2016-06-25','Mumbai'),
(8,'Meena','Nair','Finance','Finance Manager',98000,'2015-04-12','Chennai'),
(9,'Suresh','Babu','Admin','Admin Executive',35000,'2022-01-17','Hyderabad'),
(10,'Divya','Menon','HR','HR Manager',85000,'2016-08-30','Bengaluru'),
(11,'Rohit','Gupta','IT','Developer',60000,'2022-05-09','Pune'),
(12,'Lakshmi','Devi','Admin','Office Manager',55000,'2018-03-03','Hyderabad'),
(13,'Manoj','Patel','Sales','Sales Executive',42000,'2023-01-23','Mumbai'),
(14,'Pooja','Joshi','IT','QA Engineer',58000,'2021-10-11','Pune'),
(15,'Harish','Chandra','Finance','Auditor',62000,'2019-12-02','Bengaluru'),
(16,'Swathi','Reddy','IT','Data Engineer',92000,'2018-02-19','Hyderabad'),
(17,'Naveen','Kumar','Admin','Receptionist',30000,'2023-06-12','Chennai'),
(18,'Deepa','Krishnan','Sales','Sales Executive',41000,'2022-09-26','Chennai'),
(19,'Ajay','Mehta','IT','Developer',67000,'2020-01-06','Mumbai'),
(20,'Nisha','Thomas','HR','Recruiter',48000,'2021-04-19','Pune');
