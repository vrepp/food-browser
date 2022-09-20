//
//  DateFormatter+Extension.swift
//  FoodBrowser
//
//  Created by Valentin Rep on 20.09.2022..
//

import Foundation

extension DateFormatter {
    /// Return Long date style formatter
    static let longDate: DateFormatter = {
        let dateFormatter = DateFormatter()
        dateFormatter.dateStyle = .long

        return dateFormatter
    }()

    /// Return Medium time style formatter
    static let mediumTime: DateFormatter = {
        let dateFormatter = DateFormatter()
        dateFormatter.timeStyle = .medium

        return dateFormatter
    }()
}
