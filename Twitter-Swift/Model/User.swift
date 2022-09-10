//
//  User.swift
//  Twitter-Swift
//
//  Created by hakkı can şengönül on 10.09.2022.
//

import Foundation
struct User{
    let email: String
    let fullname: String
    var profileImageUrl: URL?
    let username: String
    let uid: String
    init(uid: String,dictionary: [String : AnyObject]) {
        self.uid = uid
        self.fullname = dictionary["fullname"] as? String ?? ""
        self.email = dictionary["email"] as? String ?? ""
        self.username = dictionary["username"] as? String ?? ""
        if let profileImageUrlString = dictionary["profileImageUrl"] as? String {
            guard let url = URL(string: profileImageUrlString) else { return }
            self.profileImageUrl = url
        }
        
    }
}
