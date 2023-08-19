/*
PL/SQL(Procedual Lanaguage extension to SQL) 
    SQL을 확장한 절차적 언어입니다. 
    여러 SQL를 하나의 블록(block)으로 구성하여 SQL제어 할 수 있습니다. 
프로시저 (procedure) 
    데이터베이스에서 실행가능한 하나이상의 SQL문을 묶어서 하나의 
    논리적 작업단위로 만든 데이터베이스 객체입니다. 
*/ 

/*
익명 프로시저--1회용 프로시저 DB에 저장되지 않음  
[기본구조]
    DECLARE -- 변수정의 
    BEGIN -- 처리로직 시작
    EXCEPTION --예외처리 
    END -- 처리로직 종료 
    
*/
--실행결과 출력하도록 설정 
SET SERVEROUTPUT ON;

--스크립트 경과 시간을 출력하도록 설정 
SET TIMING ON;
DECLARE--변수 정의 1영역
    V_STRD_DT       VARCHAR2(8);
    V_STRD_DEPTNO   NUMBER;
    V_DEPTNO        NUMBER;
    V_DNAME         VARCHAR2(50);
    V_LOC        VARCHAR2(50);
    V_RESULT_MSG        VARCHAR2(500)DEFAULT 'SUCCESS';
    
BEGIN--로직 시작 2영역 실질시작
    V_STRD_DT: = TO_CHAR(SYSDATE, 'YYYYMMDD'); --현재 연월일
    V_STRD_DEPTNO : = 10; --10값을 넣어둠
    
    SELECT t1.department_id
        ,t1.department_name
        ,t1.location_id
    INTO V_DEPTNO  --요 3개로 변수에다 넣어주겠다 
    , V_DNAME
    , V_LOC 
    FROM departments t1
    WHERE t1.department_id= V_STRD_DEPTNO; --부서번호 10번에 대한 조회 
    --조회결과 변수 설정
    V_RESULT_MSG := 'RESULT >DEPTNO' ||V_DEPTNO||', DNAME='||V_NAME||', LOC='||V_LOC; --연결한 문자를
    --조회결과 변수 출력
    DBMS_OUTPUT.PUT_LINE( VRESULT_MSG);
EXCEPTION--예외처리 
    WHEN VALUE_ERROR THEN 
        V_RESULT_MSG : = 'SQLCODE['||SQLCODE||'], VALUE_ERROR_MESSAGE => '||SQLERRM;
        DBMS_OUTPUT.PUT_LINE( VRESULT_MSG);
END;
/
/--작업종료 3영역


/* 프로시저 
[기본구조[
CREATE OR REPLKACE PROCEDURE 프로시져 이름(파라미터1, 파라미터2...) 
 IS [AS]
    [선언부]
BEGIN
    [실행부]
  [exception]
    [exception처리]
 END; 
 
 */ 
 CREATE OR REPLACE PROCEDURE print_hello_proc--매개변수 없음 () 생략 가능
    IS --프로시저 시작
        msg VARCHAR2(20) :='hello world'; --변수 초기값 선언
    BEGIN--실행문 시작
        DBMS_OUTPUT.PUT_LINE(msg);
    END; 
    /
    
EXEC print_hello_proc;

/* 
IN 매개변수
    값이 프로시져 안으로 들어감 
*/
CREATE TABLE emp2 AS
SELECT employee_id empno, last_name name, salary, department_id depno
FROM employees;


SELECT * FROM emp2;

CREATE OR REPLACE PROCEDURE update_emp_salary_proc(eno IN NUMBER)
    IS
    BEGIN
        UPDATE emp2 SET
        salary =salary *1.1
        WHERE empno = eno;
        COMMIT;
    END;
/
        
SELECT * FROM emp2
WHERE empno =115;

EXEC update_emp_salary_proc(115);

SELECT * FROM employees;

/* 
OUT 매개변수
    프로시저의 반환값이 없으므로 OUT 매개변수로 값을 받을 수 있다 
    참조형 매개변수와 비슷

*/ 
CREATE OR REPLACE PROCEDURE find_emp_proc(v_eno IN NUMBER, 
    v_fname OUT NVARCHAR2, v_lname OUT NVARCHAR2, v_sal OUT NUMBER)
IS 
    BEGIN 
        SELECT first_name, last_name, salary
        INTO v_fname, v_lname, v_sal 
        FROM employees WHERE employee_id = v_eno;
    END;
/
---VARCHAR2 (바이트) NVARCHAR2(문자길이) 차이점이 있음 
VARIABLE v_fname NVARCHAR2(25); --변수 3개 만듬 
VARIABLE v_lname NVARCHAR2(25);
VARIABLE v_sal NUMBER;

EXECUTE find_emp_proc (115,:v_fname,:v_lname, :v_sal);--각 3개의 항목에 주소값이 들어감 veno는 115
PRINT v_fname;--alexander
PRINT v_lname;--Khoo
PRINT v_sal;--3100

/* 
IN OUT 매개변수 
    IN Out 동시에 사용할 수 있는 매개변수입니다. 
*/ 

CREATE OR REPLACE PROCEDURE find_sal(v_io IN OUT NUMBER)
IS 
    BEGIN 
    SELECT salary 
    INTO v_io 
    FROM employees WHERE employee_id= v_io;
    END;
/

DECLARE 
    v_io NUMBER := 115; --vio 가
    BEGIN 
    DBMS_OUTPUT .PUT_LINE('eno='||v_io);
    find_sal(v_io);
    DBMS_OUTPUT .PUT_LINE('salary='||v_io);
    END;
/

VAR v_io NUMBER;
EXEC :v_io :=115;
PRINT v_io;
EXEC find_sal(:v_io);
PRINT v_io;

/*
함수(Function) 
    특정 기능들을 모듈화, 재사용할 수 있게 복잡한 쿼리문을 간결하게 만들수 있습니다. 
    
[기본구조] 
CREATE OR REPLACE FUNCTION function_name (파라미터1, 파라미터2...) 
RETUN datatype --반환되는 값의 유형 
    IS[AS]--선언부 
    BEGIN 
        [실행부 -PL/SQL 블럭] 
    [EXCEPTION]
        [EXCEPTION 처리]
    RETURN 변수;
    END;
/
*/ 
CREATE OR REPLACE FUNCTION fn_get_dept_name(p_dept_no NUMBER) 
RETURN VARCHAR2
    IS
        V_TEST_NAME VARCHAR2(30);
    BEGIN 
        SELECT department_name 
        INTO  V_TEST_NAME
        FROM  departments
        WHERE department_id = p_dept_no;
        
    RETURN V_TEST_NAME;
    END;
/ 

SELECT fn_get_dept_name(10) FROM dual;--10번이 번호인 department를 구해라 