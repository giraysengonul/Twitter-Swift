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
    
    func fetchTweets(completion: @escaping([Tweet]) -> Void){
        var tweets = [Tweet]()
        REF_TWEETS.observe(.childAdded) { snapshot in
            guard let dictionary = snapshot.value as? [String: Any] else { return }
            guard let uid = dictionary["uid"] as? String else{ return }
            let tweetID = snapshot.key
            UserService.fetchUser(uid: uid) { user in
                let tweet = Tweet(user: user, tweetID: tweetID, dictionary: dictionary)
                tweets.append(tweet)
                completion(tweets)
            }
        }
    }
    
}

