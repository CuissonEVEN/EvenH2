//
//  IntroductionViewController.swift
//  EvenH2
//
//  Created by CHYUN on 10/22/24.
//

// DOYLE - PUSH TEST

import UIKit

class IntroductionViewController: UIViewController {

    @IBOutlet weak var firstLabel: UILabel!
    @IBOutlet weak var secondLabel: UILabel!
    @IBOutlet weak var thirdLabel: UILabel!

    override func viewDidLoad() {
        super.viewDidLoad()

        // 배경 이미지 설정
        let backgroundImage = UIImageView(frame: self.view.bounds)
        backgroundImage.image = UIImage(named: "IntroductionBackground002.png")
        backgroundImage.contentMode = .scaleAspectFill
        backgroundImage.clipsToBounds = true
        self.view.insertSubview(backgroundImage, at: 0)

        // 레이블 텍스트 설정
        firstLabel.text = "팀원 모두가 고르게"
        secondLabel.text = "소통하며 함께 완성하는 팀"
        thirdLabel.text = "2븐하게 익은조!"

        // 레이블 폰트 설정
        firstLabel.font = UIFont.dmSans(size: 20, weight: .regular)
        secondLabel.font = UIFont.dmSans(size: 20, weight: .regular)
        thirdLabel.font = UIFont.dmSans(size: 42, weight: .bold)
        
        // 레이블 정렬 설정
        firstLabel.textAlignment = .left
        secondLabel.textAlignment = .left
        thirdLabel.textAlignment = .left

        // 스크롤 뷰 컨텐츠 크기 설정
        // scrollView.contentSize = CGSize(width: self.view.frame.size.width, height: 1000) // 원하는 높이 설정
    }
}
