//
//  CaptionTextView.swift
//  Twitter-Swift
//
//  Created by hakkı can şengönül on 4.10.2022.
//

import UIKit

class CaptionTextView: UITextView {
    // MARK: - Properties
    private let placeHolderLabel: UILabel = {
        let label = UILabel()
        label.text = "What's happining?"
        label.font = UIFont.systemFont(ofSize: 16)
        label.textColor = .darkGray
        return label
    }()
    // MARK: - Lifecycle
    override init(frame: CGRect, textContainer: NSTextContainer?) {
        super.init(frame: frame, textContainer: textContainer)
        style()
        layout()
    }
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

// MARK: - Helpers
extension CaptionTextView{
    private func style(){
        backgroundColor = .white
        font = UIFont.systemFont(ofSize: 16)
        isScrollEnabled = false
        heightAnchor.constraint(equalToConstant: 300).isActive = true
        // placeHolderLabel Style
        placeHolderLabel.translatesAutoresizingMaskIntoConstraints = false
        addSubview(placeHolderLabel)
        NotificationCenter.default.addObserver(self, selector: #selector(handleTextInputChange), name: UITextView.textDidChangeNotification, object: nil)
    }
    private func layout(){
        // placeHolderLabel Layout
        NSLayoutConstraint.activate([
            placeHolderLabel.topAnchor.constraint(equalTo: topAnchor, constant: 8),
            placeHolderLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 4)
        ])
        
    }
}
// MARK: - Selectors
extension CaptionTextView{
    @objc func handleTextInputChange(){
        placeHolderLabel.isHidden = !text.isEmpty
    }
}
