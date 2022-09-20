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
        showMessage(error.localizedDescription, isError: false)
    }

    /// Show Alert with message
    func showMessage(_ message: String, isError: Bool = false) {
        let alertViewController = UIAlertController(
            title: isError ? "Error".localized() : nil,
            message: message,
            preferredStyle: .alert
        )
        alertViewController.addAction(UIAlertAction(title: "OK".localized(), style: .default))

        present(alertViewController, animated: true)
    }
}
