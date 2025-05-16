select * from dept;
select * from emp;
select * from salgrade;

desc emp;
desc dept;
desc salgrade;

select * from emp;
-- 오라클 sql developer 에서 주석(-)2번입니다.
-- 행 기준으로 검색, where 조건 이용
select * from emp where job = 'manager';
select * from emp where job = 'MANAGER';

-- 열기준으로 프로젝션, 보고 싶은 열만 선택해서 조회해보기
select ename, job from emp where job = 'MANAGER';
select ename, job from emp;

-- 기본 퀴즈1
-- 셀력션 - 'SALES' 부서 소속 직원만 조회 
select * from emp where deptno = 30;
-- 기본 퀴즈2
-- 프로젝션 - 사원명과 입사일만 조회 
select ename, hiredate from emp;
-- 기본 퀴즈3
-- 급여가 3000 이상인 직원만 조회
select * from emp where sal >= 3000;
-- 기본 퀴즈4
-- EMP 테이블에서 이름(ename), 급여(sal), 
-- 부서번호(deptno)만 조회 해보기
select ename, sal, deptno from emp;

-- ----------------------------------------------------
-- distinct 중복 제거 
select distinct job from emp;

-- all(생략가능, 기본값) , 중복 포함, 
select all job from emp;
select job from emp;

-- 직무 + 부서 번호 조합의 고유 데이터 추출 
-- JOB 직무, 부서 번호 조합의 중복 되지 않는 행만 조회.
-- 결론, 동일한 직무와 동일한 부서 번호를 가진 직원이 
-- 여러명 있어도 한번만 결과에 나타남
select DISTINCT JOB, DEPTNO FROM EMP;
select JOB, DEPTNO FROM EMP;

--퀴즈1 
-- EMP 테이블에서 중복되지 않는 부서번호만 출력하기 
-- 퀴즈 2
--EMP 테이블에서 사원 직무와 부서번호 
-- 조합이 고유한 결과 한번더 해보기
--퀴즈3 
--EMP 테이블에서 중복을 제거하지 않고 
-- 사원 직무와 부서 번호를 모두 출력하기 
-- ALL 키워드 이용해보기
