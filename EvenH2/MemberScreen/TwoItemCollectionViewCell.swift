//
//  TwoItemCollectionViewCell.swift
//  EvenH2
//
//  Created by miranda on 10/23/24.
//

import UIKit

final class TwoItemCollectionViewCell: UICollectionViewCell {
    static let id = "TwoItemCollectionViewCell"
    
    private let roundView = UIView()
    private let contentLabel = UILabel()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setUI()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setUI() {
        roundView.translatesAutoresizingMaskIntoConstraints = false
        contentLabel.translatesAutoresizingMaskIntoConstraints = false
        
        addSubview(roundView)
        addSubview(contentLabel)
        
        //roundView.backgroundColor = UIColor.pointSy
        roundView.layer.borderColor = UIColor.w200.cgColor
        roundView.layer.borderWidth = 1
        roundView.layer.cornerRadius = 5
        
        NSLayoutConstraint.activate([
            roundView.leadingAnchor.constraint(equalTo: self.leadingAnchor),
            roundView.trailingAnchor.constraint(equalTo: self.trailingAnchor),
            roundView.topAnchor.constraint(equalTo: self.topAnchor),
            roundView.bottomAnchor.constraint(equalTo: self.bottomAnchor)
        ])
        
        NSLayoutConstraint.activate([
            contentLabel.centerXAnchor.constraint(equalTo: contentView.centerXAnchor),
            contentLabel.centerYAnchor.constraint(equalTo: contentView.centerYAnchor)
        ])
    }
    
    func configure(content: String) {
        contentLabel.font = UIFont.dmSans(size: 14, weight: .bold)
        contentLabel.textColor = UIColor.w800
        contentLabel.text = content
    }
}
