SELECT *
FROM departments;

SELECT *
FROM employees;

SELECT *
FROM regions;

SELECT employee_id, first_name, department
from employees;

SELECT *
FROM employees
WHERE department = 'Sports';

SELECT *
FROM employees
WHERE department LIKE '%nit%';

SELECT *
FROM employees
WHERE department LIKE 'F%nit%';


SELECT *
FROM employees
WHERE salary>=100000;


SELECT *
FROM employees
WHERE salary<=100000;

SELECT *
FROM employees
WHERE department='Clothing'
AND salary>90000
AND region_id=2;


SELECT *
FROM employees
WHERE department='Clothing'
OR salary>90000;

SELECT *
From employees
WHERE salary<40000
AND (department='Clothing'
OR department='Pharmacy');

SELECT *
From employees
Where not department <> 'Sports';


SELECT *
FROM employees
WHERE email IS NOT NULL;

SELECT *
FROM employees
WHERE department='Sports'
OR department='Pharmacy'
OR department='Toys';

SELECT *
FROM employees
WHERE department IN ('Sports', 'First Aid', 'Toys');

SELECT first_name, email
FROM employees
WHERE gender = 'F'
AND department='Tools';

SELECT first_name, hire_date
FROM employees
WHERE salary>165000
OR (department='Sports' AND gender='M');

SELECT *
FROM employees
ORDER BY employee_id DESC;

SELECT DISTINCT department
FROM employees;


SELECT DISTINCT department
FROM employees
FETCH FIRST 3 ROWS ONLY;

SELECT *
FROM students
ORDER BY age DESC
FETCH FIRST 4 ROWS ONLY;

SELECT *
FROM students
WHERE age <=20
AND (student_no  BETWEEN 3 and 5 OR student_no=7)
OR (age>20 AND student_no>=4);

SELECT upper(first_name), lower(department)
FROM employees;

SELECT length(first_name)
FROM employees;


SELECT  TRIM ('    Hello there    ');

SELECT  Length ('    Hello there    ');

SELECT  Length (TRIM ('    Hello there    '));


SELECT first_name || ' ' || last_name as full_name
FROM employees;

SELECT (salary>140000)
FROM employees;

SELECT (salary>140000) AS high_paid
FROM employees
ORDER BY salary DESC;

SELECT 'This is test data' test_data;

SELECT department, (department LIKE '%oth%')
FROM employees;


SELECT SUBSTRING('this is a test data' FROM 1 FOR 4) as test_data;

SELECT SUBSTRING('THIS IS A TEST DATA ' FROM 9) AS TEST_DATA;

SELECT department, REPLACE (department, 'Clothing', 'Clothes')
FROM departments;

SELECT MAX (salary)
FROM employees;

SELECT MIN (salary)
FROM employees;

SELECT AVG (salary)
FROM employees;

SELECT ROUND (AVG(salary))
FROM employees;

SELECT COUNT (employee_id)
FROM employees;

SELECT COUNT (email)
FROM employees;

SELECT SUM (salary)
FROM employees
WHERE department='Clothing';

SELECT *
FROM professors;

SELECT last_name, UPPER(SUBSTRING(department,1,3)) as department, salary, hire_date
FROM professors;

SELECT MAX (salary) as max_salary, MIN (salary) as min_salary
FROM professors
WHERE last_name != 'Wilson';

SELECT COUNT (*), department
FROM employees
GROUP BY department;

SELECT SUM (salary) as total_salary, department
FROM employees
GROUP BY department;

SELECT MIN (salary) min_salary, MAX (salary) max_salary, AVG (salary) avg_salary,COUNT(*) total_number_employees, department
FROM employees
GROUP BY department;

SELECT SUM (salary) as total_salary, department
FROM employees
WHERE region_id IN (4,5,6,7)
GROUP BY department;


SELECT*
FROM employees;

SELECT COUNT(*), SUBSTRING(email, POSITION('@' IN email) +1) email_domain
FROM employees
WHERE email IS NOT NUll
GROUP BY email_domain;



SELECT e.department
FROM employees e, departments d;

SELECT *
FROM (SELECT * FROM employees WHERE salary>15000)  a;

SELECT *
FROM employees
WHERE department IN (SELECT department FROM departments WHERE division='Electronics');

SELECT *
FROM employees
WHERE region_id IN (SELECT region_id FROM regions WHERE country='Asia' OR country='Canada');

SELECT first_name, (SELECT max(salary) FROM employees)-salary
FROM employees
WHERE region_id IN (SELECT region_id FROM regions WHERE country='Asia' OR country='Canada');

SELECT *
FROM employees
WHERE department = ANY (SELECT department FROM departments WHERE division='Kids')
AND hire_date> ALL(SELECT hire_date FROM employees WHERE department = 'Maintenance');


SELECT *
FROM students;

SELECT *
FROM student_enrollment;

SELECT *
FROM courses;

SELECT student_name
FROM students
WHERE student_no IN (SELECT student_no FROM student_enrollment
WHERE course_no IN (SELECT course_no FROM courses
WHERE course_title IN ('Physics', 'US History')));


SELECT first_name, salary,
CASE
    WHEN salary<100000 THEN 'Underpaid'
    WHEN salary>100000 THEN 'Paid well'
    ElSE 'Unpaid'
END as category
FROM employees;


SELECT category, COUNT(*)
FROM (SELECT first_name,
             CASE
                 WHEN salary<100000 THEN 'Underpaid'
                 WHEN salary>100000 AND salary<160000 THEN 'Paid well'
                 ElSE 'Unpaid'
            END as category
    FROM employees) a
GROUP BY category;





SELECT first_name, country
FROM employees, regions
WHERE regions.region_id = employees.region_id;

SELECT first_name, email, division
FROM employees e, departments d, regions r
WHERE e.department=d.department
AND e.region_id=r.region_id;

SELECT first_name, country
FROM employees INNER JOIN regions
ON employees.region_id=regions.region_id;



SELECT first_name, email, division
FROM employees INNER JOIN departments
ON employees.department = departments.department
WHERE email IS NOT NULL;


SELECT first_name, email, division, country
FROM employees e INNER JOIN departments d
ON e.department = d.department INNER JOIN regions r
ON e.region_id = r.region_id
WHERE email IS NOT NULL;

SELECT distinct department from employees; --27
SELECT distinct department from departments; --24

SELECT distinct  e.department, d.department
from employees e INNER JOIN departments d
on e.department = d.department;

SELECT distinct  e.department, d.department
from employees e RIGHT JOIN departments d
on e.department = d.department;

SELECT distinct  e.department, d.department
from employees e LEFT JOIN departments d
on e.department = d.department;

SELECT distinct  e.department, d.department
from employees e FULL JOIN departments d
on e.department = d.department;

SELECT department
FROM departments
UNION
SELECT department
FROM departments














