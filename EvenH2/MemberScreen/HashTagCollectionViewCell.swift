//
//  HashTagCollectionViewCell.swift
//  EvenH2
//
//  Created by miranda on 10/23/24.
//

import UIKit

final class HashTagCollectionViewCell: UICollectionViewCell {
    static let id = "HashTagCollectionViewCell"
    
    @IBOutlet weak var hashtagView: UIView!
    @IBOutlet weak var hashtagLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        hashtagView.backgroundColor = .w100
        hashtagView.layer.cornerRadius = 12
        hashtagView.layer.borderColor = UIColor.lightGray.cgColor
        hashtagView.layer.borderWidth = 1
    }

    func configure(with hashtagText: String) {
        hashtagLabel.textColor = UIColor.darkGray
        hashtagLabel.font = UIFont.dmSans(size: 15, weight: .black)
        hashtagLabel.text = hashtagText
    }
}
