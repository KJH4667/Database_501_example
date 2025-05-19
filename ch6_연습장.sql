-- 문자열 관련 내장 함수 , 오라클에서 미리 만든 기능 
-- 우리는 이용하는 부분을 공부함. 

-- 이름을 모두 대문자로, 소문자, 첫글자 대문자등 출력 
SELECT 
ENAME, 
UPPER(ENAME) AS "사원명 대문자",
LOWER(ENAME) AS "사원명 소문자",
INITCAP(ENAME) AS "사원명 첫글자 대문자"
FROM EMP;

-- 사원 이름의 길이, 바이트 수 출력
SELECT ENAME, 
LENGTH(ENAME) AS "사원명 글자 길이",
LENGTHB(ENAME) AS "사원명 바이트 길이"
FROM EMP;

-- 직문 문자열 안에 'A'가 포함된 위치 
SELECT JOB, 
-- 문자열 찾기
-- INSTR(컬럼명(문자열), 찾을문자, 시작위치, 몇번째)
INSTR(JOB,'A') AS "A가 몇번째 위치",
-- 문자열 일부 추출
-- SUBSTR(컬럼명(문자열), 시작위치 1부터 시작, 길이)
SUBSTR(JOB,1,3) AS "1~3글자 읽기",
-- 문자열 바꾸기
-- REPLACE(컬럼명(문자열),바꿀 대상, 바꿀내용)
REPLACE(JOB,'CLERK', '직원') AS "한글 직무"
FROM EMP;

-- LPAD, RPAD : 포맷 맞추기
-- LPAD(컬럼명(문자열), 총길이, '채워질 문자')
--- 사원명에서 전체길이 9자리 만들고, 
-- 남은 부분은 채워질 문자로 채움
SELECT ENAME, 
LPAD(ENAME, 9, '*') AS "9글자포맷마스킹처리",
RPAD(ENAME, 9, '*') AS "9글자포맷마스킹처리"
FROM EMP;

-- TRIM : 문자열 양쪽 문자 제거 
-- TRIM(LEADING | TRAILING | BOTH '제거문자' FROM 문자열)
-- LEADING : 앞에서 제거 
-- TRAILING : 뒤에서 제거 
-- BOTH : 양쪽 제거 (생략 시 기본값으로 적용)
-- 목적, 공백 또는 지정 문자 제거 F
-- DUAL : 더미 테이블, 없는 테이블, 주로, 간단한 함수 
-- 테스트 하는 목적 이용.
SELECT 
TRIM('   ORACLE   ') AS "양쪽 공백 제거" ,
LTRIM('   ORACLE   ') AS "왼쪽 공백 제거" ,
RTRIM('   ORACLE   ') AS "오른쪽 공백 제거" 
FROM DUAL;

-- 
SELECT 
TRIM(BOTH '#' FROM '###HELLO###') AS "BOTH 결과" ,
TRIM('#' FROM '###HELLO###') AS "BOTH 생략 결과",
TRIM(LEADING '#' FROM '###HELLO###') AS "LEADING 결과",
TRIM(TRAILING '#' FROM '###HELLO###') AS "TRAILING 결과"
FROM DUAL;

-- 문자열 연결 해보기 
-- CONCAT(컬러명1(문자열1),컬러명2(문자열2))
-- 2 문자열을 연결(합치는) 함수 
SELECT CONCAT(ENAME, JOB) AS "이름+직무" FROM EMP;
SELECT CONCAT('이', '상용') AS "이름 결합" FROM DUAL;
-- CONCAT 2개까지만 가능, 그 이상 연결시 (||)
-- 키보드 엔터 위에 키 (|) 2번 사용 후 이용 가능. 
SELECT '연결할 문자열 2개이상' || ' 버티컬 바 2개를 붙이기'
|| ' 그러면 연결한 문자열을 합치기 가능함' FROM DUAL;



