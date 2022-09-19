//
//  UploadTweetController.swift
//  Twitter-Swift
//
//  Created by hakkı can şengönül on 19.09.2022.
//

import UIKit
class UploadTweetController: UIViewController {
    // MARK: - Properties
    private lazy var actionButton: UIButton = {
        let button = UIButton(type: .system)
        button.backgroundColor = .twitterColor
        button.setTitle("Tweet", for: .normal)
        button.titleLabel?.font = UIFont.boldSystemFont(ofSize: 16)
        button.titleLabel?.textAlignment = .center
        button.setTitleColor(UIColor.white, for: .normal)
        button.frame = CGRect(x: 0, y: 0, width: 64, height: 32)
        button.layer.cornerRadius = 32 / 2
        button.addTarget(self, action: #selector(handleUploadTweet), for: .touchUpInside)
        return button
    }()
    // MARK: - Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        style()
        layout()
    }
}
// MARK: - Helpers
extension UploadTweetController{
    private func style(){
        view.backgroundColor = .white
        configureNavigation()
    }
    private func layout(){
        
    }
}
// MARK: - Actions, Selectors
extension UploadTweetController{
    private func configureNavigation(){
        let appearance = UINavigationBarAppearance()
        appearance.backgroundColor = .white
        navigationController?.navigationBar.barTintColor = .white
        navigationController?.navigationBar.isTranslucent = false
        navigationController?.navigationBar.compactAppearance = appearance
        navigationController?.navigationBar.standardAppearance = appearance
        navigationController?.navigationBar.scrollEdgeAppearance = appearance
        navigationItem.leftBarButtonItem = UIBarButtonItem(barButtonSystemItem: .cancel, target: self, action: #selector(handleCancel))
        navigationItem.rightBarButtonItem = UIBarButtonItem(customView: actionButton)
    }
    @objc func handleCancel(_ sender: UIBarButtonItem){
        dismiss(animated: true)
    }
    @objc func handleUploadTweet(_ sender: UIButton){
        
    }
}
