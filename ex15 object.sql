/*
데이터베이스 객체 
    테이블 : 기본 저장단위이며 행으로 구성되어 있습니다. 
    뷰 : 하나 이상의 테이블에 있는 데이터의 부분 집합을 논리적으로 나타냅니다. (가상 테이블) 
    시퀀스 : 일련의 숫자를 자동으로 생성해주는 객체입니다. 
    인덱스 : 테이블의 데이터에 대한 빠른 검색을 지우너해주는 색인 객체입니다
    동의어 : 객체에 다른 이름을 부여합니다. 
*/ 

--뷰 생성 
CREATE VIEW empvu80
AS SELECT employee_id, last_name, salary
    FROM employees
    WHERE department_id = 80;--부서번로 80번에 대한 가상의

DESC empvu80;

SELECT * FROM empvu80;

--alias 사용 뷰 생성 
CREATE VIEW salvu50
AS SELECT employee_id AS ID_NUMBER, last_name name, salary*12 ANN_SALARY --사이 사이 as 넣어도 생략도 됨
    FROM employees
    WHERE department_id =50;
    
SELECT *FROM salvu50
WHERE ANN_SALARY >= 50000;

--뷰 수정
SELECT * FROM empvu80;

CREATE OR REPLACE VIEW empvu80
    (id_number, name, sal, department_id)
AS SELECT employee_id, first_name || ' ' || last_name, salary, department_id
    FROM employees
    WHERE department_id = 80;
    
UPDATE empvu80 SET
department_id = 90 
WHERE id_number = 145;

ROLLBACK;

SELECT *FROM employees
WHERE employee_id= 145; --view 에서의 수정은 원본에 영향을 줌 

/* 복합 뷰 생성
    두개 이상 기본테이블에 의해 정의된 뷰 
*/
CREATE OR REPLACE VIEW dept_sum_vu
    (name, minsal, maxsal, avgsal) 
AS SELECT d.department_name, MIN(e.salary), 
        MAX(e.salary), AVG(e.salary) 
    FROM employees e JOIN departments d 
    ON e.department_id = d.department_id 
    GROUP BY d.department_name;

SELECT * FROM dept_sum_vu;

/*
뷰 DML 작업 수행 규칙 
    1. 행 제거할 수 없는 경우 
        -그룹 함수 
        -GROUP BY 절 
        -DISTINCT 키워드 
        -Pseudocolumn ROWNUM 키워드 
    2. 뷰의 데이터를 수정할 수 없는 경우 
        -그룹 함수 
        -GROUP BY 절 
        -DISTINCT 키워드 
        -Pseudocolumn ROWNUM 키워드 
        -표현식으로 정의되는 열
    3. 뷰를 통해 데이터를 추가할 수 없는 경우 
        -그룹 함수 
        -GROUP BY 절 
        -DISTINCT 키워드 
        -Pseudocolumn ROWNUM 키워드 (가상의 column , ROWNUM 쿼리의 결과의 각행에 순차적인 번호를 할당해준다)  
        -표현식으로 정의되는 열
        -뷰에서 선택되지 않은 기본 테이블의 NOT NULL 열 
*/

--ROWNUM 예제
SELECT ROWNUM, employee_id, last_name
FROM employees
WHERE department_id = 80;

--DML 작업거부 
CREATE OR REPLACE VIEW empvu10
    (employee_number, employee_name, job_title) 
AS SELECT employee_id, last_name, job_id
    FROM employees 
    WHERE department_id = 10 
    WITH READ ONLY;
    
SELECT * FROM empvu10;

UPDATE empvu10 SET 
employee_name = 'Whalen1'
WHERE employee_number = 200;

/* 
WITH CHECK OPTION 
    뷰에 대한 데이터 변경작업 제한 
*/ 

CREATE OR REPLACE VIEW high_salary_employee_vu
AS SELECT* FROM employees 
WHERE salary >10000
WITH CHECK OPTION CONSTRAINT high_salary_employee_ck;

SELECT * FROM high_salary_employee_vu;

--뷰의 with check option의 조건에 위배됩니다. 
UPDATE high_salary_employee_vu SET
salary= 2400
WHERE employee_id = 100; --조건에 맞지 않게 수정하지 않아야 함

UPDATE high_salary_employee_vu SET
salary= 26000
WHERE employee_id = 100;--조건에 위배되지 않으므로 수정이 가능함 


--뷰 제거 
DROP VIEW high_salary_employee_vu;


/* 
시퀀스(Sequence) 
    연속적인 숫자 값을 자동으로 증감 시켜서 값을 리턴하는 객체입니다. 
    채번하는 경우에 많이 사용 
*/
CREATE SEQUENCE my_seq
        INCREMENT BY 1 --증가값(1씩 증가) 
        START WITH 1 --시작값 (1부터 시작) 
        MINVALUE 1 --최소값
        MAXVALUE 99999999 --최대값 
        NOCYCLE --최대값 도달시 시작부터 반복하지 않음 
        CACHE 20 --미리 번호를 메모리에 생성 
        ORDER;--요청 순서대로 값을 생성 

SELECT my_seq.NEXTVAL FROM dual;
--실행할때마다 증가하는 형태를 보임

--현재시퀀스 값 확인
SELECT my_seq.CURRVAL FROM dual;

DROP SEQUENCE my_seq;

SELECT * FROM dept3;

CREATE SEQUENCE my_seq
        INCREMENT BY 1 
        START WITH 1 
        MINVALUE 1 
        MAXVALUE 99999999
        NOCYCLE
        CACHE 20 
        ORDER;
--dept3이 없다면 : CREATE TABLE dept3 AS SELECT *FROM dept WHERE1=2; 
INSERT INTO dept3 VALUES(my_seq.NEXTVAL, 'A' , 1 , SYSDATE);
INSERT INTO dept3 VALUES(my_seq.NEXTVAL, 'B' , 2 , SYSDATE);
INSERT INTO dept3 VALUES(my_seq.NEXTVAL, 'C' , 3, SYSDATE);
SELECT * FROM dept3;


/* 
인덱스 (INDEX)
    데이터베이스에서 데이터를 빠르게 검색하기 위해 특정 열(또는 열의 조합)을 
    정렬하여 저장하는 구조로, 데이터 조회 성능을 향상시키는데 사용됩니다. 
    
    PK는 테이블 생성시 자동으로 인덱스 생성이 됩니다. 
    */ 

SELECT * FROM employees
WHERE last_name = 'King';  

SELECT last_name, ROWID FROM employees--실제 저장된 곳의 위치정보 
ORDER BY last_name;

--EMPLOYEES테이블의 LAST_NAME 열에 대한 인덱스 생성
CREATE INDEX emp_last_name_idx
    ON employees(last_name);
    

--인덱스 제거 
DROP INDEX emp_last_name_idx;

/*
동의어 (SYNONYM) 
    동의어를 생성하여 객체에 대체 이름을 부여할 수 있습니다. 
    */
--동의어 생성
CREATE SYNONYM d_sum
FOR dept_sum_vu;

SELECT * FROM dept_sum_vu;
SELECT * FROM d_sum;

--동의어 제거
DROP SYNONYM d_sum;

/*
ROWID: ROW고유의 아이디
        데이터베이스 내부에서 행의 물리적 위치를 나타냅니다. 
        
ROWNUM: 쿼리의 결과의 각 행에 순차적인 번호를 할당해준다 

*/
SELECT ROWNUM, ROWID, employee_id, last_name, salary
FROM employees;
