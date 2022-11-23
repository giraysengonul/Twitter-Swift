//
//  ProfileFilterCell.swift
//  Twitter-Swift
//
//  Created by hakkı can şengönül on 21.11.2022.
//

import UIKit
class ProfileFilterCell: UICollectionViewCell {
    // MARK: - Properties
    private let titleLabel: UILabel = {
        let label = UILabel()
        label.textColor = .lightGray
        label.font = UIFont.systemFont(ofSize: 14)
        label.text = "Text"
        return label
    }()
    override var isSelected: Bool{
        didSet{
            titleLabel.font = isSelected ? UIFont.boldSystemFont(ofSize: 16): UIFont.systemFont(ofSize: 14)
            titleLabel.textColor = isSelected ? .twitterColor : .lightGray
        }
    }
    // MARK: - Lifecycle
    override init(frame: CGRect) {
        super.init(frame: frame)
        backgroundColor = .white
        setup()
        layout()
    }
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
// MARK: - Helpers
extension ProfileFilterCell{
    private func setup(){
        //titleLabel style
        titleLabel.translatesAutoresizingMaskIntoConstraints = false
        addSubview(titleLabel)
    }
    private func layout(){
        //titleLabel layout
        NSLayoutConstraint.activate([
            titleLabel.centerXAnchor.constraint(equalTo: centerXAnchor),
            titleLabel.centerYAnchor.constraint(equalTo: centerYAnchor),
        ])
    }
}
