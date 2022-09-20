//
//  Date+Extension.swift
//  FoodBrowser
//
//  Created by Valentin Rep on 20.09.2022..
//

import Foundation

extension Date {
    /// Return Formatted Date as String
    func string(with dateFormatter: DateFormatter) -> String {
        return dateFormatter.string(from: self)
    }
}
