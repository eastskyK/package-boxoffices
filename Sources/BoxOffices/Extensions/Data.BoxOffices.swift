//
//  Data.BoxOffices.swift
//
//
//  Created by eastsky21 on 4/1/24.
//

import Foundation

extension Date {
    var yesterday: Date? {
        Calendar.current.date(byAdding: .day, value: -1, to: self)
    }
}
