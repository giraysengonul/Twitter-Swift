//
//  ProfileHeader.swift
//  Twitter-Swift
//
//  Created by hakkı can şengönül on 7.10.2022.
//

import UIKit
class ProfileHeader: UICollectionReusableView {
    // MARK: - Properties
    private lazy var containerView: UIView = {
        let view = UIView()
        view.backgroundColor = .twitterColor
        backButton.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(backButton)
        NSLayoutConstraint.activate([
            backButton.heightAnchor.constraint(equalToConstant: 30),
            backButton.widthAnchor.constraint(equalToConstant: 30),
            backButton.topAnchor.constraint(equalTo: view.topAnchor, constant: 42),
            backButton.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 16)
        ])
        return view
    }()
    private lazy var backButton: UIButton = {
        let button = UIButton(type: .system)
        let image = #imageLiteral(resourceName: "baseline_arrow_back_white_24dp")
        button.setImage(image.withRenderingMode(.alwaysOriginal), for: .normal)
        button.addTarget(self, action: #selector(handleDismissal), for: .touchUpInside)
        return button
    }()
    private let profileImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.clipsToBounds = true
        imageView.contentMode = .scaleToFill
        imageView.backgroundColor = .lightGray
        imageView.layer.borderColor = UIColor.white.cgColor
        imageView.layer.borderWidth = 4
        return imageView
    }()
    private lazy var editProfileFollowButton: UIButton = {
        let button = UIButton(type: .system)
        button.setTitle("Follow", for: .normal)
        button.setTitleColor(UIColor.twitterColor, for: .normal)
        button.layer.borderColor = UIColor.twitterColor.cgColor
        button.layer.borderWidth = 1.25
        button.titleLabel?.font = .boldSystemFont(ofSize: 14)
        button.addTarget(self, action: #selector(handleEditPtofileFollw), for: .touchUpInside)
        return button
    }()
    private let fullnameLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.boldSystemFont(ofSize: 20)
        label.text = "Hakkı"
        return label
    }()
    private let usernameLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 16)
        label.textColor = .lightGray
        label.text = "@Hakkı"
        return label
    }()
    private let bioLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 16)
        label.numberOfLines = 3
        label.text = "This is a user bio This is a user bio This is a user bio This is a user bio"
        return label
    }()
    private lazy var userDetailStack = UIStackView(arrangedSubviews: [fullnameLabel,usernameLabel,bioLabel])
    // MARK: - Lifecycle
    override init(frame: CGRect) {
        super.init(frame: frame)
        style()
        layout()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
// MARK: - Helpers
extension ProfileHeader{
    private func style(){
        //containerView style
        containerView.translatesAutoresizingMaskIntoConstraints = false
        addSubview(containerView)
        //profileImageView style
        profileImageView.translatesAutoresizingMaskIntoConstraints = false
        profileImageView.layer.cornerRadius = 80 / 2
        addSubview(profileImageView)
        //editProfileFollowButton style
        editProfileFollowButton.translatesAutoresizingMaskIntoConstraints = false
        editProfileFollowButton.layer.cornerRadius = 36 / 2
        addSubview(editProfileFollowButton)
        //userDetailStack style
        userDetailStack.translatesAutoresizingMaskIntoConstraints = false
        userDetailStack.axis = .vertical
        userDetailStack.distribution = .fillProportionally
        userDetailStack.spacing = 4
        addSubview(userDetailStack)
    }
    private func layout(){
        //containerView layout
        NSLayoutConstraint.activate([
            containerView.heightAnchor.constraint(equalToConstant: 108),
            containerView.topAnchor.constraint(equalTo: topAnchor),
            containerView.leadingAnchor.constraint(equalTo: leadingAnchor),
            trailingAnchor.constraint(equalTo: containerView.trailingAnchor)
        ])
        //profileImageView layout
        NSLayoutConstraint.activate([
            profileImageView.heightAnchor.constraint(equalToConstant: 80),
            profileImageView.widthAnchor.constraint(equalToConstant: 80),
            profileImageView.topAnchor.constraint(equalTo: containerView.bottomAnchor, constant: -24),
            profileImageView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 8)
        ])
        //editProfileFollowButton layout
        NSLayoutConstraint.activate([
            editProfileFollowButton.heightAnchor.constraint(equalToConstant: 36),
            editProfileFollowButton.widthAnchor.constraint(equalToConstant: 100),
            editProfileFollowButton.topAnchor.constraint(equalTo: containerView.bottomAnchor, constant: 12),
            trailingAnchor.constraint(equalTo: editProfileFollowButton.trailingAnchor, constant: 12)
        ])
        //userDetailStack layout
        NSLayoutConstraint.activate([
            userDetailStack.topAnchor.constraint(equalTo: profileImageView.bottomAnchor, constant: 8),
            userDetailStack.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 12),
            trailingAnchor.constraint(equalTo: userDetailStack.trailingAnchor, constant: 12)
        ])
    }
}
// MARK: - Selectors
extension ProfileHeader{
    @objc func handleDismissal(_ sender: UIButton){
        
    }
    @objc func handleEditPtofileFollw(_ sender: UIButton){
        
    }
}
