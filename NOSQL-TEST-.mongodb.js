use('test')// 기본 데이터 베이스, test 사용함. 생략시 기본 test 데이터베이스 사용 

//테이블 생성, 
// 테이블 생성 후, 데이터 추가하는 기본 문법 :insertOne
// db.[테이블명].insertOne({
//     [컬럼명]:[값],
//     name: '홍길동',
//     age: 20,
//     favorite: ['apple', 'banana'],
//})
// 한줄 실행 : ctrl + alt + s
// 전체 실행 : ctrl + alt + r
// 하나 입력
db.users.insertOne({
    name: '홍길동',
    age: 20,
    favorite: ['apple', 'banana'],
})

// 조회 
// db.[테이블명].find({조건})
db.users.find();

//수정 
// db.[테이블명].updateOne({조건}, {수정할 값})
db.users.updateOne(
    { name: '홍길동' }, // 조건
    { $set: { age: 30 } } // 수정할 값
)   

// 삭제
// db.[테이블명].deleteOne({조건})  
db.users.deleteOne({ name: '홍길동' }) // 조건에 맞는 첫 번째 문서 삭제