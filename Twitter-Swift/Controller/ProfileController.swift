//
//  ProfileController.swift
//  Twitter-Swift
//
//  Created by hakkı can şengönül on 7.10.2022.
//

import UIKit
class ProfileController: UICollectionViewController {
    // MARK: - Properties
    // MARK: - Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        style()
        layout()
    }
}
// MARK: - Helpers
extension ProfileController{
    private func style(){
        collectionView.backgroundColor = .red
    }
    private func layout(){
        
    }
}
