//
//  FoodAPI.swift
//  FoodBrowser
//
//  Created by Valentin Rep on 20.09.2022..
//

import Foundation

extension API {
    /// Fetch Podcasts by Search term
    static func getFood(_ request: FoodRequest) -> HttpEndpoint<[Food]> {
        return HttpEndpoint(
            method: .get,
            baseUrl: .default,
            path: "dev/search",
            parameters: request
        )
    }
}
