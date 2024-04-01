#  박스오피스 상위 10개 목록 가져오기

박스오피스 일별 탑 10 영화를 가져옵니다.

## 개요

``BoxOffices/fetchDailyTop10()`` 메소드를 통해 ``Movie`` 타입의 영화 10개를 가져올 수 있습니다. 
`Result` 타입으로 리턴 합니다.


```swift
let result = await boxOffices.fetchDailyTop10()
switch result {
  case .success(let movies):
  // Movie 객체 10개
  case .failure(let error):
  //에러 처리
}
```

