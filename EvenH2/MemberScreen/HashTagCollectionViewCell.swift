//
//  HashTagCollectionViewCell.swift
//  EvenH2
//
//  Created by miranda on 10/23/24.
//

import UIKit

final class HashTagCollectionViewCell: UICollectionViewCell {
    static let id = "HashTagCollectionViewCell"
    
    @IBOutlet weak var hashtagLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }

    func configure(with hashtag: String) {
        hashtagLabel.text = hashtag
    }
}
