//
//  MainTabController.swift
//  Twitter-Swift
//
//  Created by hakkı can şengönül on 13.08.2022.
//

import UIKit
import FirebaseAuth
class MainTabController: UITabBarController {
    // MARK: - PROPERTIES
    var user: User? {
        didSet{
            guard let nav = viewControllers?[0] as? UINavigationController else{ return }
            guard let feed = nav.viewControllers.first as? FeedController else{ return }
            feed.user = user
        }
    }
    lazy var actionButton: UIButton = {
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
        authenticateUserAndConfigureUI()
        view.backgroundColor = .twitterColor
        //        do{
        //            try Auth.auth().signOut()
        //            authenticateUserAndConfigureUI()
        //        }catch{
        //
        //        }
        view.backgroundColor = .white
        view.addSubview(actionButton)
        actionButton.translatesAutoresizingMaskIntoConstraints = false
    }
    
}
// MARK: - Helpers
extension MainTabController{
    private func setup(){
        let feed = templateNavigationController(image: UIImage(named: "home_unselected")!, rootViewController: FeedController(collectionViewLayout: UICollectionViewFlowLayout()))
        
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
}
// MARK: - Action
extension MainTabController{
    @objc func handleActionTapped()  {
        guard let user = user else { return }
        let controller = UploadTweetController(user: user)
        let nav = UINavigationController(rootViewController: controller)
        nav.modalPresentationStyle = .fullScreen
        present(nav, animated: true)
    }
    
    // MARK: - API
    func authenticateUserAndConfigureUI(){
        if Auth.auth().currentUser == nil{
            DispatchQueue.main.async {
                let nav = UINavigationController(rootViewController: LoginController())
                nav.modalPresentationStyle = .fullScreen
                self.present(nav, animated: true)
            }
        }else{
            setup()
            layout()
            fetchUser()
        }
    }
    func fetchUser() {
        UserService.fetchUser { user in
            self.user = user
        }
    }
}
