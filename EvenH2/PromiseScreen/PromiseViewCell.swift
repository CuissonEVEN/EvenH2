//
//  PromiseViewCell.swift
//  EvenH2
//
//  Created by YoungJin on 10/23/24.
//

import UIKit

class PromiseViewCell: UITableViewCell {

    
    @IBOutlet weak var profileImageView: UIImageView!
    
    @IBOutlet weak var promiseNumberLable: UILabel!
    
    @IBOutlet weak var descriptionLabel: UILabel!
    
    @IBOutlet weak var cellUIView: UIView!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        // 이미지 동그랗게 만들기, 테두리 만들기
        profileImageView.layer.cornerRadius = profileImageView.frame.height / 2
        profileImageView.layer.masksToBounds = true
        cellUIView.layer.borderWidth = 1
        cellUIView.layer.borderColor = UIColor(named: "w500")?.cgColor
        cellUIView.layer.cornerRadius = 10
        
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

    }
}
