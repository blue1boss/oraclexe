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
