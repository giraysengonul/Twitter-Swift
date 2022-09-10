//
//  UserService.swift
//  Twitter-Swift
//
//  Created by hakkı can şengönül on 4.09.2022.
//

import Foundation
import FirebaseAuth

struct UserService {
    
    static func fetchUser(completion: @escaping(User) -> Void){
        guard let uid = Auth.auth().currentUser?.uid else { return }
        REF_USERS.child(uid).observeSingleEvent(of: .value) { snapshot in
            guard let dictionary = snapshot.value as? [String: AnyObject] else{ return }
            let user = User(uid: uid, dictionary: dictionary)
            completion(user)
        }
    }
}
