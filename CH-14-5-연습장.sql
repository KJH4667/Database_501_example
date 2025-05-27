-- 다른 테이블과 관계를 맺는 FOREIGN KEY 제약조건을 추가하는 예제

-- 기본 문법 

-- 방법1, 테이블 생성시, 외래키 설정
CREATE TABLE dept_fk ( -- 부모 테이블 : 1
  deptno  NUMBER PRIMARY KEY,
  dname   VARCHAR2(20),
  loc     VARCHAR2(20)
);

CREATE TABLE emp_fk ( -- 자식 테이블 : N
  empno   NUMBER PRIMARY KEY,
  ename   VARCHAR2(20),
  deptno  NUMBER,
  -- CONSTRAINT 제약조건_이름 FOREIGN KEY (현재 테이블의 컬럼명:deptno)
  -- REFERENCES (부모테이블: dept_fk) (부모테이블의 컬럼명:deptno)
  CONSTRAINT fk_dept FOREIGN KEY (deptno)  
  REFERENCES dept_fk(deptno)
);
-- 결론, 외래키 설정은 자식 테이블에서 한다. 

-- 제약 조건 위배 되는 상황 
-- 1) emp_fk 테이블에 데이터를 추가시, 부서 번호가 없는 번호를 입력시 오류

-- 자식 테이블에 , 외래키 설정시, 부모 데이터가 삭제시 같이 삭제되는 옵션 CASCADE 설정 확인. 
-- 부모 데이터 삭제시 확인 