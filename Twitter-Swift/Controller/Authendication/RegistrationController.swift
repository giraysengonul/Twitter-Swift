//
//  RegistrationController.swift
//  Twitter-Swift
//
//  Created by hakkı can şengönül on 14.08.2022.
//

import UIKit
import FirebaseAuth
import FirebaseCore
import FirebaseDatabase


class RegistrationController: UIViewController {
    // MARK: - PROPERTIES
    private lazy var imagePicker = UIImagePickerController()
    private var profileImage: UIImage?
    private lazy var plusPhotoButton: UIButton = {
        let button = UIButton(type: .system)
        button.setImage(UIImage(named: "plus_photo"), for: .normal)
        button.tintColor = .white
        button.addTarget(self, action: #selector(handleAddProfilePhoto), for: .touchUpInside)
        return button
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
    private lazy var fullnameContainerView : UIView = {
        let image = #imageLiteral(resourceName: "ic_person_outline_white_2x")
        let view = Utilities().inputContainerView(with: image,textField: fullnameTextField)
        return view
    }()
    private lazy var usernameContainerView : UIView = {
        let image = #imageLiteral(resourceName: "ic_person_outline_white_2x")
        let view = Utilities().inputContainerView(with: image,textField: usernameTextField)
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
    private let fullnameTextField: UITextField = {
        let textField = Utilities().textField(withPlaceholder: "Fullname", withSecurity: false)
        return textField
    }()
    private let usernameTextField: UITextField = {
        let textField = Utilities().textField(withPlaceholder: "Username", withSecurity: false)
        return textField
    }()
    private lazy var alreadyHaveAccountButton : UIButton = {
        let button = Utilities().attributedButton("Alredy have an account?", " Log In")
        button.addTarget(self, action: #selector(handleShowLogin), for: .touchUpInside)
        return button
    }()
    private lazy var registerButton : UIButton = {
        let button = UIButton(type: .system)
        button.setTitle("Sign Up", for: .normal)
        button.setTitleColor(UIColor.twitterColor, for: .normal)
        button.backgroundColor = .white
        button.layer.cornerRadius = 10
        button.titleLabel?.font = UIFont.preferredFont(forTextStyle: .title2)
        button.addTarget(self, action: #selector(handleRegister), for: .touchUpInside)
        button.clipsToBounds = true
        button.translatesAutoresizingMaskIntoConstraints = false
        button.heightAnchor.constraint(equalToConstant: 50).isActive = true
        return button
    }()
    // MARK: - LIFECYCLE
    override func viewDidLoad() {
        super.viewDidLoad()
        setup()
        layout()
    }
}

// MARK: - HELPERS
extension RegistrationController{
    private func setup(){
        imagePicker.delegate = self
        imagePicker.allowsEditing = true
        view.backgroundColor = .twitterColor
        //plusPhotoButton Setup
        view.addSubview(plusPhotoButton)
        plusPhotoButton.translatesAutoresizingMaskIntoConstraints = false
        //stackView (email and password TextField) Setup
        let stackView = UIStackView(arrangedSubviews: [emailContainerView, passwordContainerView, fullnameContainerView, usernameContainerView,registerButton])
        stackView.axis = .vertical
        stackView.spacing = 20
        stackView.distribution = .fillEqually
        view.addSubview(stackView)
        stackView.translatesAutoresizingMaskIntoConstraints = false
        //stackView Layout
        NSLayoutConstraint.activate([
            stackView.topAnchor.constraint(equalTo: plusPhotoButton.bottomAnchor, constant: 20),
            
            stackView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor,constant: 10),
            stackView.trailingAnchor.constraint(equalTo: view.trailingAnchor,constant: -10)
        ])
        //alreadyHaveAccountButton Setup
        view.addSubview(alreadyHaveAccountButton)
        alreadyHaveAccountButton.translatesAutoresizingMaskIntoConstraints = false
    }
    private func layout(){
        //plusPhotoButton Layout
        NSLayoutConstraint.activate([
            plusPhotoButton.centerXAnchor.constraint(equalTo: view.safeAreaLayoutGuide.centerXAnchor),
            plusPhotoButton.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 0),
            plusPhotoButton.widthAnchor.constraint(equalToConstant: 150),
            plusPhotoButton.heightAnchor.constraint(equalToConstant: 150)
            
        ])
        //alreadyHaveAccountButton Layout
        NSLayoutConstraint.activate([
            alreadyHaveAccountButton.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            alreadyHaveAccountButton.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: -16)
            
            
        ])
        
    }
}

// MARK: - ACTIONS
extension RegistrationController{
    
    @objc func handleShowLogin(){
        navigationController?.popViewController(animated: true)
    }
    @objc func handleAddProfilePhoto(){
        present(imagePicker, animated: true)
    }
    @objc func handleRegister(){
        guard let profileImage = profileImage else { return }
        guard let email = emailTextField.text else { return }
        guard let password = passwordTextField.text else { return }
        guard let fullname = fullnameTextField.text else { return }
        guard let username = usernameTextField.text?.lowercased() else { return }
        print("Debug: email: \(email) , password: \(password)")
        let credentials = AuthCredentials(email: email, password: password, fullname: fullname, username: username, profileImage: profileImage)
        AuthService.shared.registerUser(withCredential: credentials) { error, ref in
            if error == nil{
                print("DEBUG: Successfully updated user information.")
            }
            self.dismiss(animated: true)
        }
        
    }
}


extension RegistrationController: UIImagePickerControllerDelegate, UINavigationControllerDelegate{
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        guard let image = info[.editedImage] as? UIImage else {
            return
        }
        profileImage = image
        self.plusPhotoButton.setImage(image.withRenderingMode(.alwaysOriginal), for: .normal)
        plusPhotoButton.layer.cornerRadius = 150 / 2
        plusPhotoButton.clipsToBounds = true
        dismiss(animated: true)
    }
    
}
