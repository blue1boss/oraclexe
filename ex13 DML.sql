/*

DML(DATA manipulation language) 
    DB에서 데이터를 조작하고 처리하는 SQL을 의미 
    INSERT문: 테이블에 새로운 레코드 삽입 
    UPDATE문: 테이블에 기존 레코드를 갱신 (업데이트) 하는데 사용 
    DELETE문: 테이블에서 특정레코드를 삭제 
    
    SELECT 는 DML에 포함될 수 있지만, 보통 DQL(data Query language) 분류한다
    
*/ 

/* 
INSERT문 
[기본형식]
    INSERT INTO 테이블명 (컬럼명1, 컬럼명2....) 
    VALUES(값1, 값2....) ;
    
    또는 
    INSERT INTO 테이블명 (컬럼명1,컬럼명2,..) subquery;
    
*/ 
SELECT * FROM DEPARTMENTS;
INSERT INTO departments(department_id, department_name, manager_id, location_id) 
VALUES (280, 'Public Relations', 100, 1700);

--확정은 commit;을 추가해주어야 SQL DML 결과를 영구적으로 반영

--null값을 가진 행 삽입 
--열 생략이 가능
INSERT INTO departments (department_id, department_name)
VALUES (290,'Purchasing');

select *from departments;

--commit안한 경우 가정
ROLLBACK; --되돌릴 수 있음 DML문의 실행결과를 취소할 때 

--NULL 키워드 지정 
INSERT INTO departments 
VALUES (300,'Finance', NULL, NULL);

/* INSERT SUBquery 

*/

CREATE TABLE sales_reps 
AS(SELECT employee_id id, last_name name, salary, commission_pct
    FROM employees --1=2는 조건이 거짓 빈테이블이 나온다 WHERE줄까지 실행하면 
    WHERE 1 = 2) ;
    
SELECT *FROM sales_reps;

--job_id REP 포함된 사원 
SELECT employee_id, last_name, salary, commission_pct
FROM employees
WHERE job_id LIKE '%REP%';

INSERT INTO sales_reps(id, name, salary, commission_pct)
SELECT employee_id, last_name, salary, commission_pct
FROM employees
WHERE job_id LIKE '%REP%';

--Commit; 
--SELECT * FROM SALES_REPS;