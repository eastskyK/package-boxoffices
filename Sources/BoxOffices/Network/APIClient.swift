//
//  APIClient.swift
//
//
//  Created by eastsky21 on 3/26/24.
//

import Foundation

class APIClient {
    private let baseURL = "https://www.kobis.or.kr/kobisopenapi/webservice/rest"
    
    let key: String
    
    // 개발자들이 직접 initialize 할 때 key를 입력하게 함
    init(key: String) {
        self.key = key
    }
    
    func fetch<Response: Decodable>(
        path: String, //  boxoffice/searchDailyBoxOfficeList.json
        httpMethod: HTTPMethod,
        queryItems: [URLQueryItem]? = nil
    ) async throws -> Response{
        // URL Request
        let urlRequest = try URLRequest(
            urlString: "\(baseURL)/\(path)",
            httpMethod: httpMethod,
            key: key,
            queryItems: queryItems
            )
        
        // URLSession data
        let (data, urlResponse) = try await URLSession.shared.data(for: urlRequest)
        
        // HTTP URL Response
        if let error = APIError(httpResponse: urlResponse as? HTTPURLResponse){
            throw error
        }
        
        let output = try JSONDecoder().decode(Response.self, from: data)
        return output
    }
}
