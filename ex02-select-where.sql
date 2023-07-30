/* 
선택을 사용하여 행 제한 
    WHERE 절을 사용하여 반환되는 행을 제한합니다. 
    
WHERE 
    조건을 충족하는 행으로 query 를 제한합니다. 
    
    세가지 요소 
    -열이름 
    -비교 조건 
    -열 이름, 상수 또는 값 리스트 

*/ 
--WHERE 절 사용 
SELECT EMPLOYEE_ID, LAST_NAME, JOB_ID, DEPARTMENT_ID 
FROM EMPLOYEES
WHERE DEPARTMENT_ID = 90;

/*
문자열 및 날짜 
    문자열 및 날짜 값은 작은 따옴표로 묶습니다. 
    문자 값은 대소문자를 구분하고 날짜 값은 형식을 구분합니다. 
    */

SELECT LAST_NAME, JOB_ID, DEPARTMENT_ID 
FROM EMPLOYEES
WHERE LAST_NAME ='Whalen';

SELECT LAST_NAME, HIRE_DATE
FROM EMPLOYEES 
WHERE HIRE_DATE = '03/06/17';

--SELECT *FROM EMPLOYEES ;
--기본 날짜 표시형식은 DD-MM-RR

/* 
비교 연산자 
    특정 표현식을 다른 값이나 표현식과 비교하는 조건에서 사용된다. 
    
    =같음
    >보다 큼 
    >= 보다 크거나 같음 
    <보다 작음 
    <= 보다 작거나 같음 
    <> 같지 않음 
    BETWEEN ...AND ... 두 값 사이(경계값 포함) 
    IN(set)            값 리스트 중 일치하는 값 검색 
    LIKE               일치하는 문자 패턴 검색
    IS NULL            NULL 값인지 여부 

*/
--비교 연산자 사용 
SELECT LAST_NAME , SALARY 
FROM EMPLOYEES 
WHERE SALARY <= 3000; 
 

--Between 연산자를 사용하는 범위조건 
SELECT LAST_NAME, SALARY
FROM EMPLOYEES
WHERE SALARY BETWEEN 2500 AND 3500;

SELECT LAST_NAME, SALARY
FROM EMPLOYEES
WHERE SALARY >= 2500
AND SALARY <=3500 ;

--IN 연산자를 사용하는 멤버 조건 (하나라도 성립되는 아이디 번호를 도출) 
SELECT EMPLOYEE_ID, LAST_NAME, SALARY, MANAGER_ID
FROM EMPLOYEES
WHERE MANAGER_ID IN (100, 101, 201) ;

SELECT EMPLOYEE_ID, LAST_NAME, SALARY, MANAGER_ID
FROM EMPLOYEES
WHERE MANAGER_ID = 100 
OR MANAGER_ID= 101
OR MANAGER_ID = 201 ;

/* 
LIKE 연산자를 사용하여 패턴 일치 
    LIKE 연산자를 사용하여 유효한 검색 문자열 값의 대체 문자 검색을 수행합니다. 
    검색 조건에는 리터럴 문자나 숫자가 포함될 수 있습니다. 
    -% : 0개 이상의 문자를 나타냅니다. 
    -_: 한 문자를 나타냅니다. 
*/

SELECT FIRST_NAME
FROM EMPLOYEES
WHERE FIRST_NAME LIKE 'A%' ;

--대문자 문자 결합 (2번째 글자가 O인 사람의 이름 도출) 
SELECT LAST_NAME 
FROM EMPLOYEES 
WHERE LAST_NAME LIKE '_o%';

--ESCAPE 식별자 (\_가 들어가게 되면 순수하게 'SA_'를 보이는대로 프린트하고 싶음 +아래 결과에는 _가 본래 있음)
SELECT EMPLOYEE_ID, LAST_NAME, JOB_ID 
FROM EMPLOYEES
WHERE JOB_ID LIKE '%SA\_%' ESCAPE '\';

/* 
NULL 조건 사용 
    IS NULL 연산자로 NULL 을 테스트합니다. 
    */ 

SELECT LAST_NAME, MANAGER_ID 
FROM EMPLOYEES 
WHERE MANAGER_ID IS NULL;

/*
논리 연산자를 사용하여 조건정의 
    AND : 구성 요소 조건이 모두 참인 경우 TRUE 반환
    OR: 구성 요소 조건 중 하나가 참인 경우  TRUE 반환 
    NOT: 조건이 거짓인 경우 TRUE를 반환 

*/ 

--AND 연산자 사용 
SELECT EMPLOYEE_ID, LAST_NAME, JOB_ID, SALARY 
FROM EMPLOYEES 
WHERE SALARY >=10000
AND JOB_ID LIKE '%MAN%';

--OR 연산자 사용 
SELECT EMPLOYEE_ID, LAST_NAME, JOB_ID, SALARY
FROM EMPLOYEES
WHERE SALARY >=10000 
OR JOB_ID LIKE '%MAN%';

--NOT 연산자 사용 
SELECT LAST_NAME, JOB_ID 
FROM EMPLOYEES 
WHERE JOB_ID NOT IN ('IT_PROG', 'ST_CLERK','SA_REP');


