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
    let profileImageUrl: String
    let username: String
    let uid: String
    init(uid: String,dictionary: [String : AnyObject]) {
        self.uid = uid
        self.fullname = dictionary["fullname"] as? String ?? ""
        self.email = dictionary["email"] as? String ?? ""
        self.profileImageUrl = dictionary["profileImageUrl"] as? String ?? ""
        self.username = dictionary["username"] as? String ?? ""
    }
}
