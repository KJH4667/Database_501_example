-- 공식 별칭을 지정하는 동의어 synonym을 생성합니다. 
-- 즐겨찾기, 또는 사이트 도메인 이름, 연락처 이름. 

-- 기본 개념  

-- | 항목 | 설명 |
-- |------|------|
-- | SYNONYM | 테이블, 뷰 등의 별칭을 생성 |
-- | PUBLIC SYNONYM | 모든 사용자가 공통으로 사용 가능 |
-- | PRIVATE SYNONYM | 생성한 사용자만 사용 가능 |
-- | 객체 이름 감추기 | 실제 테이블명을 알리지 않고도 접근 가능 |
-- | 권한 | 대상 객체에 SELECT 권한 필요 |

-- -- 동의어 생성
CREATE SYNONYM EMP_SYNONYM FOR EMP; -- 이름 의미있게 이용. 
CREATE SYNONYM E FOR EMP; -- 비추

-- -- 동의어 조회
SELECT * FROM USER_SYNONYMS;

-- -- 동의어를 이용한 조회
SELECT * FROM EMP_SYNONYM; -- EMP 테이블 조회

-- 권한 부여 
GRANT SELECT ON EMP TO PUBLIC; -- 모든 사용자에게 SELECT 권한 부여
GRANT SELECT ON EMP TO SCOTT; -- 특정 사용자에게 권한 부여  

-- -- 동의어 삭제
DROP SYNONYM EMP_SYNONYM; -- 동의어 삭제

-- 스키마명 포함 접근 
SELECT * FROM SCOTT.EMP;
SELECT * FROM EMP;

--PRIVATE 동의어 생성
CREATE SYNONYM MY_EMP FOR SCOTT.EMP; -- 현재 사용자만 사용 가능

-- 사용자 추가 
CREATE USER LSY IDENTIFIED BY 1234; -- 새 사용자 생성
-- 기본 접속 권한만 추가 
GRANT CREATE SESSION TO LSY; -- 세션 생성 권한 부여

-- 세션 기존 SCOTT 계정 -> LSY 계정으로 변경 
