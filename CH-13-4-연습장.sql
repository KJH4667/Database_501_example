-- 규칙에 따라 순번을 생성하는 시퀀스 (sequence) 생성

-- 기본 개념  

-- | 항목 | 설명 |
-- |------|------|
-- | 시퀀스 | 자동으로 순차적인 숫자를 생성하는 오라클 객체 |
-- | NEXTVAL | 다음 번호 생성 |
-- | CURRVAL | 최근 생성된 번호 |
-- | START WITH | 시작 숫자 설정 |
-- | INCREMENT BY | 증가 값 설정 |
-- | CYCLE | MAX 도달 시 초기화 여부 설정 |

-- 시퀀스 생성 
CREATE SEQUENCE EMP_SEQ -- 시퀀스 이름 , 의미 있는 이름으로 지정
START WITH 1
INCREMENT BY 1
MAXVALUE 999999999999
NOCYCLE;

-- 테스트 할 빈 테이블 복사 
CREATE TABLE EMP_SEQUENCE_TEST AS SELECT * FROM EMP WHERE 1=0;
-- 테이블의 내용만 삭제
TRUNCATE TABLE EMP_SEQUENCE_TEST;

-- 빈 테이블 조회 
SELECT * FROM EMP_SEQUENCE_TEST;
SELECT * FROM EMP;
-- 시퀀스 조회 
SELECT EMP_SEQ.NEXTVAL FROM DUAL;
DESC EMP_SEQUENCE_TEST;
-- 시퀀스 이용해서, 데이터 추가 해보기. 
INSERT INTO EMP_SEQUENCE_TEST VALUES(
    EMP_SEQ.NEXTVAL, -- empno 기존에는 숫자 형태로 직접 지정 했고, 자동 생성.자 타입
    '홍길동',         -- ename 문자열 타입
    '강사',         -- job 문자열 타입
    7839,           -- mgr, 숫자 타입
    SYSDATE,    -- hiredate, DATE 타입
    1000,            -- sal 숫자 타입
    500,             -- comm 숫자 타입
    10               -- deptno 숫자 타입
);

ROLLBACK; -- 트랜잭션 취소

SELECT * FROM EMP_SEQUENCE_TEST;

-- 기존 시퀀스 삭제 후 다시 생성
DROP SEQUENCE EMP_SEQ;

-- 시퀀스 마지막 값 조회
SELECT EMP_SEQ.CURRVAL FROM DUAL;

-- 시퀀스 수정 
ALTER SEQUENCE EMP_SEQ
    INCREMENT BY 10 -- 증가값을 10으로 변경
    -- START WITH 1000; -- 시작값을 1000으로 변경

-- 연습용 테이블 생성 후 작업하기. 
-- DEPT -> DEPT_SEQ_TEST 테이블 복사 후 작업. 
CREATE TABLE DEPT_SEQ_TEST AS SELECT * FROM DEPT WHERE 1=0;
-- 퀴즈1, 
-- 1부터 시작하는 DEPT_SEQ 시퀀스를 생성하시오.  
-- 증감 10씩, 맥스 : 999999999, NOCYCLE 옵션 사용. 
CREATE SEQUENCE DEPT_SEQ
START WITH 1
INCREMENT BY 10
MAXVALUE 999999999
NOCYCLE;
-- 시퀀스 확인
SELECT DEPT_SEQ.NEXTVAL FROM DUAL;
 
-- 퀴즈2, 
-- DEPT_SEQ_TEST, 샘플 데이터를 추가해서, 증감값 확인,.(자동증가 확인이 목적)
DESC DEPT_SEQ_TEST; -- 추가시, 컬럼의 이름을 생략 하게 되면, 정의된 컬럼 순서대로 입력하기.
INSERT INTO DEPT_SEQ_TEST VALUES(
    DEPT_SEQ.NEXTVAL, -- deptno 자동 생성
    '개발부',         -- dname 문자열 타입
    '서울'            -- loc 문자열 타입
);
SELECT * FROM DEPT_SEQ_TEST;
-- 퀴즈3, 
-- 마지막으로 생성된 시퀀스 번호 확인 및 증감 10 -> 100 변경도 해보고, 삭제도 해보기
-- 정의가 NUMBER(2) -> 수정 해보기. 
ALTER TABLE DEPT_SEQ_TEST MODIFY (deptno NUMBER(3));
ALTER SEQUENCE DEPT_SEQ
    INCREMENT BY 100; -- 증감값 변경
-- 시퀀스 삭제 
DROP SEQUENCE DEPT_SEQ;    
-- 시퀀스 확인 
SELECT * FROM USER_SEQUENCES WHERE SEQUENCE_NAME = 'DEPT_SEQ';
-- 시퀀스가 삭제되었는지 확인