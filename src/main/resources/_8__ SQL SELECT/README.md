

    create database select_db;
    
    use select_db;

    CREATE TABLE employees (
        id INT AUTO_INCREMENT PRIMARY KEY,
        first_name VARCHAR(50),
        last_name VARCHAR(50),
        department VARCHAR(50),
        salary DECIMAL(10,2),
        hire_date DATE
    );

    INSERT INTO employees (first_name, last_name, department, salary, hire_date) VALUES
    ('John', 'Doe', 'HR', 60000.00, '2022-05-10'),
    ('Jane', 'Smith', 'IT', 75000.00, '2021-08-15'),
    ('Alice', 'Johnson', 'Finance', 82000.00, '2019-03-20'),
    ('Bob', 'Williams', 'IT', 72000.00, '2020-11-25'),
    ('Charlie', 'Brown', 'Marketing', 65000.00, '2023-01-05');

   ![img.png](img.png)


# only first_name and last_name

    select first_name, last_name from employees

# we can change column name in output/result set

    select first_name AS 'First Name', last_name AS 'Last Name', department from employees;
  ![img_1.png](img_1.png)
    
# filtering - employees from IT department
    select * from employees where department='IT'
  ![img_2.png](img_2.png)

# order by - sort based on salary ascending order
    select * from employees where department='IT' order by salary; 
  ![img_3.png](img_3.png)

# order by - sort based on salary descending order
    select * from employees where department='IT' order by salary desc;
  ![img_4.png](img_4.png)

# limit - find only 2 rows from employees
    select * from employees limit 2;
  ![img_5.png](img_5.png)

# find the employee whose salary is highest from IT department
    select * from employees where department='IT' order by salary desc limit 1;
  ![img_6.png](img_6.png) 

# distinct - unique department name we want
    select distinct department from employees;
  ![img_7.png](img_7.png)

# increase salary by 10% - mathematical calculation
    select first_name, last_name, salary * 1.1 AS 'Salary After Raise' from employees;    

# concat first_name and last_name
    select concat(first_name, ' ', last_name) AS 'Full Name' from employees 
  ![img_8.png](img_8.png)

# employee hire YEAR we want
    select concat(first_name, ' ', last_name) AS 'Full Name' YEAR(hire_date) from employees 
    select concat(first_name, ' ', last_name) AS 'Full Name', YEAR(hire_date), ROUND(salary, 1) from employees where salary > 70000; 
  ![img_9.png](img_9.png)

# employees whose salary is more than average salary
    select * from employees where salary > (select avg(salary) from employees);
  ![img_10.png](img_10.png)

# union - combine employees from IT department and HR department
    select * from employees where department='IT'
    union
    select * from employees where department='HR'
  ![img_11.png](img_11.png)

# group by - How many employees in each department
    select department, count(*)
    from employees
    group by (department);
  ![img_12.png](img_12.png)

# function
    select NOW();
    select LENGTH('KAUSHAL');
    select 5+2 AS 'sum of 5 and 2';
    select 3<1;