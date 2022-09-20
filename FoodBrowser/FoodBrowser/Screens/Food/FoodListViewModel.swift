//
//  FoodListViewModel.swift
//  FoodBrowser
//
//  Created by Valentin Rep on 20.09.2022..
//

import Foundation
import Combine

final class FoodListViewModel {
    enum ViewState {
        case loading
        case failed(Error)
        case finished
    }

    @Published var searchQuery: String = ""

    @Published private(set) var title: String?
    @Published private(set) var state: ViewState = .finished
    @Published private(set) var foodList: [Food] = []

    private let service: FoodServiceProtocol

    private var cancellables: Set<AnyCancellable> = []

    init(service: FoodServiceProtocol = FoodService()) {
        self.service = service

        self.title = "food.list.title".localized()

        bind()
    }

    private func bind() {
        $searchQuery
            .receive(on: RunLoop.main)
            .debounce(for: .seconds(0.3), scheduler: RunLoop.main)
            .sink { [weak self] in self?.fetchFood($0) }
            .store(in: &cancellables)
    }

    private func fetchFood(_ searchQuery: String) {
        state = .loading

        service.fetch(query: searchQuery)
            .sink { [weak self] completion in
                switch completion {
                    case .finished:
                        self?.state = .finished

                    case .failure(let error):
                        self?.foodList = []
                        self?.state = .failed(error)
                }
            } receiveValue: { [weak self] in
                self?.foodList = $0
            }
            .store(in: &cancellables)

    }
}
