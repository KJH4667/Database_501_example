-- FROM 절에 사용하는 서브쿼리와 
-- WITH 절(재사용, 변수와 비슷)

-- 기본 문법 
-- 인라인 뷰 방식 
-- 부서번호가 30번인 사원들만 추출한 뒤 
-- 그 결과에서 직무별 평균 급여를 계산. 
SELECT JOB, AVG(SAL) AS "평균급여" FROM 
(    SELECT * FROM EMP WHERE DEPTNO = 30 )
GROUP BY JOB;

-- WITH절 방식 
-- WITH (변수명) AS (쿼리 정의)
WITH DEPT30_EMP AS (
SELECT * FROM EMP WHERE DEPTNO = 30
)
SELECT JOB, AVG(SAL) AS "평균급여"
-- FROM (서브쿼리 통문자 들어 왔음, 인라인뷰)
FROM DEPT30_EMP
GROUP BY JOB;

-- WITH 절을 이용해서, 평균 급여 구해보기.
WITH DEPT30_EMP AS (
SELECT * FROM EMP WHERE DEPTNO = 30
)
SELECT JOB, AVG(SAL) FROM DEPT30_EMP 
GROUP BY JOB;

--WITH 절에서 필터링한 데이터를 메인 쿼리에서 조인 
WITH EMP30 AS (
SELECT * FROM EMP WHERE DEPTNO = (
    SELECT DEPTNO FROM DEPT WHERE LOC = 'DALLAS'
)
)
SELECT ENAME,JOB FROM EMP30;









