/* 
������ ����Ͽ� �� ���� 
    WHERE ���� ����Ͽ� ��ȯ�Ǵ� ���� �����մϴ�. 
    
WHERE 
    ������ �����ϴ� ������ query �� �����մϴ�. 
    
    ������ ��� 
    -���̸� 
    -�� ���� 
    -�� �̸�, ��� �Ǵ� �� ����Ʈ 

*/ 
--WHERE �� ��� 
SELECT EMPLOYEE_ID, LAST_NAME, JOB_ID, DEPARTMENT_ID 
FROM EMPLOYEES
WHERE DEPARTMENT_ID = 90;

/*
���ڿ� �� ��¥ 
    ���ڿ� �� ��¥ ���� ���� ����ǥ�� �����ϴ�. 
    ���� ���� ��ҹ��ڸ� �����ϰ� ��¥ ���� ������ �����մϴ�. 
    */

SELECT LAST_NAME, JOB_ID, DEPARTMENT_ID 
FROM EMPLOYEES
WHERE LAST_NAME ='Whalen';

SELECT LAST_NAME, HIRE_DATE
FROM EMPLOYEES 
WHERE HIRE_DATE = '03/06/17';

--SELECT *FROM EMPLOYEES ;
--�⺻ ��¥ ǥ�������� DD-MM-RR

/* 
�� ������ 
    Ư�� ǥ������ �ٸ� ���̳� ǥ���İ� ���ϴ� ���ǿ��� ���ȴ�. 
    
    =����
    >���� ŭ 
    >= ���� ũ�ų� ���� 
    <���� ���� 
    <= ���� �۰ų� ���� 
    <> ���� ���� 
    BETWEEN ...AND ... �� �� ����(��谪 ����) 
    IN(set)            �� ����Ʈ �� ��ġ�ϴ� �� �˻� 
    LIKE               ��ġ�ϴ� ���� ���� �˻�
    IS NULL            NULL ������ ���� 

*/
--�� ������ ��� 
SELECT LAST_NAME , SALARY 
FROM EMPLOYEES 
WHERE SALARY <= 3000; 
 

--Between �����ڸ� ����ϴ� �������� 
SELECT LAST_NAME, SALARY
FROM EMPLOYEES
WHERE SALARY BETWEEN 2500 AND 3500;

SELECT LAST_NAME, SALARY
FROM EMPLOYEES
WHERE SALARY >= 2500
AND SALARY <=3500 ;

--IN �����ڸ� ����ϴ� ��� ���� (�ϳ��� �����Ǵ� ���̵� ��ȣ�� ����) 
SELECT EMPLOYEE_ID, LAST_NAME, SALARY, MANAGER_ID
FROM EMPLOYEES
WHERE MANAGER_ID IN (100, 101, 201) ;

SELECT EMPLOYEE_ID, LAST_NAME, SALARY, MANAGER_ID
FROM EMPLOYEES
WHERE MANAGER_ID = 100 
OR MANAGER_ID= 101
OR MANAGER_ID = 201 ;

/* 
LIKE �����ڸ� ����Ͽ� ���� ��ġ 
    LIKE �����ڸ� ����Ͽ� ��ȿ�� �˻� ���ڿ� ���� ��ü ���� �˻��� �����մϴ�. 
    �˻� ���ǿ��� ���ͷ� ���ڳ� ���ڰ� ���Ե� �� �ֽ��ϴ�. 
    -% : 0�� �̻��� ���ڸ� ��Ÿ���ϴ�. 
    -_: �� ���ڸ� ��Ÿ���ϴ�. 
*/

SELECT FIRST_NAME
FROM EMPLOYEES
WHERE FIRST_NAME LIKE 'A%' ;

--�빮�� ���� ���� (2��° ���ڰ� O�� ����� �̸� ����) 
SELECT LAST_NAME 
FROM EMPLOYEES 
WHERE LAST_NAME LIKE '_o%';

--ESCAPE �ĺ��� (\_�� ���� �Ǹ� �����ϰ� 'SA_'�� ���̴´�� ����Ʈ�ϰ� ���� +�Ʒ� ������� _�� ���� ����)
SELECT EMPLOYEE_ID, LAST_NAME, JOB_ID 
FROM EMPLOYEES
WHERE JOB_ID LIKE '%SA\_%' ESCAPE '\';

/* 
NULL ���� ��� 
    IS NULL �����ڷ� NULL �� �׽�Ʈ�մϴ�. 
    */ 

SELECT LAST_NAME, MANAGER_ID 
FROM EMPLOYEES 
WHERE MANAGER_ID IS NULL;

/*
�� �����ڸ� ����Ͽ� �������� 
    AND : ���� ��� ������ ��� ���� ��� TRUE ��ȯ
    OR: ���� ��� ���� �� �ϳ��� ���� ���  TRUE ��ȯ 
    NOT: ������ ������ ��� TRUE�� ��ȯ 

*/ 

--AND ������ ��� 
SELECT EMPLOYEE_ID, LAST_NAME, JOB_ID, SALARY 
FROM EMPLOYEES 
WHERE SALARY >=10000
AND JOB_ID LIKE '%MAN%';

--OR ������ ��� 
SELECT EMPLOYEE_ID, LAST_NAME, JOB_ID, SALARY
FROM EMPLOYEES
WHERE SALARY >=10000 
OR JOB_ID LIKE '%MAN%';

--NOT ������ ��� 
SELECT LAST_NAME, JOB_ID 
FROM EMPLOYEES 
WHERE JOB_ID NOT IN ('IT_PROG', 'ST_CLERK','SA_REP');


