-- 권한 관리 
-- ### 🔹 시스템 권한(System Privileges)  
-- - 데이터베이스 **시스템 전체에 영향**을 주는 권한  
-- - 예: CREATE SESSION, CREATE TABLE, CREATE USER 등

-- ### 🔹 객체 권한(Object Privileges)  
-- - **특정 테이블, 뷰, 시퀀스 등의 객체에 대한 접근 권한**  
-- - 예: SELECT, INSERT, UPDATE, DELETE, REFERENCES 등

-- 사용자 생성, LSY4 
CREATE USER LSY4 IDENTIFIED BY 1234; -- 사용자 생성

--시스템 권한 부여 ,  
-- CREATE SESSION : 데이터베이스 접속 권한
-- CREATE TABLE : 테이블 생성 권한
-- 실제로 , 디비에서 , 용량에 대한 사용 권한이 없어서, 
-- 만들기 는 가능하지만, 실제 용량을 이용할 권한이 없어서,ㅣ 
-- 결론, 생성 불가. 
GRANT CREATE SESSION , CREATE TABLE TO LSY4

-- 추가 권한을 주기, 실제 용량을 이용할 권한
-- 새롭게 권한 추가
GRANT UNLIMITED TABLESPACE TO LSY4; -- 무제한 테이블스페이스 권한 부여
-- 기존 권한에 용량 관련 권한 부여
ALTER USER LSY4 QUOTA 100M ON USERS; -- USERS 테이블스페이스에 100M 쿼터 부여
ALTER USER LSY4 QUOTA UNLIMITED ON USERS; -- USERS 테이블스페이스에 무제한 쿼터 부여

-- LSY4 , 테이블 생성 확인, 조회 확인. 
CREATE TABLE LSY4.user_table (
    ID NUMBER(5),
    NAME VARCHAR2(20) NOT NULL,
    USER_ID2 VARCHAR2(20)
);
SELECT * FROM LSY4.user_table; -- 테이블 생성 확인

-- 권한이 부여 되지 않은 쓰기 작업, INSERT 작업, 
-- 자기가 만든 테이블에 대해서는 , 따로 설정이 없어도 자동 쓰기가 가능함. 
INSERT INTO LSY4.user_table (ID, NAME, USER_ID2) VALUES (1, 'Test User', 'test_user'); -- 권한이 없어서 실패
-- 수정 확인. 
UPDATE LSY4.user_table SET NAME = 'Updated User' WHERE ID = 1; -- 자기가 만든 테이블이라서 자동 권한 설정
-- 삭제 확인. 
DELETE FROM LSY4.user_table WHERE ID = 1; -- 자기가 만든 테이블이라서 자동 권한 설정

-- 권한 조회 
SELECT * FROM USER_SYS_PRIVS WHERE USERNAME = 'LSY4'; -- 시스템 권한 조회

-- 권한 회수 
REVOKE CREATE TABLE FROM LSY4; -- 테이블 생성 권한 회수

-- 샘플 테이블 생성 
CREATE TABLE LSY4.sample_table (
    ID NUMBER(5),
    NAME VARCHAR2(20) NOT NULL,
    USER_ID2 VARCHAR2(20)
);

-- SCOTT 계정에서 샘플 테이블 생성
CREATE TABLE SCOTT.sample_table1234 (
    ID NUMBER(5),
    NAME VARCHAR2(20) NOT NULL,
    USER_ID2 VARCHAR2(20)
);

-- 객체 권한 부여, 
-- SCOTT 에서 샘플테이블 만들어서, LSY4 , SELECT, INSERT 만 부여, 수정, 삭제 불가. 
GRANT SELECT, INSERT ON SCOTT.sample_table1234 TO LSY4; -- 객체 권한 부여

-- LSY4 계정에서 SCOTT.sample_table1234 테이블 조회
SELECT * FROM SCOTT.sample_table1234; -- SCOTT.sample_table1234 테이블 조회
-- LSY4 계정에서 SCOTT.sample_table1234 테이블에 INSERT 작업    
INSERT INTO SCOTT.sample_table1234 (ID, NAME, USER_ID2) VALUES (1, 'Test User', 'test_user'); -- INSERT 작업


--수정 작업, 권한이 없어서 실패
UPDATE SCOTT.sample_table1234 SET NAME = 'Updated User' WHERE ID = 1; -- 수정 작업, 권한이 없어서 실패
-- 삭제 작업, 권한이 없어서 실패
DELETE FROM SCOTT.sample_table1234 WHERE ID = 1; -- 삭제 작업, 권한이 없어서 실패


-- 다시 SCOTT 계정에서 LSY4 계정에 UPDATE, DELETE 권한 부여
GRANT UPDATE, DELETE ON SCOTT.sample_table1234 TO LSY4; -- 객체 권한 부여

-------------------------------------------------------------------

-- 롤관리 
-- 사전 정의된 롤  
-- | 롤 이름         | 설명 |
-- |----------------|------|
-- | CONNECT        | 기본 접속 및 일반 SELECT/INSERT 권한 |
-- | RESOURCE       | 테이블, 인덱스 등 객체 생성 가능 |
-- | DBA            | 모든 권한 포함 (관리자 전용) |

-- 초반에 , 사용자 생성및, 권한 부여시 사용했던 명령어를 리뷰, 
create user scott identified by tiger;

grant connect,resource,dba to scott;

-- 사용자 정의 롤  
-- 사전에 정의된 롤 처럼, 우리가 임의로 롤을 만들수 있다. 

-- 사용자 정의 롤 생성
CREATE ROLE my_custom_role; -- 사용자 정의 롤 생성

-- 사용자 정의 롤에 권한 부여
GRANT CREATE SESSION , RESOURCE TO my_custom_role; -- 세션 생성 권한 부여

-- 사용자 정의 롤을 사용자에게 부여
GRANT my_custom_role TO LSY4; -- 사용자에게 사용자 정의 롤 부여

-- 퀴즈1, 
-- SYSTEM(계정 또는 스콧) 사용자 정의 롤 CREATE TABLE, CREATE VIEW )생성 하기. 
-- LSY5 새로운 계정 생성하고, 
-- 사용자 정의 롤 부여(CREATE TABLE, CREATE VIEW )
 
-- 퀴즈2, 
-- 부여된 계정 LSY5 , 디비 접근 및 테이블 생성, 뷰 생성도 한번 해보기. 
-- 사용량 부분 오류 발생시, 조정해보기. 힌트) 미리 RESOURCE 권한 주기 
  
-- 퀴즈3, 
-- 권한 조회 확인. 
