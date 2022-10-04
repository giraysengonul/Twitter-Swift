//
//  Tweet.swift
//  Twitter-Swift
//
//  Created by hakkı can şengönül on 4.10.2022.
//

import Foundation
struct Tweet{
    let caption: String
    let tweetID: String
    let uid: String
    let likes: Int
    var timestamp: Date!
    let retweetCount: Int
    init(tweetID: String, dictionary: [String: Any]) {
        self.caption = dictionary["caption"] as? String ?? ""
        self.tweetID = tweetID
        self.uid = dictionary["uid"] as? String ?? ""
        self.likes = dictionary["likes"] as? Int ?? 0
        self.retweetCount = dictionary["retweets"] as? Int ?? 0
        if let timestamp = dictionary["timestamp"] as? Double{
            self.timestamp = Date(timeIntervalSince1970: timestamp)
        }
    }
}
