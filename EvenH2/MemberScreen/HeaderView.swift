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
    let stackView = UIStackView()

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
        stackView.translatesAutoresizingMaskIntoConstraints = false

        stackView.axis = .vertical
        stackView.spacing = 5
        stackView.addArrangedSubview(nameLabel)
        stackView.addArrangedSubview(subLabel)
        
        addSubview(profileImage)
        addSubview(stackView)
        
        NSLayoutConstraint.activate([
            profileImage.leadingAnchor.constraint(equalTo: self.leadingAnchor),
            profileImage.topAnchor.constraint(equalTo: self.topAnchor),
            profileImage.bottomAnchor.constraint(equalTo: self.bottomAnchor),
            profileImage.widthAnchor.constraint(equalToConstant: 170)
        ])
        
        NSLayoutConstraint.activate([
            stackView.centerYAnchor.constraint(equalTo: self.centerYAnchor),
            stackView.leadingAnchor.constraint(equalTo: profileImage.trailingAnchor, constant: 8),
            stackView.trailingAnchor.constraint(equalTo: self.trailingAnchor)
        ])
    }
    
    func configure(with header: MemberHeader) {
        //profileImage.image = UIImage(named: header.profileImage)
        profileImage.image = UIImage(named: "profile")
        
        nameLabel.font = UIFont.dmSans(size: 40, weight: .bold)
        nameLabel.textColor = UIColor.w900
        nameLabel.text = header.name
        
        subLabel.font = UIFont.dmSans(size: 16, weight: .regular)
        subLabel.textColor = UIColor.w300
        subLabel.text = header.personalGoal
    }
}