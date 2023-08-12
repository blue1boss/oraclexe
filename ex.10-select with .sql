/* With ��: 
    with ���� �������� ����� �ӽ÷� �����ϰ� ����ϴ� ����Դϴ�. 
    CTE (common Table expression) �������̺�ǥ���� 
    �ַ� ������ ���� ���� �ۼ� Ȥ ������ ���̴µ� ��� 
    */
    
--�μ��� ��� �޿� ��� ���� 
--�ӽ����� AvgSalByDepth �� �����̵� 
--UNION all ��ü ��ġ�� 
WITH AvgSalByDepth AS (
    SELECT 
        department_id, 
        AVG(salary) AS avgsalary
    FROM employees 
    GROUP BY department_id 
) 
SELECT d.department_name, AvgSalByDepth.avgsalary
FROM departments d
JOIN AvgSalByDepth
ON d.department_id=AvgSalByDepth.department_id ;

--��ȣ���� ���� ��ȯ���ִ� ���� �ǹ� 
WITH RecursiveCTE (id,name,manager_id,depth) AS (
     SELECT employee_id, last_name, manager_id, 0 
     FROM employees
     WHERE manager_id IS NULL --�ֻ��� �Ŵ���
     UNION ALL 
     SELECT e.employee_id, e.last_name, e.manager_id, rc.depth + 1
     FROM employees e
     INNER JOIN RecursiveCTE rc ON e.manager_id = rc.id
) 
SELECT id, name, manager_id, depth 
FROM RecursiveCTE;

--Recursinve cte�� 100 king 0 �� ���� ���� ���� �ǹ� 
--rc.id �� 100���� �� = �Ŵ��� ���̵� 100
