//
//  TweetCell.swift
//  Twitter-Swift
//
//  Created by hakkı can şengönül on 4.10.2022.
//

import UIKit
class TweetCell: UICollectionViewCell {
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
extension TweetCell{
    private func style(){
        backgroundColor = .red
    }
}
