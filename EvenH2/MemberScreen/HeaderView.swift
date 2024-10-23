//
//  HeaderView.swift
//  EvenH2
//
//  Created by miranda on 10/23/24.
//

import UIKit

final class HeaderView: UICollectionReusableView {
    static let id = "HeaderView"
    
    let profileImage = UIImageView()
    let nameLabel = UILabel()
    let subLabel = UILabel()

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
            profileImage.widthAnchor.constraint(equalToConstant: 120)
        ])

        NSLayoutConstraint.activate([
            nameLabel.centerYAnchor.constraint(equalTo: profileImage.centerYAnchor, constant: -10),
            nameLabel.trailingAnchor.constraint(equalTo: self.trailingAnchor),
            nameLabel.leadingAnchor.constraint(equalTo: profileImage.trailingAnchor, constant: 8)
        ])
        
        NSLayoutConstraint.activate([
            subLabel.centerYAnchor.constraint(equalTo: profileImage.centerYAnchor, constant: 10),
            subLabel.leadingAnchor.constraint(equalTo: profileImage.trailingAnchor, constant: 8),
            subLabel.trailingAnchor.constraint(equalTo: self.trailingAnchor)
        ])
    }
}
