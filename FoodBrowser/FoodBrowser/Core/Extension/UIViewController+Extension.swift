//
//  UIViewController+Extension.swift
//  FoodBrowser
//
//  Created by Valentin Rep on 20.09.2022..
//

import UIKit

extension UIViewController {
    /// Show error Alert
    func showError(_ error: Error) {
        showErrorMessage(error.localizedDescription)
    }

    /// Show error Alert with message
    func showErrorMessage(_ message: String) {
        let alertViewController = UIAlertController(title: "Error".localized(), message: message, preferredStyle: .alert)
        alertViewController.addAction(UIAlertAction(title: "OK".localized(), style: .default))
        present(alertViewController, animated: true)
    }
}
