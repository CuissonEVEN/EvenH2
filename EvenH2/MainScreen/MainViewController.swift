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


class MainViewController: UIViewController, UICollectionViewDelegate, UICollectionViewDataSource, UIPageViewControllerDelegate, UIPageViewControllerDataSource {
    
    private var collectionView: UICollectionView!
    private var pageViewController: UIPageViewController!
    private var currentIndex = 0
    
    let pages = [IntroductionViewController(), GoalViewController(), PromiseViewController(), MemberViewController()]
    
    private let imageView: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(named: "hand")
        imageView.contentMode = .scaleAspectFit
        imageView.translatesAutoresizingMaskIntoConstraints = false
        
        return imageView
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
}

// 페이지마다 보여질 ViewController 정의
class PageContentViewController: UIViewController {
    var pageIndex: Int = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemGray5
        
        if pageIndex == 0 {
            setupCustomView(IntroductionViewController())
        } else if pageIndex == 1 {
            setupCustomView(GoalViewController())
        } else if pageIndex == 2 {
            setupCustomView(PromiseViewController())
        } else if pageIndex == 3 {
            setupCustomView(MemberViewController())
        }
    }
        
    // 커스텀 뷰 컨트롤러 추가
    func setupCustomView(_ vc: UIViewController) {
        let customVC = vc
        addChild(customVC)
        view.addSubview(customVC.view)
        customVC.didMove(toParent: self)
        
        NSLayoutConstraint.activate([
            customVC.view.topAnchor.constraint(equalTo: view.topAnchor),
            customVC.view.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            customVC.view.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            customVC.view.trailingAnchor.constraint(equalTo: view.trailingAnchor)
        ])
    }
}
