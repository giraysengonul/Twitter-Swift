//
//  AuthService.swift
//  Twitter-Swift
//
//  Created by hakkı can şengönül on 21.08.2022.
//

import Foundation
import UIKit
import FirebaseAuth
import FirebaseDatabase
struct AuthCredentials {
    let email : String
    let password: String
    let fullname: String
    let username: String
    let profileImage: UIImage
}
struct AuthService {
    static let shared = AuthService()
    
    func logUserIn(withEmail email : String, withPassword password: String, comletion: @escaping(AuthDataResult?, Error?)-> Void )  {
        Auth.auth().signIn(withEmail: email, password: password, completion: comletion)
    }
    
    func registerUser(withCredential credentials: AuthCredentials, completion: @escaping(Error?, DatabaseReference) -> Void)  {
        let email = credentials.email
        let password = credentials.password
        let username = credentials.username
        let fullname = credentials.fullname
        guard let imageData = credentials.profileImage.jpegData(compressionQuality: 0.3) else{return}
        let fileName = UUID().uuidString
        let storageRef = STRORAGE_PROFILE_IMAGES.child("\(fileName).jpg")
        storageRef.putData(imageData,metadata: nil) { metadata, error in
            storageRef.downloadURL { url, error in
                guard let profileImageUrl = url?.absoluteString else {return}
                Auth.auth().createUser(withEmail: email, password: password) { result, error in
                    if  error != nil {
                        print("Debug: \(String(describing: error?.localizedDescription))")
                        return
                    }
                    print("Debug: Successfully registered user")
                    guard let userId = result?.user.uid else { return }
                    let values = ["email": email, "username": username,"fullname" : fullname, "profileImageUrl": profileImageUrl]
                    REF_USERS.child(userId).updateChildValues(values, withCompletionBlock: completion)
                    
                }
                
            }
        }
    }
}
