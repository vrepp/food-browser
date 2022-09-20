//
//  FoodCoordinator.swift
//  FoodBrowser
//
//  Created by Valentin Rep on 20.09.2022..
//

import UIKit

final class FoodCoordinator: AnyCoordinator {
    var childCoordinators: [AnyCoordinator] = []
    var navigationController: UINavigationController

    weak var parentCoordinator: AnyCoordinator?

    init(navigationController: UINavigationController) {
        self.navigationController = navigationController
    }

    func start() {
        let viewModel = FoodListViewModel()
        let viewController = FoodListViewController(viewModel: viewModel)

        self.navigationController.setViewControllers([viewController], animated: false)
        self.navigationController.navigationBar.prefersLargeTitles = true
    }


}
