//
//  Utilities.swift
//  Twitter-Swift
//
//  Created by hakkı can şengönül on 14.08.2022.
//

import UIKit

class Utilities {
    
    func inputContainerView(with image: UIImage, textField: UITextField) -> UIView{
        
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.heightAnchor.constraint(equalToConstant: 50).isActive = true
        let imageView  = UIImageView()
        imageView.image = image
        view.addSubview(imageView)
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.heightAnchor.constraint(equalToConstant: 24).isActive = true
        imageView.widthAnchor.constraint(equalToConstant: 24).isActive = true
        imageView.leadingAnchor.constraint(equalTo: view.leadingAnchor,constant: 8).isActive = true
        imageView.bottomAnchor.constraint(equalTo: view.bottomAnchor,constant: -8).isActive = true
        view.addSubview(textField)
        textField.translatesAutoresizingMaskIntoConstraints = false
        textField.leadingAnchor.constraint(equalTo: imageView.trailingAnchor, constant: 8).isActive = true
        textField.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: -8).isActive = true
        textField.trailingAnchor.constraint(equalTo: view.trailingAnchor).isActive = true
        let dividerView = UIView()
        view.addSubview(dividerView)
        dividerView.backgroundColor = .white
        dividerView.translatesAutoresizingMaskIntoConstraints = false
        dividerView.heightAnchor.constraint(equalToConstant: 1).isActive = true
        dividerView.leadingAnchor.constraint(equalTo: imageView.leadingAnchor, constant: 0).isActive = true
        dividerView.trailingAnchor.constraint(equalTo: textField.trailingAnchor).isActive = true
        dividerView.topAnchor.constraint(equalTo: textField.bottomAnchor, constant: 8).isActive = true
        
        return view
        
    }
    
    func textField(withPlaceholder placeHolder: String,withSecurity isSecureTextEntry : Bool) -> UITextField{
        let textField = UITextField()
        textField.textColor = .white
        textField.font = UIFont.systemFont(ofSize: 16)
        textField.adjustsFontSizeToFitWidth = true
        textField.isSecureTextEntry = isSecureTextEntry
        textField.attributedPlaceholder = NSAttributedString(string: placeHolder, attributes: [.foregroundColor : UIColor.white])
        return textField
    }
    
    
}
