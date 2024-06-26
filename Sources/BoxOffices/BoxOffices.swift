// The Swift Programming Language
// https://docs.swift.org/swift-book

import Foundation

// 접근성 관리 Access Control
// 1. Open : Override 가능
// 2. Public : Override 불가능
// 3. Internal : 모듈 안에서만 접근 - 기본임 (아무것도 안적으면 됨)
// 4. FilePrivate : 같은 파일에서는 접근 가능
// 5. Private

// api description (option key 눌렀을 때 설명) 작성은 /** */ 또는 /// 사용

/// 박스오피스 관련 퍼블릭 인터페이스 제공하는 메인 클래스
public class BoxOffices {
    private let apiClient: APIClient
    
    /// 영화진흥위원회에서 발급 받은 API 키
    public var apiKey: String {
        apiClient.key
    }
    
    /// ``BoxOffices/BoxOffices`` 객체를 생성합니다.
    /// - Parameter key: 영화진흥위원회에서 발급 받은 API 키
    ///
    public init(key: String){
        self.apiClient = APIClient(key: key)
    }
    
    /// 박스오피스 일별 탑 10 영화를 가져옵니다.
    ///  - Returns: 성공할 시에는 ``Movie`` 타입의 영화 10개, 실패할 시에는 에러를 제공하는 `Result` 객체.
    ///  ```swift
    ///  let result = await boxOffices.fetchDailyTop10()
    ///  switch result {
    ///    case .success(let movies):
    ///    // Movie 객체 10개
    ///    case .failure(let error):
    ///    //에러 처리
    ///  }
    ///  ```
    public func fetchDailyTop10() async -> Result<[Movie], Error> {
        // Yesterday
        guard let yesterday = Date().yesterday else {
            return .failure(BoxOfficeError.recentDateIsInvalid)
        }
        
        // 날짜 형식 : yyyymmdd
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "YYYYMMdd"
        let targetDate = dateFormatter.string(from: yesterday)
        
        // API 요청 및 응답
        do {
            let response: BoxOfficeResponse = try await apiClient.fetch(
                path: "boxoffice/searchDailyBoxOfficeList.json",
                httpMethod: .get,
                queryItems: [URLQueryItem(name: "targetDt", value: targetDate)])
            
            return .success(response.boxOfficeResult.dailyBoxOfficeList)
        } catch {
            return .failure(error)
        }
    }
}
