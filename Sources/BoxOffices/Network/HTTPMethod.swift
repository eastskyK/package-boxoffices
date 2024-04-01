//
//  HTTPMethod.swift
//
//
//  Created by eastsky21 on 3/26/24.
//

import Foundation

enum HTTPMethod: String {
    case get //, post, delete, put
    
    var capitalizedValue: String {
        self.rawValue.capitalized // .get -> GET
    }
}
