//
//  VerticalHashtagCollectionViewCell.swift
//  EvenH2
//
//  Created by miranda on 10/23/24.
//

import UIKit

final class VerticalHashtagCollectionViewCell: UICollectionViewCell {
    static let id = "HashTagCollectionViewCell"
    
    private let hashtagView = UIView()
    private let hashtagLabel = UILabel()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setUpViews()
        setUpConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setUpViews() {
        hashtagView.backgroundColor = UIColor(named: "w100")
        hashtagView.layer.cornerRadius = 20
        hashtagView.layer.borderColor = UIColor(named: "w200")?.cgColor
        hashtagView.layer.borderWidth = 1
        
        hashtagLabel.textColor = UIColor(named: "w600")
        hashtagLabel.font = UIFont.dmSans(size: 16, weight: .regular)
        
        contentView.addSubview(hashtagView)
        hashtagView.addSubview(hashtagLabel)
    }
    
    private func setUpConstraints() {
        hashtagView.translatesAutoresizingMaskIntoConstraints = false
        hashtagLabel.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            hashtagView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
            hashtagView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor),
            hashtagView.topAnchor.constraint(equalTo: contentView.topAnchor),
            hashtagView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor),
            hashtagView.widthAnchor.constraint(equalToConstant: 120),
            
            hashtagLabel.centerYAnchor.constraint(equalTo: hashtagView.centerYAnchor),
            hashtagLabel.centerXAnchor.constraint(equalTo: hashtagView.centerXAnchor)

        ])
    }
    
    func configure(with hashtagText: String) {
        hashtagLabel.text = hashtagText
    }
}
