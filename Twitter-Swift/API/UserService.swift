//
//  UserService.swift
//  Twitter-Swift
//
//  Created by hakkı can şengönül on 4.09.2022.
//

import Foundation
import FirebaseAuth

struct UserService {
    
    static func fetchUser(){
        guard let uid = Auth.auth().currentUser?.uid else { return }
        REF_USERS.child(uid).observeSingleEvent(of: .value) { snapshot in
        guard let dictionary = snapshot.value as? [String: Any] else{ return }
            guard let username = dictionary["username"] as? String else { return }
            print(username)
        }
    }
}