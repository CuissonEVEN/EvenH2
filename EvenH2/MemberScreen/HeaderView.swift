//
//  HeaderView.swift
//  EvenH2
//
//  Created by miranda on 10/23/24.
//

import UIKit

final class HeaderView: UICollectionReusableView {
    static let id = "HeaderView"
    
    private let profileImage = UIImageView()
    private let nameLabel = UILabel()
    private let subLabel = UILabel()

    override init(frame: CGRect) {
        super.init(frame: frame)
        setUI()
    }
    
    required init(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    private func setUI() {
        profileImage.translatesAutoresizingMaskIntoConstraints = false
        nameLabel.translatesAutoresizingMaskIntoConstraints = false
        subLabel.translatesAutoresizingMaskIntoConstraints = false
        
        addSubview(profileImage)
        addSubview(nameLabel)
        addSubview(subLabel)
        
        NSLayoutConstraint.activate([
            profileImage.leadingAnchor.constraint(equalTo: self.leadingAnchor),
            profileImage.topAnchor.constraint(equalTo: self.topAnchor),
            profileImage.bottomAnchor.constraint(equalTo: self.bottomAnchor),
            profileImage.widthAnchor.constraint(equalToConstant: 60)
        ])

        NSLayoutConstraint.activate([
            nameLabel.topAnchor.constraint(equalTo: self.topAnchor),
            nameLabel.trailingAnchor.constraint(equalTo: self.trailingAnchor),
            nameLabel.leadingAnchor.constraint(equalTo: profileImage.trailingAnchor, constant: 8)
        ])

        NSLayoutConstraint.activate([
            subLabel.topAnchor.constraint(equalTo: nameLabel.bottomAnchor, constant: 8),
            subLabel.leadingAnchor.constraint(equalTo: profileImage.trailingAnchor, constant: 8),
            subLabel.trailingAnchor.constraint(equalTo: self.trailingAnchor)
        ])
    }
}
