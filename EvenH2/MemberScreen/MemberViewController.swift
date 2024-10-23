//
//  MemberViewController.swift
//  EvenH2
//
//  Created by CHYUN on 10/22/24.
//
// 박채현

import UIKit

class MemberViewController: UIViewController, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    
    let memberNames = [
        "Park, Chae-Hyun",
        "Park, Si-Yeon",
        "Hwang, Doyle",
        "Park, Min-Seok",
        "Na, Young-Jin",
        "Jang, Sang-Kyeong"]
    
    let tmi = [
        "동생이 지난 달에 전역함",
        "집 앞 떡볶이 JMT",
        "커피보다는 마테차",
        "아직 여름이불 덮는 중~",
        "창문이 너무 커서 뜨거움",
        "애플워치 시리즈10 구매😈"
    ]
    
    var collectionView: UICollectionView!

    override func viewDidLoad() {
        super.viewDidLoad()

        let layout = UICollectionViewFlowLayout()
        collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        view.addSubview(collectionView)
        
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        collectionView.topAnchor.constraint(equalTo: view.topAnchor).isActive = true
        collectionView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 10).isActive = true
        collectionView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant:  -10).isActive = true
        collectionView.bottomAnchor.constraint(equalTo: view.bottomAnchor).isActive = true
        
        collectionView.dataSource = self
        collectionView.delegate = self
        collectionView.register(CustomCell.self, forCellWithReuseIdentifier: "cell")
        
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return memberNames.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath) as! CustomCell
        cell.memberImageView.image = UIImage(named: memberNames[indexPath.row])
        cell.memberNameLabel.text = memberNames[indexPath.row]
        cell.memberTmiLabel.text = tmi[indexPath.row]
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: view.frame.width/2 - 16, height: 250)
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        print("member \(indexPath.row + 1) is tapped!")
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
