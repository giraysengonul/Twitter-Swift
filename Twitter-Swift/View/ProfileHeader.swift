//
//  ProfileHeader.swift
//  Twitter-Swift
//
//  Created by hakkı can şengönül on 7.10.2022.
//

import UIKit
class ProfileHeader: UICollectionReusableView {
    // MARK: - Properties
    // MARK: - Lifecycle
    override init(frame: CGRect) {
        super.init(frame: frame)
        style()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
// MARK: - Helpers
extension ProfileHeader{
    private func style(){
        backgroundColor = .lightGray
    }
}
