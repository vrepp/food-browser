//
//  Food.swift
//  FoodBrowser
//
//  Created by Valentin Rep on 20.09.2022..
//

import Foundation

struct Food: Decodable, Hashable {
    let id: Int
    let brand: String
    let name: String
    let calories: Int
    let portion: Int
}
