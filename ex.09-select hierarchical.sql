/* 
�������� 
    Ʈ�� ������ ������ �����Ϳ��� �θ�-�ڽ��� ���踦 ���� �����ϴµ� ���Ǵ� sQL 
    �ַ� ������, ������ ������, ������ �ּ� � Ȱ��˴ϴ�. 
    
���� Ű���� 
    Start with: ���� ������ ���� ������ �����մϴ�. �ֻ��� �θ� ��带 �����մϴ�. 
    CONNECT BY : �θ�-�ڽ� ���踦 �����ϴ� Ű�����, PRIOR Ű����� �Բ� ���˴ϴ�. 
    PRIOR : �θ� - ���� ���踦 ǥ���ϴ� Ű����� �ڽ� �÷� �տ� ���˴ϴ�. 
    NOCYCLE: ����Ŭ�� ������� �ʵ��� �����ϴ� �ɼ��Դϴ�. 
    LEVEL: �� ������ ���̸� ��Ÿ���� �ǻ� �÷����� ���˴ϴ�. 
    SYS_CONNECT_ BY_PATH: ���� ������ ��θ� ���ڿ��� ǥ�����ִ� �Լ��Դϴ�. 
    ORDER SIBILINGS BY : ���� ������ �����ϴµ� ���˴ϴ�. 

*/

--id, name, manager_id, depth 
SELECT 
    e.employee_id,
    e.last_name, 
    e.manager_id,
    LEVEL AS depth, 
    LPAD(' ', LEVEL*2-2)||SYS_CONNECT_BY_PATH(e.last_name,'/') AS hierarchy_path --���� ��� �� ��ŭ ���� ���� 
FROM 
    employees e
START WITH 
    e.manager_id IS NULL --���Ǹ�� 
CONNECT BY --�θ�� �ڽ� column�� 
    PRIOR e.employee_id= e.manager_id --Prior �� �ڽ�
ORDER SIBLINGS BY e.employee_id; --������ 1�� ���� level depth / ������ ����  depth��� employee id ������ ����


--NOCYCLE ����Ŭ�� ������� �ʵ��� ����(���ѷ��� ����) 
SELECT *FROM employees
WHERE manager_id IS NULL;

UPDATE employees SET 
manager_id= 100
WHERE employee_id =100;

commit; 

SELECT *FROM employees
WHERE employee_id =100;


--null�� �ϸ� ���� ������ ����
SELECT 
    e.employee_id,
    e.last_name, 
    e.manager_id,
    LEVEL AS depth, 
    LPAD(' ', LEVEL*2-2)||SYS_CONNECT_BY_PATH(e.last_name,'/') AS hierarchy_path --���� ��� �� ��ŭ ���� ���� 
FROM 
    employees e
START WITH 
    e.manager_id =100 --���Ǹ�� 
CONNECT BY --�θ�� �ڽ� column�� 
    NOCYCLE PRIOR e.employee_id= e.manager_id --Prior �� �ڽ�
ORDER SIBLINGS BY e.employee_id; --������ 1�� ���� level depth / ������ ����  depth��� employee id ������ ����

UPDATE employees SET
manager_id= null 
WHERE employee_id= 100;
commit;

