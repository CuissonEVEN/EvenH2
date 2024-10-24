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
        
        view.backgroundColor = .white
        setupImageView()
        setupCollectionView()
        setupPageViewController()
    }
    
    // 이미지뷰 설정
    func setupImageView() {
        view.addSubview(imageView)
        
        NSLayoutConstraint.activate([
            imageView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            imageView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            imageView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            imageView.heightAnchor.constraint(equalToConstant: 50)
        ])
    }
    
    // CollectionView 설정
    func setupCollectionView() {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .horizontal
        layout.itemSize = CGSize(width: 100, height: 40)
        layout.minimumLineSpacing = 10
        
        collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        collectionView.delegate = self
        collectionView.dataSource = self
        collectionView.register(MyCollectionViewCell.self, forCellWithReuseIdentifier: MyCollectionViewCell.identifier)
        collectionView.backgroundColor = .black
        
        view.addSubview(collectionView)
        
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            collectionView.topAnchor.constraint(equalTo: imageView.bottomAnchor, constant: 10),
            collectionView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            collectionView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            collectionView.heightAnchor.constraint(equalToConstant: 40)
        ])
    }
    
    // PageViewController 설정
    func setupPageViewController() {
        pageViewController = UIPageViewController(transitionStyle: .scroll, navigationOrientation: .horizontal, options: nil)
        pageViewController.delegate = self
        pageViewController.dataSource = self
        
        if let firstVC = viewControllerForPage(at: 0) {
            pageViewController.setViewControllers([firstVC], direction: .forward, animated: true, completion: nil)
        }
        
        addChild(pageViewController)
        view.addSubview(pageViewController.view)
        pageViewController.didMove(toParent: self)
        
        pageViewController.view.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            pageViewController.view.topAnchor.constraint(equalTo: collectionView.bottomAnchor),
            pageViewController.view.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            pageViewController.view.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            pageViewController.view.bottomAnchor.constraint(equalTo: view.bottomAnchor)
        ])
    }
    
    // CollectionView DataSource (컬렉션 뷰의 셀을 설정)
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return pages.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: MyCollectionViewCell.identifier, for: indexPath) as! MyCollectionViewCell
        cell.labelConfigure(with: indexPath.item)
        
        let isSelected: Bool = indexPath.item == currentIndex
        cell.indicatorConfigure(with: isSelected)
        cell.labelScaleChange(isSelected)
        
        return cell
    }
    
    // CollectionView Delegate (컬렉션 뷰에서 셀을 선택했을 때 페이지 변경)
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let direction: UIPageViewController.NavigationDirection = indexPath.item > currentIndex ? .forward : .reverse
        if indexPath.item != currentIndex {
            if let vc = viewControllerForPage(at: indexPath.item) {
                pageViewController.setViewControllers([vc], direction: direction, animated: true, completion: nil)
                currentIndex = indexPath.item
            }
        }
        collectionView.reloadData()
    }
    
    // PageViewController DataSource (이전/다음 페이지 설정)
    func pageViewController(_ pageViewController: UIPageViewController, viewControllerBefore viewController: UIViewController) -> UIViewController? {
        let index = (viewController as! PageContentViewController).pageIndex
        return viewControllerForPage(at: index - 1)
    }
    
    func pageViewController(_ pageViewController: UIPageViewController, viewControllerAfter viewController: UIViewController) -> UIViewController? {
        let index = (viewController as! PageContentViewController).pageIndex
        return viewControllerForPage(at: index + 1)
    }
    
    // PageViewController Delegate (페이지 전환 완료 시 컬렉션뷰 선택 상태 업데이트)
    func pageViewController(_ pageViewController: UIPageViewController, didFinishAnimating finished: Bool, previousViewControllers: [UIViewController], transitionCompleted completed: Bool) {
        if completed, let currentVC = pageViewController.viewControllers?.first as? PageContentViewController {
            currentIndex = currentVC.pageIndex
            collectionView.reloadData()
            collectionView.selectItem(at: IndexPath(item: currentIndex, section: 0), animated: true, scrollPosition: .centeredHorizontally)
        }
    }
    
    // 페이지에 맞는 ViewController를 반환하는 메서드
    func viewControllerForPage(at index: Int) -> PageContentViewController? {
        guard index >= 0 && index < pages.count else { return nil }
        let vc = PageContentViewController()
        
        vc.pageIndex = index
        return vc
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
