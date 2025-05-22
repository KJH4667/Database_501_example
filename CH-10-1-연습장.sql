-- 테이블에 테이터 추가하기 
-- 기본 문법 , 열의 순서에는 상관없음
-- INSERT INTO 테이블명 (열1,열2,...) VALUES (값1,값2,...);

-- 열 이름 생략 , 테이블에 정의된 열의 순서대로 작성하기. 
-- INSERT INTO 테이블명 VALUES (값1,값2,...);

-- NULL 삽입 , 날짜 입력
-- INSER INTO 테이블명 VALUES (101,NULL,'2025/05/22', SYSDATE)

-- 서브쿼리 삽입
-- INSERT INTO 테이블명 (열1,열2)
-- SELECT 열1, 열2 FROM 다른 테이블 WHERE 조건;

-- 예시
-- 열 지정 INSERT 
insert into dept (dname, deptno, loc) values ('개발부2', 70, '서울2' );
select *  from dept;
-- 열 생략 INSERT
insert into dept values ( 80,'개발부3','서울3' );
commit;
-- SYSDATE 삽입
INSERT INTO EMP (empno, ename, hiredate) VALUES ( 1000, '홍길동', SYSDATE );
SELECT * FROM EMP;

-- 퀴즈1, 
-- DEPT 테이블에 (99, ‘AI팀’, ‘JEJU’) 데이터를 추가하시오. 
 
-- 퀴즈2, 
-- EMP 테이블에 사번 1234, 이름 'LEE', 입사일을 SYSDATE로 추가하시오.
  
-- 퀴즈3, 
-- DEPT에 NULL을 포함한 값 삽입 