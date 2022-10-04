//
//  TweetService.swift
//  Twitter-Swift
//
//  Created by hakkı can şengönül on 4.10.2022.
//

import Foundation
import FirebaseAuth
import FirebaseDatabase

struct TweetService {
    static let shared = TweetService()
    func uploadTweet(caption: String, completion: @escaping(Error? ,DatabaseReference) ->Void){
        guard let uid = Auth.auth().currentUser?.uid else { return }
        let values = ["uid": uid, "timesTamp":Int(NSDate().timeIntervalSince1970), "likes": 0,"retweets":0, "caption": caption] as [String : Any]
        REF_TWEETS.childByAutoId().updateChildValues(values,withCompletionBlock:completion)
    }
}

