/* 
집합 연산자 
    여러 테이블 또는 집합의 결과를 조합하고 조작하는 연산자.
    SELECT 리스트의 표현식은 컬럼 개수가 일치해야 합니다. 
    데이터 유형도 일치해야 합니다. 
    
    UNION, UNION ALL, INTERSECT, MINUS 

*/ 

--UNION 연산자: 두개의 쿼리 결과를 합치고, 중복된 행을 제거합니다.
--행을 더해주는 것 job history의 테이블이 있음 
SELECT employee_id, job_id
FROM employees
UNION 
SELECT employee_id, job_id
FROM job_history ;

--UNION ALL연산자: 두개의 쿼리 결과를 합치고, 중복된 행을 포함하여 모두 반환합니다. 
SELECT employee_id, job_id
FROM employees
UNION ALL
SELECT employee_id, job_id
FROM job_history 
ORDER BY employee_id
;

--INTERESECT 연산자: 두개의 쿼리 결과 중에서 공통된 행만 반환합니다. (교집합) 
SELECT employee_id, job_id
FROM employees
INTERSECT
SELECT employee_id, job_id
FROM job_history 
ORDER BY employee_id
;

--MINUS 연산자: 첫번째 쿼리 결과 중에서 두번째 쿼리 결과에 존재하지 않는 행만 반환 
--2번째 쿼리의 값을 빼주는 형태 (행이 일치되어야 가능한 연산자)
SELECT employee_id, job_id
FROM employees
MINUS
SELECT employee_id, job_id
FROM job_history 
ORDER BY employee_id
;

DESC Employees;

--!> 데이터 유형/타입이 일치되어야 합니다. 
--조인하지 않은 두 테이블의 특정 컬럼들을 UNION하여 가져오기 

SELECT location_id,department_name As "Department", TO_CHAR(NULL) "Warehouse location"
FROM departments 
UNION 
SELECT location_id, TO_CHAR(NULL) AS "Department", state_province 
FROM locations;
--To char로 바꾸어주고 갯수 바꾸어주기 state province의 경우 맞추어주는 것을 의미 

SELECT employee_id, job_id, salary
FROM employees
UNION 
SELECT employee_id, job_id, 0 
FROM job_history ;
-- 타입과 열의 갯수를 맞추어주어야 