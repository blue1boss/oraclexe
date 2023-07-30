/* 
���ϸ�: ex01-select.sql

SQL (Structured Query Language) - ������ ���� ��� 
    ������ ������ ���̽� �ý��ۿ��� �ڷḦ ���� �� ó���ϱ� ���Ͽ� ����� ��� 

SELECT  �� 
     �����ͺ��̽����� ���� �˻� ��ɾ� 

#��ǥ�� �س����� �ּ� ��������, ���α׷����� �ϴ� ��� �ƹ��� ������ ��ġ�� ���� (������ �ּ�) 
*/

--(���� �ּ��� �ǹ�) 
--��� �� ���� * 
SELECT * 
FROM departments;

--Ư�� �� ���� (�������� Projection) 
SELECT department_id, location_id
FROM departments;

/* 
����� 
    ��������ڸ� ����Ͽ� ����/��¥ ������ ǥ���� �ۼ� 
    +���ϱ�
    -���� 
    *���ϱ� 
    /������ 
    
       
*/
--��� ������ ��� (�ҹ��ڿ� �빮�� ����� ���������, �̸� �޸𸮿� �÷��δ� �۾��� �ֱ���)
SELECT LAST_NAME, SALARY, SALARY + 300 
FROM EMPLOYEES;


/* 
������ �켱���� 
    ���ϱ�� ������� ���ϱ� ���⺸�� ���� ���� 
*/

SELECT LAST_NAME, SALARY , 12*SALARY + 100 
FROM EMPLOYEES;

SELECT LAST_NAME, SALARY , 12*(SALARY + 100)
FROM EMPLOYEES;


/*
������� Null ��
    null ���� �����ϴ� �������� null�� ��� 
*/

SELECT LAST_NAME, 12* SALARY * COMMISSION_PCT, SALARY, COMMISSION_PCT
FROM EMPLOYEES;


/* 
�� alias ���� -����
    �� �Ӹ����� �̸��� �ٲߴϴ�. 
    �� �̸� �ٷ� �ڿ� ���ɴϴ�. (�� �̸��� alias���̿� ���û����� as Ű���尡 �ü� �ֽ��ϴ�)
    �����̳� Ư�� ���ڸ� �����ϰų� ��ҹ��ڸ� �����ϴ� ��� ū ����ǥ�� �ʿ��մϴ�. 
*/
SELECT LAST_NAME as NAME, COMMISSION_PCT COMM, SALARY * 10 as �޿�10�� 
FROM EMPLOYEES;

SELECT LAST_NAME "NAME", SALARY * 12 "ANNUAL SALARY" 
FROM EMPLOYEES;


/* ���� ������ 
    ���̳� ���ڿ��� �ٸ� ���� �����մϴ�. 
    �ΰ��� ���μ� (||)
    ��� ���� ���� ǥ������ �ۼ��մϴ�.
    */

SELECT LAST_NAME || JOB_ID as "EMPLOYEES", LAST_NAME, JOB_ID 
FROM EMPLOYEES;

/* 
���ͷ� ���ڿ� 
    ���ͷ��� SELECT ���� ���Ե� ����, ����, �Ǵ� ��¥ �Դϴ�.
    ��¥ �� ���� ������ ���� ���� ����ǥ�� ����� �մϴ�. 
    �� ���ڿ��� ��ȯ�Ǵ� �� �࿡ �ѹ� ��µ˴ϴ�. '
*/ 

SELECT LAST_NAME || ' is a ' || JOB_ID as "EMPLOYEE DETAILS"
FROM EMPLOYEES;
    
/* 
��ü �ο�(q) ������
    �ڽ��� ����ǥ �����ڸ� �����մϴ�. 
    �����ڸ� ���Ƿ� �����մϴ�. 
    ������ �� ��뼺�� ���� 
    */ 

SELECT DEPARTMENT_NAME || q'[ DEPARTMENT'S MANAGER ID: ]' || MANAGER_ID
AS "DEPARTMENT AND MANAGER"
FROM DEPARTMENTS;

/*SELECT DEPARTMENT_NAME || 'DEPARTMENT'S MANAGER ID:' || MANAGER_ID
AS "DEPARTMENT AND MANAGER"
FROM DEPARTMENTS;
--'s�� ��� ����ǥ�� 1�� �� �־ ���ڿ��� ������ ������ �ν��ϴ� ������ �߻� 
*/

/*
�ߺ��� 
    �⺻������ Query ������� �ߺ� ���� ������ ������� ǥ�õ˴ϴ�. 
DISTINCT 
    ������� �ߺ��� ���� 
    
*/

SELECT DEPARTMENT_ID
FROM EMPLOYEES;

--�ߺ����� 
SELECT DISTINCT DEPARTMENT_ID 
FROM EMPLOYEES;

/* 
table ����ǥ�� 
    DESCRIBE ����� ����Ͽ� ���̺� ������ ǥ���մϴ�. 
*/ 
DESCRIBE EMPLOYEES; 
DESC EMPLOYEES ;