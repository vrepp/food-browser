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

extension Food {
    /// return total calories per portion
    var totalCalories: Double {
        Double(calories) * Double(portion / 100)
    }
}

/*
 {
 "id": 0,
 "brand": "Journal Communications",
 "name": "BBQ Chicken Pizza",
 "calories": 119,
 "portion": 231
 }

- calories is the number of calories in 100 grams of the food.
- portion is the number of grams in 1 portion of the food.

 */
