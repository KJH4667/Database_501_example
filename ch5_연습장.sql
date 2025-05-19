-- where 기본 문법 확인 
-- where 조건식(true) 일 경우의 행만 출력
-- 부선 번호가 30인 경우 
select * from emp
where deptno = 30;

-- 직무(job) 가 'SALESMAN' 인 사원 조회 
SELECT * FROM EMP
WHERE JOB = 'SALESMAN';

--퀴즈1
-- 급여가(SAL) 2000 이상인 사원만 조회하기 
SELECT * FROM EMP 
WHERE SAL >= 2000
ORDER BY SAL ;
--퀴즈2 
-- 입사일(HIREDATE)이 '1981-02-20' 이후인 사원만 조회하기
-- 날짜가 이후이면, 값으로 치면 큰값, 최신이다.
SELECT * FROM EMP 
WHERE HIREDATE > '1981-02-20'
ORDER BY HIREDATE ASC;
--퀴즈3 
-- 부서 번호가 10이 아닌 사원만 조회 하기. 
-- 아니다는 표현이 일단은 '<>'로 표기 하기 
SELECT * FROM EMP 
WHERE DEPTNO <> 10
ORDER BY DEPTNO ASC;

SELECT * FROM EMP 
WHERE DEPTNO != 10;

--------------------------------------
-- 5-2 AND, OR 논리 조건, 다중 조건 

SELECT * FROM EMP 
WHERE 
DEPTNO = 30 
AND 
JOB = 'SALESMAN';

-- OR 조건 
-- 하나라도 만족하면 출력됨. 
-- JOB 가 CLERK 또는 MANAGER 인 사원 출력 해보기
SELECT * FROM EMP
WHERE JOB = 'CLERK' OR JOB = 'MANAGER';

--괄호 사용 (우선순위 명확히 하기)
-- 부서 번호가 10 또는 20이고, 급여가 2000 초과인 경우 
SELECT * FROM EMP
WHERE (DEPTNO = 10 OR DEPTNO = 20)
AND SAL > 2000;

-- 퀴즈1 
-- 급여가 1500 이상이고, 
-- 커미션이 NULL 이 아닌 사원만 조회
-- 힌트) NULL 이 아닌 표현 : IS NOT NULL
SELECT * FROM EMP 
WHERE SAL >= 1500 
AND 
COMM IS NOT NULL;

-- 퀴즈2
-- 직무가 'SALESMAN' 이거나, 
-- 급여가 3000 이상인 사원 출력
SELECT * FROM EMP
WHERE JOB = 'SALESMAN'
OR
SAL >= 3000;

-- 퀴즈3
-- 부서번호가 10,20,30 중 하나이고, 
-- 급여가 2000 이상인 사원 출력
-- 힌트) 10,20,30 중 하나 표현 : IN (10, 20, 30) 이용
-- OR 조건을 간단히 표현 하기 위해서 
-- 컬럼명 IN (값1, 값2, 값3,...)
-- 컬럼명의 조건이 IN 안의 값을 하나라도 만족한다면 TRUE

SELECT * FROM EMP 
WHERE (DEPTNO = 10
OR DEPTNO = 20 
OR DEPTNO = 30) AND SAL >= 2000;

-- IN 연산자 이용해서 표현해보기 
SELECT * FROM EMP 
WHERE DEPTNO IN (10,20,30)AND SAL >= 2000;





