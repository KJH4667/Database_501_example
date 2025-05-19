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

--퀴즈2 
-- 입사일(HIREDATE)이 '1981-02-20' 이후인 사원만 조회하기

--퀴즈3 
-- 부서 번호가 10이 아닌 사원만 조회 하기. 
-- 아니다는 표현이 일단은 '<>'로 표기 하기 