//
//  FoodService.swift
//  FoodBrowser
//
//  Created by Valentin Rep on 20.09.2022..
//

import Foundation
import Combine

protocol FoodServiceProtocol: AnyService {
    func fetch(query: String?) -> AnyPublisher<[Food], Error>
}

struct FoodService: FoodServiceProtocol {
    let client: HttpClientProvider

    init(client: HttpClientProvider = HttpClient()) {
        self.client = client
    }

    func fetch(query: String?) -> AnyPublisher<[Food], Error> {
        let request = FoodRequest(kv: query)
        let endpoint = API.getFood(request)

        return Deferred {
            Future { promise in
                Task {
                    do {
                        let response = try await client.performRequest(endpoint: endpoint)
                        promise(.success(response))
                    } catch {
                        promise(.failure(error))
                    }
                }
            }
        }.eraseToAnyPublisher()
    }


}
