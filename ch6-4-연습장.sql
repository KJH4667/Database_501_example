-- 날짜 데이터를 다루는 내장 함수 

-- 현재 날짜 
SELECT SYSDATE FROM DUAL;

-- 3개월 후 
SELECT ADD_MONTHS(SYSDATE, 3) FROM DUAL;

-- 개월 차이 
SELECT MONTHS_BETWEEN(SYSDATE, HIREDATE) FROM EMP;

--다음 금요일 , 요일 선택 부분에 서버의 언어맞게 설정하기.
SELECT NEXT_DAY(SYSDATE, '금요일') FROM DUAL;

--이번달 말일 
SELECT LAST_DAY(SYSDATE) FROM DUAL;

--날짜 반올림 / 버림 
SELECT ROUND(SYSDATE, 'MONTH'),TRUNC(SYSDATE, 'MONTH')
FROM DUAL;

-- 입사일로부터 10주년 구하기 
SELECT ENAME, ADD_MONTHS(HIREDATE, 120) 
AS "10주년" FROM EMP;

--퀴즈1 
--입사일로부터 32년이 지나지 않은 사원만 출력해보기. 

--퀴즈2
-- 사원별로 입사일 기준 다음 월요일 출력해보기 

--퀴즈3 
-- 사원의 입사일을 월 단위로 반올림 해서 출력 해보기.
