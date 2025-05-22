-- 실행 결과가 여러 객인 다중행 서브쿼리 

-- 기본 문법 
-- IN : 복수의 값 중 하나와 일치하는 경우 
-- DALLAS 에 위치한 부서의 부서번호 중 
-- 하나에 속한 사원의 이름을 출력 예시, 
SELECT * FROM DEPT ;
SELECT ENAME FROM EMP 
WHERE DEPTNO IN (
    SELECT DEPTNO FROM DEPT WHERE LOC = 'DALLAS'
);

-- ANY 
-- 부서 번호 30번에 속한 사원들 중 적어도 한 명보다 
-- 급여가 적은 사원의 이름을 출력 예시 
-- 부서 30번의 급여 중 하나라도 큰 값이 있다면 
-- 해당 사원보다 적은 급여를 가진 사원을 모두 출력.

-- ANY 는 최소 하나의 조건만 만족해도 참이 되는 경우 
-- > , 또는 < 와 같이 비교 연산자와 함께 사용되고 
-- 최소/최대 비교를 하는 경우도 유연하게 사용이됨.
SELECT ENAME FROM EMP 
WHERE SAL < ANY (
    SELECT SAL FROM EMP WHERE DEPTNO = 30
);















