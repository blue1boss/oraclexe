/* With 절: 
    with 절은 서브쿼리 결과를 임시로 정의하고 사용하는 기능입니다. 
    CTE (common Table expression) 공통테이블표현식 
    주로 복잡한 쿼리 간결 작성 혹 가독성 높이는데 사용 
    */
    
--부서별 평균 급여 계산 쿼리 
--임시쿼리 AvgSalByDepth 로 저장이됨 
--UNION all 전체 합치는 
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

--괄호안의 것을 반환해주는 것을 의미 
WITH RecursiveCTE (id,name,manager_id,depth) AS (
     SELECT employee_id, last_name, manager_id, 0 
     FROM employees
     WHERE manager_id IS NULL --최상위 매니저
     UNION ALL 
     SELECT e.employee_id, e.last_name, e.manager_id, rc.depth + 1
     FROM employees e
     INNER JOIN RecursiveCTE rc ON e.manager_id = rc.id
) 
SELECT id, name, manager_id, depth 
FROM RecursiveCTE;

--Recursinve cte에 100 king 0 의 값이 들어가는 것을 의미 
--rc.id 에 100값이 들어감 = 매니저 아이디 100
