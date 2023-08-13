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

--Commit
--SELECT * FROM SALES_REPS



/* Update 문 
    테이블의 기존값을 수정합니다. 
    
[기본형식]
    Update 테이블명 
    SET 컬럼명1 = 수정값, 컬럼명2 = 수정값
    Where 조건절
*/ 

CREATE TABLE copy_emp
AS SELECT * FROM employees WHERE 1= 2;

INSERT INTO copy_emp
SELECT * FROM employees;--employee 테이블에서 copy emp테이블로 복사하기

commit;
SELECT * FROM copy_emp;

--113번 회원의 부서번호 50으로 변경 
UPDATE copy_emp
SET department_id = 50 
WHERE employee_id= 113;

rollback;
--전체의 업데이트가 진행
UPDATE copy_emp
SET department_id = 110;


UPDATE copy_emp 
SET department_id = (SELECT department_id
                    From employees
                    WHERE employee_id = 100) 
WHERE job_id = (SELECT job_id 
                FROM employees 
                WHERE employee_id =200);
                
SELECT * FROM copy_emp WHERE job_id ='AD_ASST';


/* 
DELETE 문
    DELETE 문을 사용하여 테이블에서 기존 행을 제거할 수 있습니다. 
    
    */ 
--사원번호 200번인 사원 삭제 
DELETE FROM copy_emp 
WHERE employee_id = 200;

SELECT * FROM copy_emp 
WHERE employee_id = 200;

--테이블 전체 데이터 삭제 
DELTE FROM copy_emp;

/* 
TRUNCATE 문 
    테이블을 빈 상태로, 테이블 구조 그대로 남겨둔 채 테이블에서 모든 행을 제거합니다. 
    DML 문이 아닌라 DDL(데이터 정의어) 문이므로 쉽게 언두할 수 없습니다. 
*/ 

--완전삭제의 사용 : TRUNCATE TABLE copy_emp; 

/* 
트랜잭션 (transaction) 
    데이터 처리의 한 단위입니다. 
    오라클에서 발생하는 여러개의 SQL 명령문을 
    하나의 논리적인 작업 단위로 처리하느데 이를 트랜잭션이라고 합니다. 
    
    COMMIT: SQL문의 결과를 영구적으로 DB에 반영 
    ROLLBACK: SQL문의 실행결과를 취소할 때 
    SAVEPOINT: 트랜잭션의 한지점에 표시하는 임시 저장점 
*/ 

CREATE TABLE member(
    num NUMBER PRIMARY KEY, -- num 이름 숫자만/ 고유값
    name VARCHAR2(30), --이름, 글자만 30자 
    addr VARCHAR2(50) --이름, 글자만 50자
    );
    
INSERT INTO member VALUES (1,'피카츄','태초마을');
COMMIT;
INSERT INTO member VALUES (2,'라이츄','태초마을');
INSERT INTO member VALUES (3,'파이리','태초마을');
INSERT INTO member VALUES (4,'꼬부기','태초마을');

SELECT * FROM member;

--savepoint
INSERT INTO member VALUES(5,'버터플','태초마을');
SAVEPOINT mypoint;
INSERT INTO member VALUES(6,'야도란','태초마을');
INSERT INTO member VALUES(7,'피존투','태초마을');
INSERT INTO member VALUES(8,'또가스','태초마을');
ROLLBACK TO mypoint;

/* 
SELECT 문의 FOR UPDATE 절 
FOR update는 특정 레코드를 잠금 lock 처리하는 SQL구문
--commit , rollback 잠금해제
*/ 
SELECT employee_id, salary, job_id
FROM employees
WHERE job_id= 'SA_REP'--이 행들에 락이 걸리는 것을 의미, 다른 사용자들이 데이터 수정 방지
FOR UPDATE;\

--commit , rollback
commit;