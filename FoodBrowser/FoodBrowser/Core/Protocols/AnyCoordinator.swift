//
//  AnyCoordinator.swift
//  FoodBrowser
//
//  Created by Valentin Rep on 20.09.2022..
//

import UIKit

public protocol AnyCoordinator: AnyObject {
    var childCoordinators: [AnyCoordinator] { get set }
    var navigationController: UINavigationController { get }

    func start()
}

public extension AnyCoordinator {

    func addChild(_ coordinator: AnyCoordinator) {
        childCoordinators.append(coordinator)
    }

    func removeChild(_ coordinator: AnyCoordinator?) {
        guard let coordinator = coordinator, childCoordinators.isEmpty == false
        else { return }

        self.childCoordinators = self.childCoordinators.filter { $0 !== coordinator }
    }
}
