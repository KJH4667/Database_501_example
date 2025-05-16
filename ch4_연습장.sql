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
