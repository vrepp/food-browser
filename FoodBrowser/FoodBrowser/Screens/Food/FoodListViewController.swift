//
//  FoodListViewController.swift
//  FoodBrowser
//
//  Created by Valentin Rep on 21.09.2022..
//

import UIKit
import Combine

final class FoodListViewController: UIViewController, AnyMainView {
    // MARK: AmyMainView
    typealias MainView = FoodListView

    typealias DataSource = UITableViewDiffableDataSource<Int, Food>
    typealias Snapshot = NSDiffableDataSourceSnapshot<Int, Food>

    private var viewModel: FoodListViewModel
    private var cancellables: Set<AnyCancellable> = []
    private var dataSource: DataSource!

    // MARK: UIViewController Lifecycle
    init(viewModel: FoodListViewModel) {
        self.viewModel = viewModel

        super.init(nibName: nil, bundle: nil)
    }

    @available(*, unavailable)
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    override func loadView() {
        view = MainView()
    }

    override func viewDidLoad() {
        super.viewDidLoad()

        configureDataSource()
        bindInput()
        bindOutput()
    }

    // MARK: DataSource
    private func configureDataSource() {
        dataSource = DataSource(tableView: mainView.tableView, cellProvider: { tableView, indexPath, model -> UITableViewCell? in
            let cell = tableView.dequeueReusableCell(with: FoodListTableViewCell.self, for: indexPath)
            cell.bind(with: model)
            
            return cell
        })
    }

    // MARK: Binding
    private func bindInput() {
        mainView.searchBar.delegate = self
        mainView.tableView.delegate = self
    }

    private func bindOutput() {
        viewModel.$title
            .receive(on: RunLoop.main)
            .assign(to: \.title, on: navigationItem)
            .store(in: &cancellables)

        viewModel.$foodList
            .receive(on: RunLoop.main)
            .sink { [weak self] in
                var snapshot = Snapshot()
                snapshot.appendSections([0])
                snapshot.appendItems($0)
                self?.dataSource.applySnapshotUsingReloadData(snapshot)
            }
            .store(in: &cancellables)

        viewModel.$state
            .receive(on: RunLoop.main)
            .sink { [weak self] state in
                switch state {
                    case .loading:
                        self?.mainView.activityIndicationView.startAnimating()
                    case .finished:
                        self?.mainView.activityIndicationView.stopAnimating()
                    case .failed(let error):
                        self?.mainView.activityIndicationView.stopAnimating()
                        self?.showError(error)
                }
            }
            .store(in: &cancellables)
    }
}

// MARK: - UISearchBarDelegate
extension FoodListViewController: UISearchBarDelegate {

    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        viewModel.searchQuery = searchText
    }

    func searchBarCancelButtonClicked(_ searchBar: UISearchBar) {
        viewModel.searchQuery = ""
    }
}

// MARK: - UITableViewDelegate
extension FoodListViewController: UITableViewDelegate {

    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let snapshot = dataSource.snapshot()
        let model = snapshot.itemIdentifiers[indexPath.row]
        tableView.deselectRow(at: indexPath, animated: true)

        showMessage(model.name)
    }

    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        mainView.searchBar.resignFirstResponder()
    }
}
