/* 
�Լ� (Function) 
    �Ű������� �޾� Ư�� ���(�۾�)�� �����ϰ� ����� ��ȯ�ϴ� ������ �Ǿ��ִ�. 

�Լ� ���� 
    ������ �Լ� - ������ �Ű������� �޾� ��� �� ��ȯ 
    ������ �Լ� (�׷� �Լ�) -������ �Ű������� �޾� ��� �� ��ȯ 

*/ 

--������ �Լ� 

--��ҹ��� ��ȯ �Լ� 
--LOWER() �Լ� - ���ڿ��� �ҹ��ڷ� ��ȯ

SELECT EMPLOYEE_ID, LAST_NAME, DEPARTMENT_ID
FROM EMPLOYEES
WHERE LAST_NAME ='Higgins';

SELECT EMPLOYEE_ID, LAST_NAME, DEPARTMENT_ID
FROM EMPLOYEES
WHERE LOWER(LAST_NAME) ='higgins';

SELECT*FROM EMPLOYEES;

--upper()�Լ� -���ڿ��� �빮�ڷ� ��ȯ 
SELECT UPPER('higgins') FROM DUAL;
SELECT 12*3 FROM DUAL ; 

--INITCAP()�Լ� - ���ڿ��� ù ���ڸ� �빮�ڷ� ��ȯ 
SELECT EMPLOYEE_ID, LAST_NAME, DEPARTMENT_ID
FROM EMPLOYEES
WHERE LAST_NAME = INITCAP('higgins');


--���� ���� �Լ� 
--CONCAT() �Լ� - 2���� �Ķ���� ���� �����մϴ�. 
SELECT 'HELLO' || 'WORLD' FROM DUAL ;
SELECT CONCAT('HELLO', 'WORLD') FROM DUAL ;

--SUBSTR()- ������ ������ ���ڿ��� �����մϴ�. 
SELECT SUBSTR('HELLOWORLD',1,5)FROM DUAL;

--LENGTH()-���ڿ��� ���̸� ���� ������ ǥ���մϴ�. 
SELECT LENGTH('HELLOWORLD') FROM DUAL; 

--INSTR()- ���ڿ����� ������ ������ ��ġ�� ã���ϴ�. 
SELECT INSTR('HELLOWORLD','W') FROM DUAL;

--LPAD() - ���ʺ��� ���ڽ����� ä�� ǥ������ ��ȯ�մϴ�. 
SELECT LPAD ('salary', 10, '*') FROM DUAL;

--RPAD() -�����ʺ��� ���ڽ����� ä�� ǥ������ ��ȯ�մϴ�. 
SELECT RPAD('SALARY', 10,'*') FROM DUAL;

--REPLACE() - ���ڿ����� ������ ���ڸ� ġȯ�մϴ�. 
SELECT REPLACE('JACK and JUE', 'J', 'BL') FROM DUAL;

--TRIM()-���ڿ����� ���� �Ǵ� ���� ���ڸ� �ڸ��ϴ�. 
SELECT TRIM ('H' FROM 'HelloWorld') FROM DUAL;
SELECT TRIM (' ' FROM ' HelloWorld ') FROM DUAL;

 --�����Լ� --
 --ROUND()-������ �Ҽ��� �ڸ����� ���� �ݿø��մϴ� 
  SELECT ROUND(45.926,2) FROM DUAL;
  
--TRUNC() - ������ �Ҽ��� �ڸ����� ���� �����մϴ�. 
SELECT TRUNC(45.926,2) FROM DUAL;  

--MOD() -���� �������� ��ȯ�մϴ�. 
SELECT MOD(1600, 300) FROM DUAL; 

--CEIL () - �־��� ���ڸ� �ø��Ͽ� ������ ��ȯ�մϴ�. 
SELECT CEIL(45.923) FROM DUAL;

--��¥ �Լ� 

--SYSDATE -���� ��¥�� �ð��� ���� �� �ִ� pseudo- column 
SELECT SYSDATE FROM DUAL;

/*
��¥ ���� 
    ��¥�� ���ڸ� ���ϰų� ���� ��� ��¥ ���� ���մϴ�. 
    �� ��¥ ������ �ϼ��� �˾Ƴ��� ���� ���⿬���� �մϴ�. 
    
    */
SELECT LAST_NAME, (SYSDATE -HIRE_DATE)/ 7 AS WEEKS 
FROM EMPLOYEES
WHERE DEPARTMENT_ID= 90;

/* 
��¥ ���� �Լ� 
    MONTHS_BETWEEN(date1, date2) : �� ��¥ ���� �� ���� ����մϴ�. 
    ADD_MONTHS (date1, n) : ��¥�� n ������ �߰��մϴ�. 
    NEXT_DAY(date, day_of_week) : ������ ��¥�� �������� �־��� ������ ������ ��¥�� ����մϴ�. 
                                (1: �Ͽ��� ~7: �����) 
    LAST_DAY(date) : �־��� ���� ������ ��¥�� ��ȯ�մϴ�. 
    ROUND(date, format) : ��¥�� ������ �������� �ݿø��մϴ�. 
    TRUNC(date, format) : ��¥�� ������ �������� �����մϴ�. 
    */ 

SELECT MONTHS_BETWEEN(TO_DATE('2017-12-22', 'YYYY-MM-DD'), TO_DATE('2017-05-22', 'YYYY-MM-DD'))FROM DUAL;
SELECT ADD_MONTHS(TO_DATE('2022-12-16', 'YYYY-MM-DD'),1) FROM DUAL;
SELECT NEXT_DAY(TO_DATE('2023-08-05', 'YYYY-MM-DD'), 1) FROM DUAL;
SELECT NEXT_DAY(TO_DATE('2023-08-05', 'YYYY-MM-DD'), 7) FROM DUAL;
SELECT LAST_DAY(TO_DATE('2023-08-05', 'YYYY-MM-DD')) FROM DUAL;
--SELECT LAST_DAY(SYSDATE)FROM DUAL;����  TO DATE �͵� �����ϴ�. 
-- �ݿø� SELECT ROUND(SYSDATE,'MONTH') FROM DUAL;
-- 16�Ϻ��� �ø����� �������� �Ѿ�� ���� : SELECT ROUND(TO_DATE('2023-08-16', 'YYYY-MM-DD'),'MONTH') FROM DUAL;
SELECT TRUNC(SYSDATE, 'MONTH') FROM DUAL;

--��ȯ �Լ� 
/*
--TO_CHAR() �Լ� - ��¥ �Ǵ� ���ڸ� ���ڿ��� ��ȯ

    YYYY- ��ü ������ ���ڷ� ��Ÿ���ϴ�. 
    YEAR- ���� ö�ڷ� ǥ��� ������ ��ȯ�մϴ�. 
    MM- ���� 2�ڸ� ���� ���� ��ȯ�մϴ�. 
    MONTH- ��ü �� �̸��� ��ȯ�մϴ�. 
    MON - ���� 3�ڸ� �� ��ȯ�մϴ�. 
    DY- 3�ڸ� ���� �� ��ȯ�մϴ�. 
    DAY-������ ��ü �̸��� ��ȯ�մϴ�. 
    DD-���� ��(1-31)�� ���� �������� ��ȯ�մϴ�. 
    HH, HH12, HH24, - 1�ϵ��� �ð� �Ǵ� ���Ͻð�(1-12) �Ǵ� ���� �ð� (0-23)�� ��ȯ�մϴ�. 
    MI- ��(0-59) �� ��ȯ�մϴ�. 
    SS- ��(0-59) �� ��ȯ�մϴ�. 
    FF-�и������� (0-999)�� ��ȯ�մϴ�. 
    AM �Ǵ� PM -���� /���ĸ� ��Ÿ���� �ڿ��� ǥ�� ��ȯ�մϴ�. 
    A.M. �Ǵ�  P.M.- ���� /���ĸ� ��Ÿ���� ��ħǥ�� �ִ� �ڿ��� ǥ�ø� ��ȯ�մϴ�. 

*/ 
SELECT LAST_NAME, TO_CHAR(hire_date, 'YYYY/MM/DD HH24: MI : ss') AS HIREDATE
FROM EMPLOYEES;

--TIMESTAMP -��¥ ���� + �и���������� 
SELECT TO_CHAR(SYSTIMESTAMP, 'YYYY/MM/DD HH24:MI: ss.FF2') FROM DUAL;

/*TO CHAR()�Լ��� ���ڿ� ����� �� 
    9-���ڷ� ��Ÿ���ϴ�. 
    0-0�� ǥ�õǵ��� ������ �����մϴ�. 
    $- �ε� �޷� ��ȣ�� ��ġ�մϴ�. 
    L- �ε� ���� ��ȭ ��ȣ�� ����մϴ�. 
    . - �Ҽ����� ����մϴ�. 
    , -õ���� ǥ���ڷ� ��ǥ�� ����դ���. 
*/
SELECT TO_CHAR(salary, 'L99,999.00') SALARY 
FROM EMPLOYEES
WHERE LAST_NAME ='Ernst';

--TO_DATE () �Լ� -���ڿ� DATE Ÿ������ ��ȯ
SELECT LAST_NAME, TO_CHAR(hire_date, 'YYYY-MM-DD')
FROM EMPLOYEES
WHERE hire_date < TO_DATE('2005-01-01','YYYY-MM-DD');\

/* �Լ� ��ø
    ���� �� �Լ��� ��� �����ε� ��ø�� �� �ֽ��ϴ�. 
    ��ø�� �Լ��� ���� ���� �������� ���� ���� ������ �򰡵˴ϴ�. 
    */
SELECT LAST_NAME, UPPER(CONCAT(SUBSTR(LAST_NAME, 1,8), '_US'))
FROM EMPLOYEES
WHERE DEPARTMENT_ID= 60;
--CONCT �տ��� 8���� �ڸ��� US�� �ٿ��ش� --UPPER �빮�ڷ� �ٲپ��ִ� �������� 

--NVL() �Լ� : null���� ���� ������ ������ ��ȯ�մϴ�. (null�� ������ �ȵ� �� ���) 
--null�� ���� ���� 0���� �ٸ� ��(0�� ���� ����) 

SELECT LAST_NAME , SALARY, NVL(commission_pct,0), 
    (salary *12) + (salary *12 *NVL(commission_pct,0)) AS AN_SAL
FROM EMPLOYEES;
--����* 12 + ������ commission ratio�� ������ ����
--NVL: replace null with 0 

SELECT LAST_NAME , SALARY, NVL(commission_pct,0), (salary*12) AS Y_SAL,
    (salary *12) + (salary *12 *NVL(commission_pct,0)) AS AN_SAL
FROM EMPLOYEES;

--NVL2() �Լ� 
--ù��° ǥ������ �˻��մϴ�. ù��° ǥ������ null�� �ƴϸ� �ι��� ǥ������ ��ȯ�մϴ�. 
--ù���� ǥ������ null�̸� ����° ǥ������ ��ȯ�˴ϴ�. 
SELECT LAST_NAME, SALARY, COMMISSION_PCT, 
    NVL2(COMMISSION_PCT, 'SAL+COMM', 'SAL') AS INCOME
FROM EMPLOYEES
WHERE DEPARTMENT_ID IN (50,80);
--null.�� �� ������� SAL�� ������, commission�� ������ sal+comm ���� � �޿��������� Ȯ�� ǥ�� 

--NULLIF()�Լ� 
--�� ǥ������ ���ϰ� ������ null�� ��ȯ�ϰ� �ٸ��� expr1�� ��ȯ�մϴ�. 
--�׷��� expr1�� ���� ���ͷ� NULL�� ������ �� �����ϴ�. 
SELECT FIRST_NAME, LENGTH(FIRST_NAME) AS expr1, 
    LAST_NAME, LENGTH(LAST_NAME) AS expr2,
    NULLIF(LENGTH(FIRST_NAME), LENGTH(LAST_NAME))AS result
FROM EMPLOYEES;

--COALESCE() �Լ� 
--����Ʈ���� null�� �ƴ� ù��° ǥ������ ��ȯ�մϴ�. 
SELECT LAST_NAME, EMPLOYEE_ID, 
    COALESCE(TO_CHAR(commission_pct), TO_CHAR(MANAGER_ID),'NO COMMISSION AND NO MANAGER')
FROM EMPLOYEES;
--1���� null�̸� null�� �ƴҶ����� �Ÿ��� 1���� ǥ���� �ش� 

-- ���Ǻ� ǥ����
/* CASE  �� 
    IF-THEN -ELSE �� �۾��� �����Ͽ� ���Ǻ� ��ȸ�� ���ϰ� �����ϵ��� �մϴ�. 
*/
SELECT LAST_NAME, JOB_ID, SALARY, 
    CASE JOB_ID
        WHEN 'IT_PROG'THEN 1.10 * SALARY 
        WHEN 'ST_CLERK'THEN 1.15 * SALARY 
        WHEN 'SA_REP'THEN 1.20 * SALARY 
        ELSE SALARY 
    END AS REVISED_SALARY 
FROM EMPLOYEES;
--new column name -> revised salary  �� ����� �۾� end

--DECODE()�Լ� 
--CASE�İ� ������ �۾��� �����մϴ�. 
SELECT LAST_NAME, JOB_ID, SALARY,
    DECODE(JOB_ID, 'IT_PROG',  1.10 * SALARY, 
                'ST_CLERK',  1.15* SALARY,
                'SA_REP', 1.20 * SALARY ,
                salary ) AS REVISED_SALARY 
FROM EMPLOYEES;


















