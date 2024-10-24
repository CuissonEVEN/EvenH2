//
//  IntroduceYourselfCollectionViewCell.swift
//  EvenH2
//
//  Created by miranda on 10/23/24.
//

import UIKit

class IntroduceYourselfCollectionViewCell: UICollectionViewCell {
    static let id = "IntroduceYourselfCollectionViewCell"
    
    let contentLabel = UILabel()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setUI()
    }
    
    required init(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setUI() {
        contentLabel.translatesAutoresizingMaskIntoConstraints = false
        contentLabel.numberOfLines = 0
        contentLabel.lineBreakMode = .byTruncatingTail
        
        addSubview(contentLabel)
        
        NSLayoutConstraint.activate([
            contentLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 10),
            contentLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -10),
            contentLabel.topAnchor.constraint(equalTo: topAnchor, constant: 10),
            contentLabel.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -10)
        ])
    }
    
    func configure(content: String) {
        contentLabel.font = UIFont.dmSans(size: 14, weight: .regular)
        contentLabel.textColor = UIColor.w600
        contentLabel.text = content
    }
}
