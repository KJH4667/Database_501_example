-- 인덱스를 이용한 성능 테스트
-- 더미 테이블 생성, EMP_INDEX_TEST 테이블 생성
DESC EMP;
-- 기존 EMP 테이블은 4자리 사원 번호까지만 이용가능해서, 6자리로 교체.
-- DROP TABLE EMP_INDEX_TEST;
CREATE TABLE EMP_INDEX_TEST (
    EMPNO NUMBER(6) PRIMARY KEY,
    ENAME VARCHAR2(50),
    JOB VARCHAR2(20),
    MGR NUMBER(6),
    HIREDATE DATE,
    SAL NUMBER(8, 2),
    COMM NUMBER(8, 2),
    DEPTNO NUMBER(2)
);
SELECT * FROM EMP_INDEX_TEST;

-- 더미 데이터 삽입 , 100000건 삽입
BEGIN
  FOR i IN 1..100000 LOOP
    INSERT INTO EMP_INDEX_TEST(empno, ename, job, sal, deptno)
    VALUES (
      10000 + i,
      'USER' || i,
      CASE MOD(i, 5)
        WHEN 0 THEN 'CLERK'
        WHEN 1 THEN 'MANAGER'
        WHEN 2 THEN 'SALESMAN'
        WHEN 3 THEN 'ANALYST'
        ELSE 'PRESIDENT'
      END,
      1000 + MOD(i, 5000),
      MOD(i, 4) * 10 + 10  -- 10, 20, 30, 40 중 하나
    );
  END LOOP;
  COMMIT;
END;





