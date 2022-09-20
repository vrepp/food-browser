//
//  FoodListTableViewCell.swift
//  FoodBrowser
//
//  Created by Valentin Rep on 21.09.2022..
//

import UIKit

final class FoodListTableViewCell: UITableViewCell {
    // MARK: Properties
    private lazy var nameLabel: UILabel = {
        let label = UILabel()
            .styleNumberOfLines(0)
            .styleFont(.preferredFont(forTextStyle: .headline))
            .styleTextColor(.label)

        return label
    }()

    private lazy var brandLabel: UILabel = {
        let label = UILabel()
            .styleNumberOfLines(0)
            .styleFont(.preferredFont(forTextStyle: .subheadline))
            .styleTextColor(.secondaryLabel)

        return label
    }()

    private(set) lazy var caloriesLabel: UILabel = {
        let label = UILabel()
            .styleNumberOfLines(0)
            .styleFont(.preferredFont(forTextStyle: .subheadline))
            .styleTextColor(.systemIndigo)

        return label
    }()

    private(set) lazy var portionSizeLabel: UILabel = {
        let label = UILabel()
            .styleNumberOfLines(0)
            .styleFont(.preferredFont(forTextStyle: .subheadline))
            .styleTextColor(.systemIndigo)

        return label
    }()

    // MARK: UITableViewCell
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)

        setupUI()
    }

    required init?(coder: NSCoder) {
        super.init(coder: coder)

        setupUI()
    }

    override func awakeFromNib() {
        super.awakeFromNib()

        setupUI()
    }

//    override func prepareForReuse() {
//        super.prepareForReuse()
//
//    }

    // MARK: Setup
    private func setupUI() {
        let stackView = UIStackView()
            .styleAxis(.vertical)
            .styleSpacing(Constants.stackViewSpacing)
            .styleAlignment(.leading)
            .styleDistribution(.fill)
            .styleParentView(contentView)
            .styleMakeConstraints {
                $0.edges.equalTo(Constants.insets)
            }

        nameLabel
            .styleParentView(stackView)

//        brandLabel
//            .styleParentView(stackView)
//
//        UIStackView(arrangedSubviews: [caloriesLabel, portionSizeLabel])
//            .styleAxis(.horizontal)
//            .styleSpacing(Constants.internalSpacing)
//            .styleAlignment(.bottom)
//            .styleDistribution(.fill)
//            .styleParentView(stackView)
    }
}

extension FoodListTableViewCell {
    // MARK: Constants
    private struct Constants {
        static let insets = UIEdgeInsets(top: 20, left: 20, bottom: 20, right: 20)
        static let stackViewSpacing: CGFloat = 20
        static let internalSpacing: CGFloat = 10
    }
}

extension FoodListTableViewCell {
    // MARK: Bind model
    func bind(with model: Food) {
        nameLabel.text = model.name
    }
}
