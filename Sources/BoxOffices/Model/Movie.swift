//
//  File.swift
//  
//
//  Created by eastsky21 on 4/1/24.
//

import Foundation

public struct Movie: Decodable {
    public let rank: String
    public let code: String
    public let name: String
    
    private enum CodingKeys: String, CodingKey {
        case rank
        case code = "movieCd"
        case name = "movieNm"
    }
}
