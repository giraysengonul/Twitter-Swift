//
//  UploadTweetController.swift
//  Twitter-Swift
//
//  Created by hakkı can şengönül on 19.09.2022.
//

import UIKit
class UploadTweetController: UIViewController {
    // MARK: - Properties
    private let user: User
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
    private let profileImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFill
        imageView.clipsToBounds = true
        imageView.layer.cornerRadius = 48 / 2
        return imageView
    }()
    private let stackView = UIStackView()
    private let captionTextView = CaptionTextView()
    // MARK: - Lifecycle
    init(user: User) {
        self.user = user
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
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
        //StackView Style
        stackView.axis = .horizontal
        stackView.spacing = 12
        stackView.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(stackView)
        //profileImageView Style
        profileImageView.translatesAutoresizingMaskIntoConstraints = false
        profileImageView.sd_setImage(with: user.profileImageUrl)
        stackView.addArrangedSubview(profileImageView)
        //captionTextView Style
        captionTextView.translatesAutoresizingMaskIntoConstraints = false
        stackView.addArrangedSubview(captionTextView)
    }
    private func layout(){
        //profileImageView Layout
        NSLayoutConstraint.activate([
            profileImageView.heightAnchor.constraint(equalToConstant: 48),
            profileImageView.widthAnchor.constraint(equalToConstant: 48),
        ])
        //captionTextView Layout
        NSLayoutConstraint.activate([
            stackView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 16),
            stackView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 16),
            stackView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: 16)
        ])
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
        guard let caption = captionTextView.text else { return }
        TweetService.shared.uploadTweet(caption: caption) { error, ref in
            if let error = error {
                print("Failed to upload tweet width error : \(error.localizedDescription)")
                return
            }
            self.dismiss(animated: true)
        }
    }
}
