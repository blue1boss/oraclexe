/* 
파일명: ex01-select.sql

SQL (Structured Query Language) - 구조적 질의 언어 
    관계형 데이터 베이스 시스템에서 자료를 관리 및 처리하기 위하여 설계된 언어 

SELECT  문 
     데이터베이스에서 정보 검색 명령어 

#별표를 해놓으면 주석 영역으로, 프로그래밍을 하는 경우 아무런 영향을 미치지 않음 (여러줄 주석) 
*/

--(한줄 주석을 의미) 
--모든 열 선택 * 
SELECT * 
FROM departments;

--특정 열 선택 (프로젝션 Projection) 
SELECT department_id, location_id
FROM departments;

/* 
산술식 
    산술연산자를 사용하여 숫자/날짜 데이터 표현식 작성 
    +더하기
    -빼기 
    *곱하기 
    /나누기 
    
       
*/
--산술 연산자 사용 (소문자와 대문자 결과는 상관없으나, 미리 메모리에 올려두는 작업이 있긴함)
SELECT LAST_NAME, SALARY, SALARY + 300 
FROM EMPLOYEES;


/* 
연산자 우선순위 
    곱하기와 나누기는 더하기 빼기보다 먼저 수행 
*/

SELECT LAST_NAME, SALARY , 12*SALARY + 100 
FROM EMPLOYEES;

SELECT LAST_NAME, SALARY , 12*(SALARY + 100)
FROM EMPLOYEES;


/*
산술식의 Null 값
    null 값을 포함하는 선술식은 null로 계산 
*/

SELECT LAST_NAME, 12* SALARY * COMMISSION_PCT, SALARY, COMMISSION_PCT
FROM EMPLOYEES;


/* 
열 alias 정의 -별명
    열 머리글의 이름을 바꿉니다. 
    열 이름 바로 뒤에 나옵니다. (열 이름과 alias사이에 선택사항인 as 키워드가 올수 있습니다)
    공백이나 특수 문자를 포함하거나 대소문자를 구분하는 경우 큰 따옴표가 필요합니다. 
*/
SELECT LAST_NAME as NAME, COMMISSION_PCT COMM, SALARY * 10 as 급여10배 
FROM EMPLOYEES;

SELECT LAST_NAME "NAME", SALARY * 12 "ANNUAL SALARY" 
FROM EMPLOYEES;


/* 연결 연산자 
    열이나 문자열을 다른 열에 연결합니다. 
    두개의 세로선 (||)
    결과 열로 문자 표현식을 작성합니다.
    */

SELECT LAST_NAME || JOB_ID as "EMPLOYEES", LAST_NAME, JOB_ID 
FROM EMPLOYEES;

/* 
리터럴 문자열 
    리터럴은 SELECT 문에 포함된 문자, 숫자, 또는 날짜 입니다.
    날짜 및 문자 리더털 값은 작은 따옴표로 묶어야 합니다. 
    각 문자열은 반환되는 각 행에 한번 출력됩니다. '
*/ 

SELECT LAST_NAME || ' is a ' || JOB_ID as "EMPLOYEE DETAILS"
FROM EMPLOYEES;
    
/* 
대체 인용(q) 연산자
    자신의 따옴표 구분자를 지정합니다. 
    구분자를 임의로 선택합니다. 
    가독성 및 사용성의 증가 
    */ 

SELECT DEPARTMENT_NAME || q'[ DEPARTMENT'S MANAGER ID: ]' || MANAGER_ID
AS "DEPARTMENT AND MANAGER"
FROM DEPARTMENTS;

/*SELECT DEPARTMENT_NAME || 'DEPARTMENT'S MANAGER ID:' || MANAGER_ID
AS "DEPARTMENT AND MANAGER"
FROM DEPARTMENTS;
--'s의 경우 따옴표가 1개 더 있어서 문자열이 끝나는 것으로 인식하는 문제가 발생 
*/

/*
중복행 
    기본적으로 Query 결과에는 중복 행을 포함한 모든행이 표시됩니다. 
DISTINCT 
    결과에서 중복행 제거 
    
*/

SELECT DEPARTMENT_ID
FROM EMPLOYEES;

--중복제거 
SELECT DISTINCT DEPARTMENT_ID 
FROM EMPLOYEES;

/* 
table 구조표시 
    DESCRIBE 명령을 사용하여 테이블 구조를 표시합니다. 
*/ 
DESCRIBE EMPLOYEES; 
DESC EMPLOYEES ;