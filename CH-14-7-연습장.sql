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

-- 테이블 생성, 제약조건 설정, 샘플 데이터 입력, 제약 조건 확인. 
-- 퀴즈1, 
-- 테이블명 : EMP_MEMBER, 컬럼명 : ID(NUMBER), NAME(VARCHAR2), REGDATE(DATE)
-- REGDATE , 제약 조건 DEFAULT 이용하고, 현재 날짜로 입력하기. 
 
-- 퀴즈2, 
-- 테이블명 : PRODUCT, 컬럼명 : PCODE (VARCHAR2), PNAME (VARCHAR2),USE_YN (CHAR(1))
-- USE_YN (CHAR(1)), DEFAULT 이용하고, Y 
  
-- 퀴즈3, 
-- 테이블명 : INVENTORY , 컬럼명 : ITEM_ID (NUMBER), QUANTITY (NUMBER)
-- QUANTITY , DEFAULT, 기본 수량 10으로 설정 해보기. 