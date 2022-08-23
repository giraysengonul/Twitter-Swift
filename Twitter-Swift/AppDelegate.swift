//
//  AppDelegate.swift
//  Twitter-Swift
//
//  Created by hakkı can şengönül on 13.08.2022.
//

import UIKit
import FirebaseCore
@main
class AppDelegate: UIResponder, UIApplicationDelegate {
    var window : UIWindow?
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        FirebaseApp.configure()
        window = UIWindow()
        window!.rootViewController = MainTabController()
        window!.makeKeyAndVisible()
        return true
    }

}

