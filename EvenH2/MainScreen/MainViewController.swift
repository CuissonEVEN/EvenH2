//
//  ViewController.swift
//  EvenH2
//
//  Created by CHYUN on 10/22/24.
//
//  MainView 구현 담당: 장상경

import UIKit

// 상단에 표시될 CollectionView의 셀 정의
class MyCollectionViewCell: UICollectionViewCell {
    static let identifier = "MyCollectionViewCell"
    
    private let label: UILabel = {
        let label = UILabel()
        label.font = UIFont.dmSans(size: 16, weight: .regular)
        label.textColor = .white
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private let indicator: UIView = {
        let indicator = UIView()
        indicator.backgroundColor = .black
        indicator.layer.cornerRadius = 1
        indicator.translatesAutoresizingMaskIntoConstraints = false
        
        return indicator
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        contentView.backgroundColor = .black
        contentView.addSubview(label)
        contentView.addSubview(indicator)
        
        // 라벨, 인디케이터의 오토레이아웃 설정
        NSLayoutConstraint.activate([
            label.centerXAnchor.constraint(equalTo: contentView.centerXAnchor),
            label.centerYAnchor.constraint(equalTo: contentView.centerYAnchor),
            
            indicator.heightAnchor.constraint(equalToConstant: 3),
            indicator.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
            indicator.trailingAnchor.constraint(equalTo: contentView.trailingAnchor),
            indicator.bottomAnchor.constraint(equalTo: contentView.bottomAnchor),
            indicator.topAnchor.constraint(equalTo: label.bottomAnchor)
        ])
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func labelConfigure(with index: Int) {
        // Configure your cell with data
        let titleIndex = index + 1
        if titleIndex == 1 {
            label.text = "소개"
        } else if titleIndex == 2 {
            label.text = "목표"
        } else if titleIndex == 3 {
            label.text = "약속"
        } else if titleIndex == 4 {
            label.text = "팀원"
        }
    }
    
    func indicatorConfigure(with isSelected: Bool) {
        indicator.backgroundColor = isSelected ? UIColor.white : UIColor.black
    }
    
    func labelScaleChange(_ isSelected: Bool) {
        label.font = isSelected ? UIFont.dmSans(size: 18, weight: .bold) : UIFont.dmSans(size: 16, weight: .regular)
        label.textColor = isSelected ? UIColor.white : UIColor.gray
    }
}


class MainViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
}
