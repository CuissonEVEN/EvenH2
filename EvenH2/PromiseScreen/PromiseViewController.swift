//
//  PromiseViewController.swift
//  EvenH2
//  나영진
//  Created by CHYUN on 10/22/24.
//

import UIKit

class PromiseViewController: UIViewController {
    
    var promiseArray: [PromiseData] = []
    
    // MVC패턴, 데이터매니저를 프로미스뷰데이터매니저에 담는다, promiseArray가 뷰데이터매니저한테 배열요청
    var promiseViewDataManager = PromiseDataManager()
    
    @IBOutlet weak var promiseTableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        promiseTableView.dataSource = self
        promiseTableView.rowHeight = 130
        
        // 인디케이터 숨기기
        promiseTableView.showsVerticalScrollIndicator = false
        // 세로 스크롤 인디케이터 숨김
        // 테이블 뷰를 뷰에 추가
        self.view.addSubview(promiseTableView)
        
        //PromiseDataManager에 데이터 요청 get~
        promiseViewDataManager.makePromiseData()
        promiseArray = promiseViewDataManager.getPromiseData()
        
        }
    }
    
extension PromiseViewController: UITableViewDataSource {
        
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return promiseArray.count
        
    }
        
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
            
        let cell = tableView.dequeueReusableCell(withIdentifier: "PromiseViewCell", for: indexPath) as! PromiseViewCell
        
        let promise = promiseArray[indexPath.row]
        
        // 특정글자 색상 변경
        let fullText = promise.promiseDescription
        let attributedString = NSMutableAttributedString(string: fullText)
        let wordsToHighlight = ["출석체크", "TIL 제출", "퇴실체크", "카메라", "마이크", "상태메세지", "언제든 서로 이야기", "Git 컨벤션", "16.0"]
       
        for word in wordsToHighlight {
            
            if let range = fullText.range(of: word) {
               let nsRange = NSRange(range, in: fullText)
               attributedString.addAttribute(.foregroundColor, value: UIColor.red, range: nsRange)
            }
        }
                
            cell.profileImageView.image = promise.profileImage
            cell.promiseNumberLable.text = promise.promiseName
            cell.descriptionLabel.attributedText = attributedString
//          색상변경 코드가 들어가면서 위 코드로 변경됨
//          cell.descriptionLabel.text = promise.promiseDescription
           // 셀 선택효과 삭제
            cell.selectionStyle = .none
        
            return cell
    }
}
