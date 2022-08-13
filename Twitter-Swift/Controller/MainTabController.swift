//
//  MainTabController.swift
//  Twitter-Swift
//
//  Created by hakkı can şengönül on 13.08.2022.
//

import UIKit

class MainTabController: UITabBarController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setup()
        view.backgroundColor = .white
        
    }
    
}
extension MainTabController{
    private func setup(){
        let feed = templateNavigationController(image: UIImage(named: "home_unselected")!, rootViewController: FeedController())
        
        let explore = templateNavigationController(image: UIImage(named: "search_unselected")!, rootViewController: ExploreController())
        
        let notifications = templateNavigationController(image: UIImage(named: "search_unselected")!, rootViewController: NotificationsController())
        
        let conversation = templateNavigationController(image: UIImage(named: "search_unselected")!, rootViewController: ConversationsController())
        
        viewControllers = [feed, explore, notifications, conversation]
        
    }
    
    func templateNavigationController(image: UIImage, rootViewController: UIViewController)-> UINavigationController{
        
        let nav = UINavigationController(rootViewController: rootViewController)
        nav.tabBarItem.image = image
        nav.navigationBar.barTintColor = .white
        let navigationAppearance = UINavigationBarAppearance()
        navigationAppearance.backgroundColor = .secondarySystemBackground
        nav.navigationBar.compactAppearance = navigationAppearance
        nav.navigationBar.standardAppearance = navigationAppearance
        nav.navigationBar.scrollEdgeAppearance = navigationAppearance
        let tabbarAppearance = UITabBarAppearance()
        tabbarAppearance.backgroundColor = .secondarySystemGroupedBackground
        nav.tabBarItem.standardAppearance = tabbarAppearance
        nav.tabBarItem.scrollEdgeAppearance = tabbarAppearance
        
        return nav
    }
    
}
