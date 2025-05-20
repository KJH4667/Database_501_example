-- DECODE , CASE -> 조건문 쉽게 생각하기
-- DECODE(표현식, 
--       값1, 반환값1, 
--       값2, 반환값2, 
--       ..., 
--       기본값)
SELECT ENAME, JOB,
DECODE(JOB ,
'MANAGER', '관리자',
'CLERK' , '사무직',
'SALESMAN', '영업직',
'PRESIDENT', '대표이사',
'ANALYST','분석팀',
'기타') AS "직무 이름"
FROM EMP;

-- 부서 번호에 따라 부서명 출력 (CASE 출력)
SELECT ENAME, DEPTNO,
CASE DEPTNO 
WHEN 10 THEN '인사부'
WHEN 20 THEN '연구개발부'
WHEN 30 THEN '영업부'
ELSE '기타부서'
END
AS "CASE별 부서명" FROM EMP;

-- 급여에 따라 급여 등급 부여 
-- E : EMP , S : SALGRADE
SELECT E.ENAME, E.SAL, 
CASE 
WHEN E.SAL BETWEEN S.LOSAL AND S.HISAL THEN S.GRADE
END 
AS "급여 등급"
FROM EMP E, SALGRADE S;
