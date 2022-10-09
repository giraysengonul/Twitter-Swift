//
//  FeedController.swift
//  Twitter-Swift
//
//  Created by hakkı can şengönül on 13.08.2022.
//

import UIKit
import SDWebImage
private let reuseIdentifier = "TweetCell"
class FeedController: UICollectionViewController {
    // MARK: - PROPERTIES
    var user: User? {
        didSet {
            configureLeftBarButton()
        }
    }
    private var tweets = [Tweet]() {
        didSet { self.collectionView.reloadData() }
    }
    private let profileImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFill
        imageView.layer.cornerRadius = 32 / 2
        imageView.clipsToBounds = true
        return imageView
    }()
    
    // MARK: - LIFECYCLE
    override func viewDidLoad() {
        super.viewDidLoad()
        setup()
        layout()
        fetchTweet()
    }
}
// MARK: - API
extension FeedController{
    func fetchTweet() {
        TweetService.shared.fetchTweets { tweets in
            self.tweets = tweets
        }
    }
}
// MARK: - HELPERS
extension FeedController{
    private func setup(){
        collectionView.register(TweetCell.self, forCellWithReuseIdentifier: reuseIdentifier)
        collectionView.backgroundColor = .white
        let imageView = UIImageView(image: UIImage(named: "twitter_logo_blue"))
        imageView.contentMode = .scaleAspectFit
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.heightAnchor.constraint(equalToConstant: 44).isActive = true
        imageView.widthAnchor.constraint(equalToConstant: 44).isActive = true
        navigationItem.titleView = imageView
    }
    private func layout(){
        
    }
    private func configureLeftBarButton(){
        //profileImageView Style
        guard let user = user else { return }
        profileImageView.sd_setImage(with: user.profileImageUrl)
        profileImageView.translatesAutoresizingMaskIntoConstraints = false
        navigationItem.leftBarButtonItem = UIBarButtonItem(customView: profileImageView)
        //profileImageView Layout
        NSLayoutConstraint.activate([
            profileImageView.heightAnchor.constraint(equalToConstant: 32),
            profileImageView.widthAnchor.constraint(equalToConstant: 32),
        ])
    }
}
// MARK: - UICollectionViewDelegate/DataSource
extension FeedController{
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return tweets.count
    }
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: reuseIdentifier, for: indexPath) as! TweetCell
        cell.tweet = tweets[indexPath.row]
        cell.delegate = self
        return cell
    }
}
// MARK: - UICollectionViewDelegateFlowLayout
extension FeedController: UICollectionViewDelegateFlowLayout{
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: view.frame.width, height: 120)
    }
}
// MARK: - TweetCellDelegate
extension FeedController: TweetCellDelegate{
    func handleProfileImageTapped(_ cell: TweetCell) {
        let controller = ProfileController(collectionViewLayout: UICollectionViewFlowLayout())
        navigationController?.pushViewController(controller, animated: true)
    }
}
