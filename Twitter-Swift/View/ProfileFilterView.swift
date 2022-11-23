//
//  ProfileFilterView.swift
//  Twitter-Swift
//
//  Created by hakkı can şengönül on 21.11.2022.
//

import UIKit
private let reuseIdentifier = "ProfileFilterCell"
class ProfileFilterView: UIView {
    // MARK: - Properties
    private lazy var collectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        collectionView.backgroundColor = .white
        collectionView.delegate = self
        collectionView.dataSource = self
        return collectionView
    }()
    // MARK: - LifeCycle
    override init(frame: CGRect) {
        super.init(frame: frame)
        style()
        layout()
        collectionView.register(ProfileFilterCell.self, forCellWithReuseIdentifier: reuseIdentifier)
    }
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
// MARK: - Helpers
extension ProfileFilterView{
    private func style(){
        //collectionView style
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        addSubview(collectionView)
    }
    private func layout(){
        //collectionView layout
        NSLayoutConstraint.activate([
            collectionView.topAnchor.constraint(equalTo: topAnchor),
            collectionView.leadingAnchor.constraint(equalTo: leadingAnchor),
            bottomAnchor.constraint(equalTo: collectionView.bottomAnchor),
            trailingAnchor.constraint(equalTo: collectionView.trailingAnchor)
        ])
    }
}
// MARK: - UICollectionViewDelegate,UICollectionViewDataSource
extension ProfileFilterView: UICollectionViewDelegate, UICollectionViewDataSource{
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 3
    }
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: reuseIdentifier, for: indexPath) as! ProfileFilterCell
        return cell
    }
    
}
// MARK: - UICollectionViewDelegateFlowLayout
extension ProfileFilterView: UICollectionViewDelegateFlowLayout{
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: frame.width / 3, height: frame.height)
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return 0
    }
}
