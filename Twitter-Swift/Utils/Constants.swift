//
//  Constants.swift
//  Twitter-Swift
//
//  Created by hakkı can şengönül on 21.08.2022.
//

import FirebaseDatabase
import FirebaseStorage

let STORAGE_REF = Storage.storage().reference()
let STRORAGE_PROFILE_IMAGES = STORAGE_REF.child("profile_images")
let DB_REF = Database.database().reference()
let REF_USERS = DB_REF.child("user")
let REF_TWEETS = DB_REF.child("tweets")
