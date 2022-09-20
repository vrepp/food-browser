//
//  FoodListView.swift
//  FoodBrowser
//
//  Created by Valentin Rep on 21.09.2022..
//

import UIKit

final class FoodListView: UIView {
    // MARK: Properties
    private(set) lazy var searchBar: UISearchBar = {
        let searchBar = UISearchBar()

        return searchBar
    }()

    private(set) lazy var tableView: UITableView = {
        let tableView = UITableView()
        tableView.register(cellType: FoodListTableViewCell.self)
        tableView.tableFooterView = UIView()

        return tableView
    }()

    private(set) lazy var errorStack: UIStackView = {
        let stackView = UIStackView()
            .styleAxis(.vertical)
            .styleAlignment(.center)

        return stackView
    }()

    private(set) lazy var activityIndicationView = UIActivityIndicatorView(style: .large)

    // MARK: UIView Lifecycle
    init() {
        super.init(frame: .zero)

        setupUI()
    }

    @available(*, unavailable)
    override init(frame: CGRect) {
        fatalError("init(frame:) has not been implemented")
    }

    @available(*, unavailable)
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    // MARK: Setup
    private func setupUI() {
        backgroundColor = .systemBackground

        errorStack
            .styleParentView(self)
            .styleMakeConstraints {
                $0.top.equalTo(safeAreaLayoutGuide.snp.top)
                $0.leading.trailing.equalTo(safeAreaLayoutGuide)
            }

        UILabel()
            .styleParentView(errorStack)
            .styleText(nil)

        searchBar
            .styleParentView(self)
            .styleMakeConstraints {
//                $0.top.equalTo(safeAreaLayoutGuide.snp.top)
                $0.top.equalTo(errorStack.snp.bottom)
                $0.leading.trailing.equalTo(safeAreaLayoutGuide)
            }

        tableView
            .styleParentView(self)
            .styleMakeConstraints {
                $0.top.equalTo(searchBar.snp.bottom)
                $0.leading.trailing.equalTo(safeAreaLayoutGuide)
                $0.bottom.equalTo(safeAreaLayoutGuide.snp.bottom)
            }

        activityIndicationView
            .styleParentView(self)
            .styleMakeConstraints { $0.center.equalToSuperview() }
    }
}

extension FoodListView {
    // MARK: Constants
    private struct Constants {
        static let stackViewSpacing: CGFloat = 20
    }
}
