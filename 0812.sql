--1. �� ������ ��(last_name) �ش� ������ �Ŵ����� ������� ��(last_name)��ȸ�ϱ� 
SELECT e.last_name, m.last_name
FROM EMPLOYEES e
JOIN EMPLOYEES e ON MANAGER_id= m.EMPLOYEE_id; 

--2. �� ������ ��(lastname )�� �ش� ������ �μ��̸�(department_name) ��ȸ�ϱ� 
SELECT e.last_name, d.department_name
FROM employees e
JOIN departments d ON e.department_id= d.department_id;

--3. �� �γ��� �̸�(department name)�� �ش� �μ��� ��� �޿�(avg-salary) ��ȸ�ϱ� 
SELECT d.department_name,AVG(e.salary) AS Avg_salary
FROM departments d
JOIN employees e ON d.department_id = e.department_id
GROUP BY d.department_name;

--4. �� �μ��� �̸�(department name)�� �ش� �μ��� �ִ� �޿� (max salary) ��ȸ
SELECT d.department_name, MAX(e.salary) AS MAX_SALARY 
FROM departments d
JOIN employees e ON d.department_id = e.department_id
GROUP BY d.department_name;

--5. �� ������ ��(last-name)�� �ش� ������ ���� �μ��� �ּұ޿�(min salary) ��ȸ
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

--6. �� �μ��� �̸�(department_name) �� �ش�μ��� ���� ���� �� ���� ���� �޿�(higest_salary) ��ȸ�ϱ� 
SELECT d.department_name,MAX(e.salary) AS MAX_salary
FROM departments d
JOIN employees e ON d.department_id = e.department_id
GROUP BY d.department_name;


--7. �� ������ ��(last-name)�� �ش� ������ �Ŵ����� ��(last name)�� �μ� �̸�(department_name) ��ȸ 
SELECT e.last_name AS WORKER_LAST_NAME, m.last_name, d.department_name
FROM employees e
JOIN employees m ON e.manager_id = m.employee_id
JOIN departments d ON e.department_id = d.department_id;

--8. �� ������ �� last name �� �ش� ������ ���� �μ��� �Ŵ����� �� last name ��ȸ�ϱ�

SELECT oe.last_name AS W_last_name, om.last_name AS M_last_name
FROM (SELECT e.last_name, d.department_id, d.manager_id
    FROM employees e 
    JOIN departments d ON e.department_id= d.department_id
) oe
JOIN employees om ON oe.manager_id = om.employee_id;


--10. ������ �߿��� �޿� salary �� 10000�̻��� �������� �� last name�� �ش� ������ �μ� �̸� departmetn name ��ȸ
SELECT e.last_name, d.department_name, e.salary 
FROM employees e
JOIN departments d ON e.department_id = d.department_id
WHERE e.salary >= 10000
ORDER BY e.salary DESC;

--11.�� �μ��� �̸� department name, �ش� �μ��� �Ŵ��� id manager id�� �Ŵ����� �� last name, 
--������ id employee-id , ������ �� last name,  �׸��� �ش� ���� �޿� salary ��ȸ�ϱ� 
--�������� �޿�salary�� �ش� �μ��� ��ձ޿����� ���� �������� ��ȸ�մϴ�. 
--����� �μ� �̸��� ������ �޿��� ���� ������ ���ĵ˴ϴ�. 

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