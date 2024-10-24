//
//  PromiseDataManager.swift
//  EvenH2
//
//  Created by YoungJin on 10/23/24.
//

import UIKit

class PromiseDataManager {
    
    // 서버통신할때 보통 빈배열로 만들고 함수를 사용함
    var promiseDataArray: [PromiseData] = []
    
    // 배열을 만드는 함수 생성함,  named에 이미지 넣을 고민
    func makePromiseData() {
        promiseDataArray = [
            PromiseData(profileImage: UIImage (named: "ic_promise_morning.png"), promiseName: "첫 번째 !", promiseDescription: "9시 전 출석체크로 하루 시작 !"),
            PromiseData(profileImage: UIImage (named: "ic_promise_night.png"), promiseName: "두 번째 !", promiseDescription: "TIL 제출 및 퇴실체크로 하루를 마무리 해요 !"),
            PromiseData(profileImage: UIImage (named: "ic_promise_mic.png"), promiseName: "세 번째 !", promiseDescription: "카메라와 마이크는 꼭 켜요 ! \n(식사시간 제외)"),
            PromiseData(profileImage: UIImage (named: "ic_promise_msg.png"), promiseName: "네 번째 !", promiseDescription: "ZEP 상태메세지를 잘 활용해요 ! \n(화장실, 식사 등 대략적 복귀시간과 함께)"),
            PromiseData(profileImage: UIImage (named: "ic_promise_speak.png"), promiseName: "다섯 번째 !", promiseDescription: "건의사항 / 질문사항 / 개인일정 등 \n공유 사항은 언제든 서로 이야기해요 !"),
            PromiseData(profileImage: UIImage (named: "ic_promise_git.png"), promiseName: "여섯 번째 !", promiseDescription: "Git 컨벤션을 잘 지켜요 !"),
            PromiseData(profileImage: UIImage (named: "ic_promise_phone.png"), promiseName: "일곱 번째 !", promiseDescription: "Xcode는 16.0 버전으로 통일해요 !")
        ]
    }
    
    //PromiseData라는 구조체를 만들어놓아서 가능함
    func getPromiseData() -> [PromiseData] {
        return promiseDataArray
    }
}
