/*
--������ (�׷�) �Լ� 
AVG() -���
MIN() - �ּҰ�
MAX() - �ִ밪
SUM()- �հ� 
*/
SELECT AVG(SALARY) AS AVG_SALARY, 
    MAX(SALARY) AS MAX_SALARY, 
    MIN(SALARY) AS MIN_SALARY, 
    SUM(SALARY) AS TOTAL_SALARY
FROM EMPLOYEES
WHERE JOB_ID LIKE '%REP%';

--�յڿ� ������� rep�� ������ ���Ե� �������� salary ǥ�� 


--COUNT () �Լ� - null���� �ƴ� ��� ���� ������ ��ȯ�մϴ�. 
SELECT COUNT (*) AS TOTAL_EMPLOYEES
FROM EMPLOYEES
WHERE DEPARTMENT_ID= 50;
--(*)�ڸ��� COLUMN name�� ������ �� 

SELECT COUNT (COMMISSION_PCT) AS NON_NULL_COMMISSION_COUNT
FROM EMPLOYEES
WHERE DEPARTMENT_ID= 50;

SELECT COUNT (COMMISSION_PCT) AS NON_NULL_COMMISSION_COUNT
FROM EMPLOYEES
WHERE DEPARTMENT_ID= 80;

SELECT COUNT (NVL(COMMISSION_PCT,0)) AS NON_NULL_COMMISSION_COUNT
FROM EMPLOYEES
WHERE DEPARTMENT_ID= 50;

--departemnt id 45���� ���� -> (*)�� 45�� -> count(1) ������ 1�� �� ���� ������ ��Ÿ���� ���̱⿡ 45�� �����ϴ�. 
--NULL�� ī��Ʈ�� ���� ���� 