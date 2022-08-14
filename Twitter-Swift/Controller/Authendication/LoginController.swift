//
//  LoginController.swift
//  Twitter-Swift
//
//  Created by hakkı can şengönül on 14.08.2022.
//

import UIKit

class LoginController: UIViewController {
    // MARK: - PROPERTIES
    private let logoImageView : UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFit
        imageView.clipsToBounds = true
        imageView.image = #imageLiteral(resourceName: "TwitterLogo")
        return imageView
    }()
    private lazy var emailContainerView : UIView = {
        let image = #imageLiteral(resourceName: "ic_mail_outline_white_2x-1")
        let view = Utilities().inputContainerView(with: image,textField: emailTextField)
        return view
    }()
    private lazy var passwordContainerView : UIView = {
        let image = #imageLiteral(resourceName: "ic_lock_outline_white_2x")
        let view = Utilities().inputContainerView(with: image,textField: passwordTextField)
        return view
    }()
    private let emailTextField: UITextField = {
        let textField = Utilities().textField(withPlaceholder: "Email", withSecurity: false)
        return textField
    }()
    private let passwordTextField: UITextField = {
        let textField = Utilities().textField(withPlaceholder: "Password", withSecurity: true)
        return textField
    }()
    // MARK: - LIFECYCLE
    override func viewDidLoad() {
        super.viewDidLoad()
        setup()
        layout()
        view.backgroundColor = .twitterColor
        navigationController?.navigationBar.isHidden = true
        navigationController?.navigationBar.barStyle = .black
    }
}

// MARK: - HELPERS
extension LoginController{
    private func setup(){
        //logoImageView Setup
        view.addSubview(logoImageView)
        logoImageView.translatesAutoresizingMaskIntoConstraints = false
        //stackView (email and password TextField) Setup
        let stackView = UIStackView(arrangedSubviews: [emailContainerView, passwordContainerView])
        stackView.axis = .vertical
        stackView.spacing = 8
        view.addSubview(stackView)
        stackView.translatesAutoresizingMaskIntoConstraints = false
        //stackView Layout
        NSLayoutConstraint.activate([
            stackView.topAnchor.constraint(equalTo: logoImageView.bottomAnchor,constant: 8),
            stackView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor,constant: 10),
            stackView.trailingAnchor.constraint(equalTo: view.trailingAnchor,constant: -10)
        ])
        
    }
    private func layout(){
        //logoImageView Layout
        NSLayoutConstraint.activate([
            logoImageView.centerXAnchor.constraint(equalTo: view.safeAreaLayoutGuide.centerXAnchor),
            logoImageView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 0),
            logoImageView.widthAnchor.constraint(equalToConstant: 150),
            logoImageView.heightAnchor.constraint(equalToConstant: 150)
            
        ])
        
    }
}
