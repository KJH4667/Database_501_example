-- 비등가 조인,  
-- 외부 조인 (오라클 전용),-> 표준 문법도  같이 소개

-- 비등가 조인 
SELECT E.ENAME,E.SAL, G.GRADE , G.LOSAL, G.HISAL
FROM EMP E, SALGRADE G
WHERE E.SAL BETWEEN G.LOSAL AND G.HISAL;

-- 외부 조인 (오라클 전용)
-- 오른쪽 외부 조인, 
-- 오른쪽 기준으로, 왼쪽에 값이 없어도 표기하겠다. 
-- 값이 NULL 이어도 표기 하겠다. 
SELECT E.ENAME, D.DNAME
FROM EMP E, DEPT D
WHERE E.DEPTNO = D.DEPTNO(+);

