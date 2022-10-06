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
    var timestamp: String{
       let formatter = DateComponentsFormatter()
        formatter.allowedUnits = [.second, .minute, .hour, .day, .weekOfMonth]
        formatter.maximumUnitCount = 1
        formatter.unitsStyle = .abbreviated
        let now = Date()
        return formatter.string(from: tweet.timestamp, to: now)  ?? "2d"
    }
    var userInfoText: NSMutableAttributedString{
        let text = NSMutableAttributedString(string: user.fullname, attributes: [.font: UIFont.boldSystemFont(ofSize: 14)])
        text.append(NSAttributedString(string: " @\(user.username)", attributes: [.font: UIFont.systemFont(ofSize: 14), .foregroundColor: UIColor.lightGray]))
        text.append(NSAttributedString(string: " ・ \(timestamp)", attributes: [.font: UIFont.systemFont(ofSize: 14), .foregroundColor: UIColor.lightGray]))
        return text
    }
    init(tweet: Tweet) {
        self.tweet = tweet
        self.user = tweet.user
    }
}
