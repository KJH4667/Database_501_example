--다양한 고급 그룹화 함수 기능 소개 

-- (ROLLUP) : 계층적 요약
-- 부서별, 직책별 급여 합계 
-- 기본 문법 
-- SELECT  부서, 직책 , SUM(급여)
-- FROM EMP 
-- GROUP BY ROLLUP(부서, 직책)
-- 상위 항목(부서) -> 하위항목 (직책) 순서로 요약
-- 마지막 행은 전체 총합
SELECT DEPTNO, JOB, SUM(SAL)
FROM EMP 
GROUP BY ROLLUP(DEPTNO, JOB);

-- CUBE : 모든 조합 분석 
-- 기본 문법 
-- SELECT 부서, 직책, SUM(급여)
-- FROM EMP 
-- GROUP BY CUBE(부서,직책)
-- ROLLUP 보다 더 많은 조합 생성 
-- (부서,직책), (부서), (직책) 모든 집계 조합 가능. 

SELECT DEPTNO, JOB, SUM(SAL) AS "총 급여"
FROM EMP 
GROUP BY CUBE(DEPTNO,JOB);

-- GROUPING 
-- 집계로 인한 NULL 여부 식별에 사용함. 
-- 기본 문법 
-- SELECT 컬럼1, 컬럼2, 집계합수(컬럼3) ,
-- GROUPING(컬럼1) AS 그룹1,
-- GROUPING(컬럼2) AS 그룹2
-- FROM 테이블 명 
-- GROUP BY ROLLUP(컬럼1, 컬럼2);

-- DEPTNO = 1 이면 전체 집계로 생긴 NULL
-- JOB = 1 이면 부서 합계로 생긴 NULL
SELECT DEPTNO, JOB, SUM(SAL) AS "총 급여",
GROUPING(DEPTNO) AS "GROUP_DEPTNO",
GROUPING(JOB) AS "GROUP_JOB"
FROM EMP 
GROUP BY ROLLUP(DEPTNO, JOB);

-- PIVOT 
-- 행 -> 열로 전환 하기 
-- 기본 문법 
-- SELECT * 
-- FROM (
-- SELECT 기준 컬럼, 피벗컬럼, 값 컬럼 FROM 테이블명
--)
-- PIVOT (
-- 집계함수(값 컬럼)
-- FOR 피벗컬럼 IN (값1 AS 별칭1, 값2 AS 별칭2,...)
--);

-- 직책별 급여 합계를 부서별로 , 가로 형태로 전환
SELECT * 
FROM ( SELECT DEPTNO, JOB, SAL FROM EMP)
PIVOT(
SUM(SAL)
FOR JOB IN ('CLERK' AS "사무직",
'MANAGER' AS "관리자", 'ANALYST' AS "분석가")
);

-- UNPIVOT 
-- 열 데이터를 다시 행으로 전환  
-- 기본 문법
-- SELECT * 
-- FROM ( SELECT  기준컬럼, 열1, 열2,... FROM 테이블명)
-- UNPIVOT (
-- 값 컬럼 FOR 피벗 커럼 IN (열1, 열2,...)
--);

-- 위에서 PIVOT 된 결과를 다시 행으로 변환 
-- 컬럼명 한글로 하면 가능하다고, 검토
SELECT DEPTNO, JOB, SUM(SAL) AS "총급여"
FROM ( 
SELECT * 
    FROM ( 
    SELECT DEPTNO, JOB, SAL
    FROM EMP
    )
    PIVOT(
    SUM(SAL) FOR JOB IN 
    ('CLERK' AS "사무직", 'MANAGER' AS "관리자",
    'ANALYST' AS "분석가")
    )
)
UNPIVOT (
    SAL FOR JOB IN (
    "사무직" AS 'CLERK', 
    "관리자" AS 'MANAGER',
    "분석가" AS 'ANALYST')
)
GROUP BY DEPTNO, JOB
ORDER BY DEPTNO, JOB;


-- UNPIVOT 간단한 예시 
-- 열 기준의 급여 데이터를 연도 기준 행으로 전환하기. 








