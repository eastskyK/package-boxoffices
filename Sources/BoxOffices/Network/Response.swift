//
//  Response.swift
//
//
//  Created by eastsky21 on 4/1/24.
//

import Foundation

struct BoxOfficeResponse: Decodable {
    let boxOfficeResult: BoxOfficeResult
    
    struct BoxOfficeResult: Decodable {
        let dailyBoxOfficeList: [Movie]
        
    }
}
