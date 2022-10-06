//
//  TweetCell.swift
//  Twitter-Swift
//
//  Created by hakkı can şengönül on 4.10.2022.
//

import UIKit
class TweetCell: UICollectionViewCell {
    // MARK: - Properties
    var tweet: Tweet? {
        didSet{ configure() }
    }
    private let profileImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.backgroundColor = .twitterColor
        imageView.contentMode = .scaleAspectFill
        imageView.layer.cornerRadius = 48 / 2
        imageView.clipsToBounds = true
        imageView.heightAnchor.constraint(equalToConstant: 48).isActive = true
        imageView.widthAnchor.constraint(equalToConstant: 48).isActive = true
        return imageView
    }()
    private let stackView = UIStackView()
    private let captionLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 16)
        label.numberOfLines = 0
        label.text = "Some Text Caption.."
        return label
    }()
    private let infoLabel = UILabel()
    private lazy var commentButton: UIButton = {
        let button = UIButton(type: .system)
        button.setImage(UIImage(named: "comment")?.withRenderingMode(.alwaysOriginal), for: .normal)
        button.tintColor = .darkGray
        button.heightAnchor.constraint(equalToConstant: 20).isActive = true
        button.widthAnchor.constraint(equalToConstant: 20).isActive = true
        button.addTarget(self, action: #selector(handleCommentTapped), for: .touchUpInside)
        return button
    }()
    private lazy var retweetButton: UIButton = {
        let button = UIButton(type: .system)
        button.setImage(UIImage(named: "retweet")?.withRenderingMode(.alwaysOriginal), for: .normal)
        button.tintColor = .darkGray
        button.heightAnchor.constraint(equalToConstant: 20).isActive = true
        button.widthAnchor.constraint(equalToConstant: 20).isActive = true
        button.addTarget(self, action: #selector(handleRetweetTapped), for: .touchUpInside)
        return button
    }()
    private lazy var likeButton: UIButton = {
        let button = UIButton(type: .system)
        button.setImage(UIImage(named: "like")?.withRenderingMode(.alwaysOriginal), for: .normal)
        button.tintColor = .darkGray
        button.heightAnchor.constraint(equalToConstant: 20).isActive = true
        button.widthAnchor.constraint(equalToConstant: 20).isActive = true
        button.addTarget(self, action: #selector(handleLikeTapped), for: .touchUpInside)
        return button
    }()
    private lazy var shareButton: UIButton = {
        let button = UIButton(type: .system)
        button.setImage(UIImage(named: "share")?.withRenderingMode(.alwaysOriginal), for: .normal)
        button.tintColor = .darkGray
        button.heightAnchor.constraint(equalToConstant: 20).isActive = true
        button.widthAnchor.constraint(equalToConstant: 20).isActive = true
        button.addTarget(self, action: #selector(handleShareTapped), for: .touchUpInside)
        return button
    }()
    private let actionStackView = UIStackView()
    private let underlineView = UIView()
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
extension TweetCell{
    private func style(){
        backgroundColor = .white
        //profileImageView Style
        profileImageView.translatesAutoresizingMaskIntoConstraints = false
        addSubview(profileImageView)
        //stackView Style
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.axis = .vertical
        stackView.distribution = .fillProportionally
        stackView.spacing = 4
        addSubview(stackView)
        //infoLabel Style
        infoLabel.text = "Hakki Can ŞENGÖNÜL"
        infoLabel.font = UIFont.systemFont(ofSize: 14)
        infoLabel.translatesAutoresizingMaskIntoConstraints = false
        stackView.addArrangedSubview(infoLabel)
        //captionLabel Style
        captionLabel.translatesAutoresizingMaskIntoConstraints = false
        stackView.addArrangedSubview(captionLabel)
        //underlineView Style
        underlineView.backgroundColor = .systemGroupedBackground
        underlineView.translatesAutoresizingMaskIntoConstraints = false
        addSubview(underlineView)
        //actionStackView Style
        actionStackView.translatesAutoresizingMaskIntoConstraints = false
        actionStackView.axis = .horizontal
        actionStackView.spacing = 72
        addSubview(actionStackView)
        //commentButton Style
        commentButton.translatesAutoresizingMaskIntoConstraints = false
        actionStackView.addArrangedSubview(commentButton)
        //retweetButton Style
        retweetButton.translatesAutoresizingMaskIntoConstraints = false
        actionStackView.addArrangedSubview(retweetButton)
        //likeButton Style
        likeButton.translatesAutoresizingMaskIntoConstraints = false
        actionStackView.addArrangedSubview(likeButton)
        //shareButton Style
        shareButton.translatesAutoresizingMaskIntoConstraints = false
        actionStackView.addArrangedSubview(shareButton)
    }
    private func layout(){
        //profileImageView Layout
        NSLayoutConstraint.activate([
            profileImageView.topAnchor.constraint(equalTo: topAnchor, constant: 8),
            profileImageView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 8)
        ])
        //underlineView Layout
        underlineView.heightAnchor.constraint(equalToConstant: 1).isActive = true
        NSLayoutConstraint.activate([
            bottomAnchor.constraint(equalTo: underlineView.bottomAnchor),
            underlineView.leadingAnchor.constraint(equalTo: leadingAnchor),
            trailingAnchor.constraint(equalTo: underlineView.trailingAnchor),
        ])
        //stackView Layout
        NSLayoutConstraint.activate([
            stackView.topAnchor.constraint(equalTo: profileImageView.topAnchor),
            stackView.leadingAnchor.constraint(equalTo: profileImageView.trailingAnchor, constant: 12),
            trailingAnchor.constraint(equalTo: stackView.trailingAnchor, constant: 12)
        ])
        //actionStackView Layout
        NSLayoutConstraint.activate([
            actionStackView.centerXAnchor.constraint(equalTo: centerXAnchor),
            bottomAnchor.constraint(equalTo: actionStackView.bottomAnchor, constant: 8)
        ])
    }
    private func configure(){
        guard let tweet = tweet else{ return }
        captionLabel.text = tweet.caption
        profileImageView.sd_setImage(with: tweet.user.profileImageUrl)
        infoLabel.text = tweet.user.username
    }
}
// MARK: - Selectors
extension TweetCell{
    @objc func handleCommentTapped(_ sender: UIButton){
        
    }
    @objc func handleRetweetTapped(_ sender: UIButton){
        
    }
    @objc func handleLikeTapped(_ sender: UIButton){
        
    }
    @objc func handleShareTapped(_ sender: UIButton){
        
    }
}
