//
//  URLRequest.BosOffices.swift
//
//
//  Created by eastsky21 on 3/26/24.
//

import Foundation

extension URLRequest {
    init (
        urlString: String,
        httpMethod: HTTPMethod,
        key: String,
        queryItems: [URLQueryItem]?
    )throws{
        // URL Components
        guard var components = URLComponents(string: urlString) else {
            throw APIError.urlIsInvalid // error
        }
        
        // Query Items
        components.queryItems = [URLQueryItem(name: "key", value: key)]
        if let queryItems {
            components.queryItems?.append(contentsOf: queryItems)
        }
        
        guard let url = components.url else {
            throw APIError.urlIsInvalid
        }
        self.init(url: url)
        
        self.httpMethod = httpMethod.capitalizedValue
    }
    
}
