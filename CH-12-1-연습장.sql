-- 객체(테이블)를 생성, 변경, 삭제하는 데이터 정의어 

-- CREATE : 객체를 생성하는 명령어
-- ALTER : 객체를 변경하는 명령어
-- DROP : 객체를 삭제하는 명령어
-- TRUNCATE : 테이블의 데이터를 삭제하는 명령어

-- 테이블 이름 명명, 각각 언어의 예약어를 사용하면 안됨. 주의사항, 
CREATE TABLE MEMBER (
    MEMBER_ID NUMBER(5) PRIMARY KEY, -- PK = NOT NULL + UNIQUE(중복 불가)
    MEMBER_NAME VARCHAR2(20) NOT NULL, -- 값이 비어 있으면 안됨.
    MEMBER_EMAIL VARCHAR2(50) NOT NULL
);
SELECT * FROM MEMBER;
-- 샘플 데이터 추가 
INSERT INTO MEMBER (MEMBER_ID, MEMBER_NAME, MEMBER_EMAIL) VALUES (1, '홍길동', 'HONG@naver.com');

-- 테이블 구조 변경하기 
ALTER TABLE MEMBER ADD MEMBER_PHONE VARCHAR2(20);

-- 테이블 이름 변경하기 
ALTER TABLE MEMBER RENAME TO MEMBER_INFO;
SELECT * FROM MEMBER_INFO;