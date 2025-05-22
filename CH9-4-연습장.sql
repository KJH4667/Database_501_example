-- 비교할 열이 여러 개인 다중열 서브쿼리 

-- 기본문법 
-- 부서번호가 10번인 사원들의 (직무, 부서번호) 조합과 
-- 동일한 (직무, 부서번호)를 가진 사원을 
-- EMP 테이블에서 조회
SELECT ENAME, JOB, DEPTNO FROM EMP 
WHERE (JOB,DEPTNO) IN (
    SELECT JOB, DEPTNO FROM EMP 
    WHERE DEPTNO = 10
);