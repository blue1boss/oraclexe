--Q1. "employees"���̺��� ��� �������� ��(LAST_NAME) �̸� (FIRST_NAME)�� �޿� 
--(SALARY)�� ��ȸ�ϼ��� (Answer codes) 



--Q2. 'jobs'���̺��� ��� ������ ���� Id(Job_Id)�� �������� ��ȸ�ϼ���


--Q3. departments ���̺��� ��� �μ����� �μ� ID�� �μ����� ��ȸ�ϼ��� 


--Q4. locations ���̺��� ��� �������� ���� ID�� ���ø� ��ȸ�ϼ��� ]

--Q5. employees ���̺��� �޿��� 5000�̻��� �������� �̸��� �޿��� ��ȸ�ϼ��� 


--Q6. employees ���̺��� �ٹ� �������� 2005�� ������ �������� �̸��� �ٹ� ������ ��ȸ�ϼ��� 

SELECT * FROM EMPLOYEES;
--1
SELECT FIRST_NAME, LAST_NAME , SALARY 
FROM EMPLOYEES;
--2
SELECT JOB_ID, JOB_TITLE 
FROM JOBS;
--3
SELECT DEPARTMENT_ID, DEPARTMENT_NAME 
FROM DEPARTMENTS;
--4
SELECT LOCATION_ID, CITY
FROM LOCATIONS;
--5
SELECT FIRST_NAME, SALARY
FROM EMPLOYEES
WHERE SALARY >=5000
ORDER BY 2;
--6(04/12/31) WHERE HIRE_DATA > TO_DATE('2005-01-01','YYYY-MM-DD');
SELECT FIRST_NAME, HIRE_DATE
FROM EMPLOYEES
WHERE HIRE_DATE > '04/12/31'
ORDER BY 2;


DESC EMPLOYEES;