--Q1. "employees"테이블에서 모든 직원들의 성(LAST_NAME) 이름 (FIRST_NAME)및 급여 
--(SALARY)를 조회하세요 (Answer codes) 



--Q2. 'jobs'테이블에서 모든 직무의 직무 Id(Job_Id)와 직무명을 조회하세요


--Q3. departments 테이블에서 모든 부서들의 부서 ID와 부서명을 조회하세요 


--Q4. locations 테이블에서 모든 지역들의 지역 ID와 도시를 조회하세요 ]

--Q5. employees 테이블에서 급여가 5000이상인 직원들의 이름과 급여를 조회하세요 


--Q6. employees 테이블에서 근무 시작일이 2005년 이후인 직원들의 이름과 근무 시작을 조회하세요 

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