/* 
파일명: ex01-select.sql

SQL (Structured Query Language) - 구조적 질의 언어 
    관계형 데이터 베이스 시스템에서 자료를 관리 및 처리하기 위하여 설계된 언어 

SELECT  문 
     데이터베이스에서 정보 검색 명령어 

#별표를 해놓으면 주석 영역으로, 프로그래밍을 하는 경우 아무런 영향을 미치지 않음 (여러줄 주석) 
*/

--(한줄 주석을 의미) 
--모든 열 선택 * 
SELECT * 
FROM departments;

--특정 열 선택 (프로젝션 Projection) 
SELECT department_id, location_id
FROM departments;
