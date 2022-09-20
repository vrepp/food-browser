//
//  String+Extension.swift
//  FoodBrowser
//
//  Created by Valentin Rep on 20.09.2022..
//

import Foundation

extension String {
    /// Localization
    func localized(bundle: Bundle = .main, tableName: String = "Localizable") -> String {
        return NSLocalizedString(self, tableName: tableName, value: "??\(self)??", comment: "")
    }
}
