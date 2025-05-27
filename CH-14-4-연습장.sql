-- 유일하게 하나만 있는 값 PRIMARY KEY 제약조건을 가진 테이블을 생성합니다.

-- 방법1 , 테이블 생성시, 기본으로 , 이름 지정 없이 만들기
-- 방법2, 테이블 생성시, 제약 조건 이름을 설정해서 만들기 
-- 방법3, 테이블 생성 후, 제약 조건을 추가해서 만들기
DROP TABLE user_table;
CREATE TABLE user_table(
    ID NUMBER(5) PRIMARY KEY, --방법1
    NAME VARCHAR2(20) NOT NULL,
    USER_ID VARCHAR2(20) CONSTRAINT user_id_unique UNIQUE
);
-- -- 방법2, 테이블 생성시, 제약 조건 이름을 설정해서 만들기
CREATE TABLE user_table(
    ID NUMBER(5) CONSTRAINT user_table_pk PRIMARY KEY, -- 방법2
    NAME VARCHAR2(20) NOT NULL,
    USER_ID VARCHAR2(20) CONSTRAINT user_id_unique UNIQUE
);
-- 방법3, 테이블 생성 후, 제약 조건을 추가해서 만들기
CREATE TABLE user_table(
    ID NUMBER(5) ,
    NAME VARCHAR2(20) NOT NULL,
    USER_ID VARCHAR2(20) CONSTRAINT user_id_unique UNIQUE
);
-- 방법3
ALTER TABLE user_table ADD CONSTRAINT user_table_pk PRIMARY KEY(ID);

-- 제약조건 확인 , 데이터 사전
SELECT * FROM USER_CONSTRAINTS WHERE TABLE_NAME = 'USER_TABLE';

--PK 생성 시 , 자동으로 인덱스 설정함, 인덱스 확인 , 데이터 사전 
SELECT * FROM USER_INDEXES WHERE TABLE_NAME = 'USER_TABLE';

-- PK 제약조건 삭제 
ALTER TABLE user_table DROP CONSTRAINT user_table_pk;

-- 샘플 데이터 추가, 중복 방지 확인
INSERT INTO user_table(ID, NAME, USER_ID) VALUES(1, '홍길동', 'HONG');
INSERT INTO user_table(ID, NAME, USER_ID) VALUES(1, '이순신', 'LEE');

-- 샘플 데이터 추가, NULL 방지 확인
INSERT INTO user_table(ID, NAME, USER_ID) VALUES(NULL, '강감찬', 'KANG');