//
//  API.swift
//  FoodBrowser
//
//  Created by Valentin Rep on 20.09.2022..
//

import Foundation

protocol AnyService {
    var client: HttpClientProvider { get }

    init(client: HttpClientProvider)
}

enum API {}
