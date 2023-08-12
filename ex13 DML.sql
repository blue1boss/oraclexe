/*

DML(DATA manipulation language) 
    DB���� �����͸� �����ϰ� ó���ϴ� SQL�� �ǹ� 
    INSERT��: ���̺� ���ο� ���ڵ� ���� 
    UPDATE��: ���̺� ���� ���ڵ带 ���� (������Ʈ) �ϴµ� ��� 
    DELETE��: ���̺��� Ư�����ڵ带 ���� 
    
    SELECT �� DML�� ���Ե� �� ������, ���� DQL(data Query language) �з��Ѵ�
    
*/ 

/* 
INSERT�� 
[�⺻����]
    INSERT INTO ���̺�� (�÷���1, �÷���2....) 
    VALUES(��1, ��2....) ;
    
    �Ǵ� 
    INSERT INTO ���̺�� (�÷���1,�÷���2,..) subquery;
    
*/ 
SELECT * FROM DEPARTMENTS;
INSERT INTO departments(department_id, department_name, manager_id, location_id) 
VALUES (280, 'Public Relations', 100, 1700);

--Ȯ���� commit;�� �߰����־�� SQL DML ����� ���������� �ݿ�

--null���� ���� �� ���� 
--�� ������ ����
INSERT INTO departments (department_id, department_name)
VALUES (290,'Purchasing');

select *from departments;

--commit���� ��� ����
ROLLBACK; --�ǵ��� �� ���� DML���� �������� ����� �� 

--NULL Ű���� ���� 
INSERT INTO departments 
VALUES (300,'Finance', NULL, NULL);

/* INSERT SUBquery 

*/

CREATE TABLE sales_reps 
AS(SELECT employee_id id, last_name name, salary, commission_pct
    FROM employees --1=2�� ������ ���� �����̺��� ���´� WHERE�ٱ��� �����ϸ� 
    WHERE 1 = 2) ;
    
SELECT *FROM sales_reps;

--job_id REP ���Ե� ��� 
SELECT employee_id, last_name, salary, commission_pct
FROM employees
WHERE job_id LIKE '%REP%';

INSERT INTO sales_reps(id, name, salary, commission_pct)
SELECT employee_id, last_name, salary, commission_pct
FROM employees
WHERE job_id LIKE '%REP%';

--Commit; 
--SELECT * FROM SALES_REPS;