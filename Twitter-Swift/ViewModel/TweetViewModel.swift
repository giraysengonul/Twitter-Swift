//
//  TweetViewModel.swift
//  Twitter-Swift
//
//  Created by hakkı can şengönül on 6.10.2022.
//

import Foundation
import UIKit
struct TweetViewModel {
    let tweet: Tweet
    let user: User
    var profileImageUrl:URL?{
        return user.profileImageUrl
    }
    var userInfoText: NSMutableAttributedString{
        let text = NSMutableAttributedString(string: user.fullname, attributes: [.font: UIFont.boldSystemFont(ofSize: 14)])
        text.append(NSAttributedString(string: " @\(user.username)", attributes: [.font: UIFont.systemFont(ofSize: 14), .foregroundColor: UIColor.lightGray]))
        return text
    }
    init(tweet: Tweet) {
        self.tweet = tweet
        self.user = tweet.user
    }
}
