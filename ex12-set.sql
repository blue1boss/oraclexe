/* 
���� ������ 
    ���� ���̺� �Ǵ� ������ ����� �����ϰ� �����ϴ� ������.
    SELECT ����Ʈ�� ǥ������ �÷� ������ ��ġ�ؾ� �մϴ�. 
    ������ ������ ��ġ�ؾ� �մϴ�. 
    
    UNION, UNION ALL, INTERSECT, MINUS 

*/ 

--UNION ������: �ΰ��� ���� ����� ��ġ��, �ߺ��� ���� �����մϴ�.
--���� �����ִ� �� job history�� ���̺��� ���� 
SELECT employee_id, job_id
FROM employees
UNION 
SELECT employee_id, job_id
FROM job_history ;

--UNION ALL������: �ΰ��� ���� ����� ��ġ��, �ߺ��� ���� �����Ͽ� ��� ��ȯ�մϴ�. 
SELECT employee_id, job_id
FROM employees
UNION ALL
SELECT employee_id, job_id
FROM job_history 
ORDER BY employee_id
;

--INTERESECT ������: �ΰ��� ���� ��� �߿��� ����� �ุ ��ȯ�մϴ�. (������) 
SELECT employee_id, job_id
FROM employees
INTERSECT
SELECT employee_id, job_id
FROM job_history 
ORDER BY employee_id
;

--MINUS ������: ù��° ���� ��� �߿��� �ι�° ���� ����� �������� �ʴ� �ุ ��ȯ 
--2��° ������ ���� ���ִ� ���� (���� ��ġ�Ǿ�� ������ ������)
SELECT employee_id, job_id
FROM employees
MINUS
SELECT employee_id, job_id
FROM job_history 
ORDER BY employee_id
;

DESC Employees;

--!> ������ ����/Ÿ���� ��ġ�Ǿ�� �մϴ�. 
--�������� ���� �� ���̺��� Ư�� �÷����� UNION�Ͽ� �������� 

SELECT location_id,department_name As "Department", TO_CHAR(NULL) "Warehouse location"
FROM departments 
UNION 
SELECT location_id, TO_CHAR(NULL) AS "Department", state_province 
FROM locations;
--To char�� �ٲپ��ְ� ���� �ٲپ��ֱ� state province�� ��� ���߾��ִ� ���� �ǹ� 

SELECT employee_id, job_id, salary
FROM employees
UNION 
SELECT employee_id, job_id, 0 
FROM job_history ;
-- Ÿ�԰� ���� ������ ���߾��־�� 