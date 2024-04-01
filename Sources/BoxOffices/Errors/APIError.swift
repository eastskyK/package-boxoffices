//
//  APIError.swift
//
//
//  Created by eastsky21 on 3/26/24.
//

import Foundation

// case 문은 상단에만 public 적어주면 아래도 적용
public enum APIError: Error {
    case urlIsInvalid
    case responseIsNotExpected
    case requestIsInvalid(_ statusCode: Int)
    case serverIsNotResponding(_ statusCode: Int)
    case responseIsUnSuccessful(_ statusCode: Int)
}

extension APIError {
    init?(httpResponse: HTTPURLResponse?){
        guard let httpResponse  else {
            self = APIError.responseIsNotExpected // error
            return
        }
        
        switch httpResponse.statusCode {
        case 200..<300:
            return nil
        case 400..<500:
            self = APIError.requestIsInvalid(httpResponse.statusCode)
        case 500..<600:
            self = APIError.serverIsNotResponding(httpResponse.statusCode)
        default:
            self = APIError.responseIsUnSuccessful(httpResponse.statusCode)
        }
    }
}
