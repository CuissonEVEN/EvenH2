//
//  VerticalHashtagCollectionViewCell.swift
//  EvenH2
//
//  Created by miranda on 10/23/24.
//

import UIKit

final class VerticalHashtagCollectionViewCell: UICollectionViewCell {
    static let id = "VerticalHashtagCollectionViewCell"
    
    private let hashtagView = UIView()
    private let hashtagLabel = UILabel()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setViews()
        setUpConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setViews() {
        hashtagView.backgroundColor = UIColor(named: "w100")
        hashtagView.layer.cornerRadius = 16
        hashtagView.layer.borderColor = UIColor(named: "w200")?.cgColor
        hashtagView.layer.borderWidth = 1
        
        hashtagLabel.textColor = UIColor(named: "w600")
        hashtagLabel.font = UIFont.dmSans(size: 16, weight: .regular)
        hashtagLabel.setContentCompressionResistancePriority(.defaultHigh, for: .horizontal) // 아이템이 너비를 조정할 수 있도록 높은 우선순위 설정
        
        contentView.addSubview(hashtagView)
        hashtagView.addSubview(hashtagLabel)
    }
    
    override func preferredLayoutAttributesFitting(_ layoutAttributes: UICollectionViewLayoutAttributes) -> UICollectionViewLayoutAttributes {
        let attributes = super.preferredLayoutAttributesFitting(layoutAttributes)
        
        let targetSize = CGSize(width: layoutAttributes.frame.width, height: CGFloat.greatestFiniteMagnitude)
        let autoSize = contentView.systemLayoutSizeFitting(targetSize, withHorizontalFittingPriority: .required, verticalFittingPriority: .fittingSizeLevel)
        
        attributes.frame.size.height = autoSize.height
        return attributes
    }
    
    private func setUpConstraints() {
        hashtagView.translatesAutoresizingMaskIntoConstraints = false
        hashtagLabel.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            hashtagView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
            hashtagView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor),
            hashtagView.topAnchor.constraint(equalTo: contentView.topAnchor),
            hashtagView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor),
            
            // 해시태그 레이블의 제약 조건
            hashtagLabel.centerYAnchor.constraint(equalTo: hashtagView.centerYAnchor),
            hashtagLabel.leadingAnchor.constraint(equalTo: hashtagView.leadingAnchor, constant: 20),
            hashtagLabel.trailingAnchor.constraint(equalTo: hashtagView.trailingAnchor, constant: -20),
            hashtagLabel.topAnchor.constraint(equalTo: hashtagView.topAnchor, constant: 5),
            hashtagLabel.bottomAnchor.constraint(equalTo: hashtagView.bottomAnchor, constant: -5)
        ])
    }
    
    func configure(with hashtagText: String) {
        hashtagLabel.text = hashtagText
        hashtagLabel.sizeToFit()
    }
}
