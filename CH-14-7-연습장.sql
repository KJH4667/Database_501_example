-- 기본값을 정하는 DEFAULT 

-- 방법1, 테이블 생성시 기본값 추가
CREATE TABLE emp_default (
  empno NUMBER,
  ename VARCHAR2(20),
  hiredate DATE DEFAULT SYSDATE
);
-- 방법2, ALTER TABLE로 기본값 추가
ALTER TABLE emp_default ADD (sal NUMBER DEFAULT 1000);

-- 제약조건 확인 
SELECT * FROM USER_TAB_COLUMNS WHERE TABLE_NAME = 'EMP_DEFAULT';
-- 제약조건 삭제 
ALTER TABLE emp_default MODIFY (sal DEFAULT NULL); -- 기본값 삭제

-- 샘플 데이터 추가
INSERT INTO emp_default (empno, ename) VALUES (1, '홍길동'); -- hiredate는 기본값 SYSDATE
SELECT * FROM emp_default;