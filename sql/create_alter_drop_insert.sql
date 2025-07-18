create database create_alter_drop_insert;
use create_alter_drop_insert;
select database();

create table employees(
	employee_id int primary key auto_increment,
	first_name varchar(50) not null,
    last_name varchar(50) not null,
    hire_date date default (current_date()),
    email varchar(100) unique,
    phone_number varchar(100) unique,
    salary decimal(10, 2) check(salary > 0.0),
    employment_status enum('active', 'on leave', 'terminated') default 'active',
    created_at timestamp default current_timestamp,
    updated_at timestamp default current_timestamp on update current_timestamp
);

select * from employees;

drop table employees;

insert into employees (
	first_name,
    last_name,
    email,
    phone_number,
    salary)
VALUES (
	'Jane',
    'Smith',
    'jane.smith@company.com',
    '+1-555-123-4568',
    75000.00);
select * from employees;


CREATE TABLE departments (
	department_id int primary key auto_increment,
    department_name varchar(100) not null,
    location varchar(100),
    created_at timestamp default current_timestamp,
    updated_at timestamp default current_timestamp on update current_timestamp
);


ALTER TABLE employees
ADD COLUMN description text;

ALTER TABLE employees
ADD COLUMN emergency_contact VARCHAR(100) NOT NULL CHECK(emergency_contact REGEXP '^[A-Za-z ]+: [0-9+-]+$' );   #Error Code: 3819. Check constraint 'employees_chk_2' is violated.

ALTER TABLE employees
ADD COLUMN emergency_contact VARCHAR(100)

select * from employees

ALTER TABLE employees
MODIFY COLUMN first_name varchar(100)

ALTER TABLE employees
RENAME COLUMN descriptions to description;

ALTER TABLE employees
DROP COLUMN temp;

ALTER TABLE employees
ADD CHECK(emergency_contact REGEXP '^[A-Za-z ]+: [0-9+-]+$' ); 

ALTER TABLE employees
MODIFY COLUMN emergency_contact VARCHAR(100) NOT NULL;

INSERT INTO departments (department_name, location) VALUES 
('IT', 'Building A'),
('HR', 'Building B'),
('SALES', 'Building C');

select * from departments;

ALTER TABLE employees
ADD COLUMN department_id INT;

ALTER TABLE employees
DROP COLUMN department_id;

ALTER TABLE employees
ADD COLUMN department_id INT NOT NULL;   #(Not Recommended)

#Right way to add constraint in column Add column without constraint, then add/update data in that column and then add constraint 
ALTER TABLE employees
ADD COLUMN department_id INT;

#add/update data in that column
select * from employees;

ALTER TABLE employees
MODIFY COLUMN department_id INT NOT NULL;

# add department_id as a foreign key in employees table

ALTER TABLE employees
ADD FOREIGN KEY (department_id) REFERENCES departments(department_id);

ALTER TABLE employees
MODIFY COLUMN first_name varchar(50) NOT NULL;

DESC employees;
INSERT INTO employees (
	first_name,
    last_name,
    email,
    phone_number,
    emergency_contact,
    department_id
)
VALUES (
    'Michael',
    'Chang',
    'michael.chang@company.com',
    '+1-555-333-4444',
    'ok: 32332',
    2
);
