//
//  AppCoordinator.swift
//  FoodBrowser
//
//  Created by Valentin Rep on 20.09.2022..
//

import UIKit

final class AppCoordinator: NSObject, AnyCoordinator {
    var childCoordinators: [AnyCoordinator] = []
    let navigationController: UINavigationController

    private let window: UIWindow

    init(window: UIWindow, navigationController: UINavigationController = UINavigationController()) {
        self.window = window
        self.navigationController = navigationController
    }

    func start() {
        navigationController.delegate = self

        let childCoordinator = FoodCoordinator(navigationController: navigationController)
        addChild(childCoordinator)
        childCoordinator.parentCoordinator = self
        childCoordinator.start()

        window.rootViewController = navigationController
        window.makeKeyAndVisible()
    }
}

extension AppCoordinator: UINavigationControllerDelegate {
    
    func navigationController(_ navigationController: UINavigationController, didShow viewController: UIViewController, animated: Bool) {
        guard
            let fromViewController = navigationController.transitionCoordinator?.viewController(forKey: .from),
            !navigationController.viewControllers.contains(fromViewController)
        else { return }

        // Remove Child Coordinator when RootViewController pops from Navigation Stack
        if let childCoordinator = childCoordinators.first(where: { $0.navigationController.viewControllers.first === fromViewController }) {
            removeChild(childCoordinator)
        }
    }
}
