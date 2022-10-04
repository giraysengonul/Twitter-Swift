//
//  FeedController.swift
//  Twitter-Swift
//
//  Created by hakkı can şengönül on 13.08.2022.
//

import UIKit
import SDWebImage

class FeedController: UIViewController {
    // MARK: - PROPERTIES
    var user: User? {
        didSet {
            configureLeftBarButton()
        }
    }
    private let profileImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFit
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
            print(tweets)
        }
    }
}
// MARK: - HELPERS
extension FeedController{
    private func setup(){
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
