//
//  NotificationsController.swift
//  Twitter-Swift
//
//  Created by hakkı can şengönül on 13.08.2022.
//


import UIKit

class NotificationsController: UIViewController {
    // MARK: - PROPERTIES
    
    
    // MARK: - LIFECYCLE
    override func viewDidLoad() {
        super.viewDidLoad()
        setup()
        layout()
    }
}
// MARK: - HELPERS
extension NotificationsController{
    private func setup(){
        navigationItem.title = "Notifications"
    }
    private func layout(){
        
    }
}
