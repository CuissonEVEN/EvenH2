//
//  MemberViewController.swift
//  EvenH2
//
//  Created by CHYUN on 10/22/24.
//
// 박채현

import UIKit

class MemberViewController: UIViewController, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    
    let members: [EvenMember] = [
        EvenMember(key: 1, enName: "Chae-Hyun Park", krName: "박채현", tmi: "동생이 지난 달에 전역함 👽", imgAssetName: "img_ch", hash: ["#ESTJ", "#적극적", "#리더십", "#KIA팬", "#팀장"],
                   introduction: "안녕하세요, 저는 2조의 팀장을 맡고 있는 박채현입니다. 본 소개 앱의 멤버 뷰를 맡았습니다. 팀원분들의 의견을 적극 수용하려 노력하며 작업을 진행하였습니다. 낯가림이 없어 빠르게 적응하고, 정리를 잘하는 것이 제 강점입니다. 협업할 때는 규칙을 지키는 것을 중요하게 생각하며, 의견을 적극적으로 제시하는 편입니다. 프로젝트가 원활히 진행될 수 있도록 팀을 이끄는 데 힘썼습니다. 2븐조 팀원이 제일 최고야!", role: "헤드 프레젠터",
                   blogUrlPath: "https://chhue96.tistory.com/", gitUrlPath: "https://github.com/chaehyunp"),
        
        EvenMember(key: 2, enName: "Si-Yeon Park", krName: "박시연", tmi: "집 앞 떡볶이 JMT 💕", imgAssetName: "img_sy", hash: ["#ISFJ", "#바지런함", "#부드러움", "#명예소방관", "#팀원"],
                   introduction: "안녕하세요, 2조 박시연입니다. 이번 소개 앱에서는 팀원 디테일 뷰를 맡았습니다. 멘탈케어와 간단한 코드 이슈를 함께 해결했습니다 :) 아침형 인간으로 시간 약속을 잘 지키는 것이 저의 장점입니다. 모르는 기능도 일단 시도해보는 편이며, 다른 사람의 의견이나 코드 스타일을 궁금해하고 적극 수용하는 협업 스타일을 가지고 있습니다.", role: "미니 튜터",
                   blogUrlPath: "https://velog.io/@sy0201", gitUrlPath: "https://github.com/sy0201"),
        
        EvenMember(key: 3, enName: "Doyle Hwang", krName: "황도일", tmi: "커피보다는 마테차 🍵", imgAssetName: "img_dy", hash: ["#INTP", "#분석적", "#섬세함", "#Git해결사", "#팀원"],
                   introduction: "안녕하세요! 2조의 깐죽 담당 황도일입니다. 시작 화면과 소개 뷰를 맡았습니다. 놓치기 쉬운 디테일을 보고 완성도를 높이기 위해 팀원을 귀찮게 하는 걸 좋아합니다 >:D 말을 예쁘게 하는 걸 중요하게 생각하고, 새로운 것을 빨리 배우는 편입니다. 협업에서는 먼저 친해지는 것이 중요하고, 위트는 소통의 윤활제라고 생각하고 있어요. 팀 내 분위기를 유쾌하게 유지하려고 노력했어요!", role: "바이브 매니저",
                   blogUrlPath: "https://velog.io/@doylehworks", gitUrlPath: "https://github.com/DoyleHWorks"),
        
        EvenMember(key: 4, enName: "Min-Seok Park", krName: "박민석", tmi: "아직 여름이불 덮는 중~ 💦", imgAssetName: "img_ms", hash: ["#INFP", "#침착함", "#끈기", "#포토그래퍼", "#팀원"],
                   introduction: "안녕하세요~ 2조 박민석입니다. 이번 프로젝트에서 목표 뷰를 맡았습니다! 팀원분들의 도움을 많~이 받으며 애써보았읍니다ㅎㅎ 끝까지 해보려는 자세가 저의 장점입니다. 팀원들의 아이디어를 긍정적으로 검토하는 협업 스타일을 갖고 있고, 긍정적인 태도로 함께 프로젝트를 이끌어가려고 노력했습니다!", role: "세션 리마인더",
                   blogUrlPath: "https://iosstudyletsgo.tistory.com/", gitUrlPath: "https://github.com/maxminseok"),
        
        EvenMember(key: 5, enName: "Young-Jin Na", krName: "나영진", tmi: "창문이 너무 커서 뜨거움 🌈", imgAssetName: "img_yj", hash: ["#INFJ", "#차분함", "#말 잘들음", "#산들바람", "#팀원"],
                   introduction: "안녕하세요, 2조 나영진입니다. 약속 뷰를 맡았습니다. 개발이 처음이지만 팀원분들의 많은 도움 덕분에 재미도 느끼고 잘 따라갈 수 있었습니다. 저는 경청을 잘하고, 집중력이 좋다는 강점을 가지고 있습니다. 협업을 할 때는 팀원들의 의견을 존중하며, 서로의 의견을 조율할 수 있는 방안을 고민하는 스타일입니다.", role: "디지털 전서구",
                   blogUrlPath: "https://yjuni22.tistory.com/", gitUrlPath: "https://github.com/bryjna07"),
        
        EvenMember(key: 6, enName: "Sang-Kyeong Jang", krName: "장상경", tmi: "애플워치 시리즈10 구매 😈", imgAssetName: "img_sk", hash: ["#INFJ", "#책임감", "#검색능력", "#귀여움은정의", "#팀원"],
                   introduction: "안녕하세요, 저는 2조에서 부발표자를 맡고 있는 장상경입니다. 이번 소개 앱에서는 탭 메뉴를 담은 메인뷰를 맡았습니다. 부족하지만 팀원분들과 최대한 협력하여 좋은 결과물이 나올 수 있도록 이끌고 따라가도록 하겠습니다. 책임감이 강하다는 것이 저의 장점이라 생각하며, 협업에서는 먼저 듣고 서포트하는 것을 선호합니다. 적극적으로 개입하기보다는 팀원들이 원활하게 작업할 수 있도록 돕고자 했습니다.", role: "프레젠트 코디네이터",
                   blogUrlPath: "https://velog.io/@crois0509/posts", gitUrlPath: "https://github.com/Crois0509")
    ]
    
    var collectionView: UICollectionView!

    override func viewDidLoad() {
        super.viewDidLoad()

        let layout = UICollectionViewFlowLayout()
        layout.sectionInset = UIEdgeInsets(top: 24, left: 16, bottom: 0, right: 16) // 양쪽 패딩 16 포인트
        layout.minimumInteritemSpacing = 8 // 아이템 간의 가로 간격
        layout.minimumLineSpacing = 16 // 아이템 간의 세로 간격
        collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        collectionView.showsHorizontalScrollIndicator = false // 가로 스크롤 인디케이터 숨기기
        collectionView.showsVerticalScrollIndicator = false // 세로 스크롤 인디케이터 숨기기
        view.addSubview(collectionView)
        
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        collectionView.topAnchor.constraint(equalTo: view.topAnchor).isActive = true
        collectionView.leadingAnchor.constraint(equalTo: view.leadingAnchor).isActive = true
        collectionView.trailingAnchor.constraint(equalTo: view.trailingAnchor).isActive = true
        collectionView.bottomAnchor.constraint(equalTo: view.bottomAnchor).isActive = true
        
        collectionView.dataSource = self
        collectionView.delegate = self
        collectionView.register(CustomCell.self, forCellWithReuseIdentifier: "cell")
        
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return members.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath) as! CustomCell
        let name = members[indexPath.row].getEnName()
        let tmi = members[indexPath.row].getTmi()
        let imgAssetName = members[indexPath.row].getImgAssetName()
        cell.memberImageView.image = UIImage(named: imgAssetName)
        cell.memberNameLabel.text = name
        cell.memberTmiLabel.text = tmi
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let width = (view.frame.width - 32 - 8) / 2
        return CGSize(width: width, height: 250)
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        print("member \(indexPath.row + 1) is tapped!")
        
        let detailVC = MemberDetailViewController()
        detailVC.selectedMember = members[indexPath.row]
        self.present(detailVC, animated: true)
    }
}

class CustomCell: UICollectionViewCell {
    let memberCardView = UIView()
    let memberImageView = UIImageView()
    let memberNameLabel = UILabel()
    let memberTmiLabel = UILabel()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        // 카드뷰 추가
        addSubview(memberCardView)
        
        // memberCardView 설정
        memberCardView.translatesAutoresizingMaskIntoConstraints = false
        memberCardView.topAnchor.constraint(equalTo: topAnchor).isActive = true
        memberCardView.leadingAnchor.constraint(equalTo: leadingAnchor).isActive = true
        memberCardView.trailingAnchor.constraint(equalTo: trailingAnchor).isActive = true
        memberCardView.bottomAnchor.constraint(equalTo: bottomAnchor).isActive = true
        
        memberCardView.layer.cornerRadius = 16
        memberCardView.layer.masksToBounds = true
        memberCardView.layer.borderWidth = 1
        memberCardView.layer.borderColor = UIColor(named: "w500")?.cgColor
        
        // 이미지뷰를 memberCardView에 추가
        memberCardView.addSubview(memberImageView)
        
        // 이미지뷰 설정
        memberImageView.contentMode = .scaleAspectFit
        memberImageView.translatesAutoresizingMaskIntoConstraints = false
        memberImageView.widthAnchor.constraint(equalTo: memberCardView.widthAnchor, multiplier: 0.8).isActive = true
        memberImageView.topAnchor.constraint(equalTo: memberCardView.topAnchor, constant: 16).isActive = true
        memberImageView.centerXAnchor.constraint(equalTo: memberCardView.centerXAnchor).isActive = true
        memberImageView.heightAnchor.constraint(equalTo: memberImageView.widthAnchor, multiplier: 1.0).isActive = true
        
        // 이름 라벨을 memberCardView에 추가
        memberCardView.addSubview(memberNameLabel)
        
        // 이름 라벨 설정
        memberNameLabel.text = "이름"
        memberNameLabel.textAlignment = .center
        memberNameLabel.font = UIFont.dmSans(size: 16, weight: UIFont.Weight.bold)
        memberNameLabel.translatesAutoresizingMaskIntoConstraints = false
        memberNameLabel.topAnchor.constraint(equalTo: memberImageView.bottomAnchor, constant: 8).isActive = true
        memberNameLabel.leadingAnchor.constraint(equalTo: memberCardView.leadingAnchor, constant: 16).isActive = true
        memberNameLabel.trailingAnchor.constraint(equalTo: memberCardView.trailingAnchor, constant: -16).isActive = true
        
        // TMI 라벨을 memberCardView에 추가
        memberCardView.addSubview(memberTmiLabel)
        
        // TMI 라벨 설정
        memberTmiLabel.text = "TMI"
        memberTmiLabel.textAlignment = .center
        memberTmiLabel.font = UIFont.dmSans(size: 12, weight: UIFont.Weight.regular)
        memberTmiLabel.translatesAutoresizingMaskIntoConstraints = false
        memberTmiLabel.topAnchor.constraint(equalTo: memberNameLabel.bottomAnchor, constant: 4).isActive = true
        memberTmiLabel.leadingAnchor.constraint(equalTo: memberCardView.leadingAnchor, constant: 16).isActive = true
        memberTmiLabel.trailingAnchor.constraint(equalTo: memberCardView.trailingAnchor, constant: -16).isActive = true
        memberTmiLabel.bottomAnchor.constraint(lessThanOrEqualTo: memberCardView.bottomAnchor, constant: -16).isActive = true
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
