--1. 각 직원의 성(last_name) 해당 직원의 매니저인 직우너의 성(last_name)조회하기 
SELECT e.last_name, m.last_name
FROM EMPLOYEES e
JOIN EMPLOYEES e ON MANAGER_id= m.EMPLOYEE_id; 

--2. 각 직원의 성(lastname )과 해당 직원의 부서이름(department_name) 조회하기 
SELECT e.last_name, d.department_name
FROM employees e
JOIN departments d ON e.department_id= d.department_id;

--3. 각 부넛의 이름(department name)과 해당 부서의 평균 급여(avg-salary) 조회하기 
SELECT d.department_name,AVG(e.salary) AS Avg_salary
FROM departments d
JOIN employees e ON d.department_id = e.department_id
GROUP BY d.department_name;

--4. 각 부서의 이름(department name)과 해당 부서의 최대 급여 (max salary) 조회
SELECT d.department_name, MAX(e.salary) AS MAX_SALARY 
FROM departments d
JOIN employees e ON d.department_id = e.department_id
GROUP BY d.department_name;

--5. 각 직원의 성(last-name)과 해당 직원이 속한 부서의 최소급여(min salary) 조회
SELECT oe.last_name, od.Min_salary 
FROM EMPLOYEES oe
    JOIN (
    SELECT d.department_id , MIN(e.salary)AS Min_Salary 
    FROM departments d 
    JOIN employees e ON d.department_id =e.department_id
    GROUP BY d.department_id
    )od
ON oe.department_id = od.department_id ;

SELECT * 
FROM departments;
SELECT * 
FROM employees;

--6. 각 부서의 이름(department_name) 과 해당부서에 속한 직원 중 가장 높은 급여(higest_salary) 조회하기 
SELECT d.department_name,MAX(e.salary) AS MAX_salary
FROM departments d
JOIN employees e ON d.department_id = e.department_id
GROUP BY d.department_name;


--7. 각 직원의 성(last-name)과 해당 직원의 매니저의 성(last name)및 부서 이름(department_name) 조회 
SELECT e.last_name AS WORKER_LAST_NAME, m.last_name, d.department_name
FROM employees e
JOIN employees m ON e.manager_id = m.employee_id
JOIN departments d ON e.department_id = d.department_id;

--8. 각 직원의 성 last name 과 해당 직원이 속한 부서의 매니저의 성 last name 조회하기

SELECT oe.last_name AS W_last_name, om.last_name AS M_last_name
FROM (SELECT e.last_name, d.department_id, d.manager_id
    FROM employees e 
    JOIN departments d ON e.department_id= d.department_id
) oe
JOIN employees om ON oe.manager_id = om.employee_id;


--10. 직원들 중에서 급여 salary 가 10000이상인 직원들의 성 last name과 해당 직원의 부서 이름 departmetn name 조회
SELECT e.last_name, d.department_name, e.salary 
FROM employees e
JOIN departments d ON e.department_id = d.department_id
WHERE e.salary >= 10000
ORDER BY e.salary DESC;

--11.각 부서의 이름 department name, 해당 부서의 매니저 id manager id와 매니저의 성 last name, 
--직원의 id employee-id , 직원의 성 last name,  그리고 해당 직원 급여 salary 조회하기 
--직원들의 급여salary가 해당 부서의 평균급여보다 높은 직원들을 조회합니다. 
--결과는 부서 이름과 직원의 급여가 높은 순으로 정렬됩니다. 

SELECT d.department_name, d.manager_id, m.last_name,
    e.employee_id, e.last_name, e.salary 
FROM departments d
JOIN employees m ON d.manager_id= m.employee_id
JOIN employees e ON d.department_id = e.department_id 
WHERE e.salary > (
    SELECT AVG(e1. salary)
    FROM employees e1
    WHERE e1.department_id= d.department_id
    )
ORDER BY d.department_name, e.salary DESC; 
-----dd
SELECT d.department_name, d.manager_id, m.last_name,
    e.employee_id, e.last_name, e.salary, da.Avg_Salary
FROM departments d
JOIN employees m ON d.manager_id= m.employee_id
JOIN employees e ON d.department_id = e.department_id 
JOIN (
    SELECT department_id, AVG(salary) AS Avg_Salary 
    FROM employees 
    GROUP BY department_id
    )da
ON d.department_id= da.department_id
WHERE e.salary > da.AVG_Salary 
ORDER BY d.department_name, e.salary DESC; 