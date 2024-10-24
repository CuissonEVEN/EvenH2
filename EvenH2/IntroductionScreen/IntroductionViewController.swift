//
//  IntroductionViewController.swift
//  EvenH2
//
//  Created by CHYUN on 10/22/24.
//  Assigned to DOYLE on 10/22/24.
//

import UIKit

class IntroductionViewController: UIViewController {

    @IBOutlet weak var firstLabel: UILabel!
    @IBOutlet weak var secondLabel: UILabel!
    @IBOutlet weak var thirdLabel: UILabel!

    override func viewDidLoad() {
        super.viewDidLoad()

        // 밑에 패딩 추가
        let padding: CGFloat = 165.0

        // UIImageView 생성 시 패딩을 고려한 프레임 설정
        let backgroundImage = UIImageView(frame: CGRect(
            x: 0,
            y: 0,
            width: self.view.bounds.width,
            height: self.view.bounds.height - padding
        ))
        
        backgroundImage.image = UIImage(named: "BG_introduction.png")
        backgroundImage.contentMode = .scaleAspectFill
        backgroundImage.clipsToBounds = true // 잘리는 부분 삭제
        
        self.view.insertSubview(backgroundImage, at: 0) // 이미지 뷰를 맨 뒤에 삽입

        
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

    }
}
