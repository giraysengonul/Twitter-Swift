//
//  MainTabController.swift
//  Twitter-Swift
//
//  Created by hakkı can şengönül on 13.08.2022.
//

import UIKit

class MainTabController: UITabBarController {
    // MARK: - PROPERTIES
    let actionButton: UIButton = {
        let button = UIButton(type: .system)
        button.tintColor = .white
        button.backgroundColor = .twitterColor
        button.setImage(UIImage(named: "new_tweet"), for: .normal)
        button.addTarget(self, action: #selector(handleActionTapped), for: .touchUpInside)
        return button
        
    }()
    
    
    // MARK: - LIFECYCLE
    override func viewDidLoad() {
        super.viewDidLoad()
        setup()
        layout()
        view.backgroundColor = .white
        view.addSubview(actionButton)
        actionButton.translatesAutoresizingMaskIntoConstraints = false
    }
    
}
extension MainTabController{
    private func setup(){
        let feed = templateNavigationController(image: UIImage(named: "home_unselected")!, rootViewController: FeedController())
        
        let explore = templateNavigationController(image: UIImage(named: "search_unselected")!, rootViewController: ExploreController())
        
        let notifications = templateNavigationController(image: UIImage(named: "like_unselected")!, rootViewController: NotificationsController())
        
        let conversation = templateNavigationController(image: UIImage(named: "ic_mail_outline_white_2x-1")!, rootViewController: ConversationsController())
        
        viewControllers = [feed, explore, notifications, conversation]
        //ActionButton Added
        view.addSubview(actionButton)
        actionButton.translatesAutoresizingMaskIntoConstraints = false
        actionButton.layer.cornerRadius = 56 / 2
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
    
    private func layout(){
        //ActionsButton Layout
        NSLayoutConstraint.activate([
            
            actionButton.heightAnchor.constraint(equalToConstant: 56),
            actionButton.widthAnchor.constraint(equalToConstant: 56),
            actionButton.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: -64),
            actionButton.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -16)
            
        ])
        
        
    }
    @objc func handleActionTapped()  {
        print("Action Button")
    }
    
}
