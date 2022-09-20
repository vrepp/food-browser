//
//  AnyMainView.swift
//  FoodBrowser
//
//  Created by Valentin Rep on 20.09.2022..
//

import UIKit

public protocol AnyMainView {
    associatedtype MainView: UIView
}

public extension AnyMainView where Self: UIViewController {
    /// return view as MainView type
    var mainView: MainView {
        guard let mainView = view as? MainView else {
            fatalError("Expected view to be of type \(MainView.self) but got \(type(of: view)) instead")
        }

        return mainView
    }
}
