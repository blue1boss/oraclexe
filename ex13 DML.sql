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

--Commit
--SELECT * FROM SALES_REPS



/* Update �� 
    ���̺��� �������� �����մϴ�. 
    
[�⺻����]
    Update ���̺�� 
    SET �÷���1 = ������, �÷���2 = ������
    Where ������
*/ 

CREATE TABLE copy_emp
AS SELECT * FROM employees WHERE 1= 2;

INSERT INTO copy_emp
SELECT * FROM employees;--employee ���̺��� copy emp���̺�� �����ϱ�

commit;
SELECT * FROM copy_emp;

--113�� ȸ���� �μ���ȣ 50���� ���� 
UPDATE copy_emp
SET department_id = 50 
WHERE employee_id= 113;

rollback;
--��ü�� ������Ʈ�� ����
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
DELETE ��
    DELETE ���� ����Ͽ� ���̺��� ���� ���� ������ �� �ֽ��ϴ�. 
    
    */ 
--�����ȣ 200���� ��� ���� 
DELETE FROM copy_emp 
WHERE employee_id = 200;

SELECT * FROM copy_emp 
WHERE employee_id = 200;

--���̺� ��ü ������ ���� 
DELTE FROM copy_emp;

/* 
TRUNCATE �� 
    ���̺��� �� ���·�, ���̺� ���� �״�� ���ܵ� ä ���̺��� ��� ���� �����մϴ�. 
    DML ���� �ƴѶ� DDL(������ ���Ǿ�) ���̹Ƿ� ���� ����� �� �����ϴ�. 
*/ 

--���������� ��� : TRUNCATE TABLE copy_emp; 

/* 
Ʈ����� (transaction) 
    ������ ó���� �� �����Դϴ�. 
    ����Ŭ���� �߻��ϴ� �������� SQL ��ɹ��� 
    �ϳ��� ������ �۾� ������ ó���ϴ��� �̸� Ʈ������̶�� �մϴ�. 
    
    COMMIT: SQL���� ����� ���������� DB�� �ݿ� 
    ROLLBACK: SQL���� �������� ����� �� 
    SAVEPOINT: Ʈ������� �������� ǥ���ϴ� �ӽ� ������ 
*/ 

CREATE TABLE member(
    num NUMBER PRIMARY KEY, -- num �̸� ���ڸ�/ ������
    name VARCHAR2(30), --�̸�, ���ڸ� 30�� 
    addr VARCHAR2(50) --�̸�, ���ڸ� 50��
    );
    
INSERT INTO member VALUES (1,'��ī��','���ʸ���');
COMMIT;
INSERT INTO member VALUES (2,'������','���ʸ���');
INSERT INTO member VALUES (3,'���̸�','���ʸ���');
INSERT INTO member VALUES (4,'���α�','���ʸ���');

SELECT * FROM member;

--savepoint
INSERT INTO member VALUES(5,'������','���ʸ���');
SAVEPOINT mypoint;
INSERT INTO member VALUES(6,'�ߵ���','���ʸ���');
INSERT INTO member VALUES(7,'������','���ʸ���');
INSERT INTO member VALUES(8,'�ǰ���','���ʸ���');
ROLLBACK TO mypoint;

/* 
SELECT ���� FOR UPDATE �� 
FOR update�� Ư�� ���ڵ带 ��� lock ó���ϴ� SQL����
--commit , rollback �������
*/ 
SELECT employee_id, salary, job_id
FROM employees
WHERE job_id= 'SA_REP'--�� ��鿡 ���� �ɸ��� ���� �ǹ�, �ٸ� ����ڵ��� ������ ���� ����
FOR UPDATE;\

--commit , rollback
commit;