//
//  MemberDetailViewController.swift
//  EvenH2
//
//  Created by CHYUN on 10/22/24.
//  박시연

import UIKit

fileprivate enum Section {
    case hashTag
    case introduction
    case contact
}

fileprivate enum Item: Hashable {
    case hashTag(String)
    case introduction(String)
    case contact(String, String?, String?)
}

final class MemberDetailViewController: UIViewController {
    let imageView = UIImageView()
    lazy var collectionView: UICollectionView = {
        let layout = createCompositionalLayout()
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        return collectionView
    }()
    
    private var dataSource: UICollectionViewDiffableDataSource<Section, Item>?
    var selectedMember: EvenMember?
    var members: [EvenMember] = []
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        setImageView()
        setCollectionView()
        configureDataSource()
        applySnapshot()
        
        if let member = selectedMember {
            print(member.getKrName())
        }
    }
    
    func createCompositionalLayout() -> UICollectionViewCompositionalLayout {
        return UICollectionViewCompositionalLayout { (sectionIndex, layoutEnvironment) -> NSCollectionLayoutSection? in
            
            switch sectionIndex {
            case 0: return self.createHashTagSection()
            case 1: return self.createIntroductionSection()
            case 2: return self.createContactLinkLayout()
            default: return nil
            }
        }
    }
    
    func createHashTagSection() -> NSCollectionLayoutSection {
        let itemSize = NSCollectionLayoutSize(widthDimension: .estimated(100), heightDimension: .estimated(50))
        let item = NSCollectionLayoutItem(layoutSize: itemSize)

        let groupSize = NSCollectionLayoutSize(widthDimension: .estimated(1000), heightDimension: .estimated(50))
        let group = NSCollectionLayoutGroup.horizontal(layoutSize: groupSize, subitems: [item])
        
        let section = NSCollectionLayoutSection(group: group)
        
        section.interGroupSpacing = 10
        section.orthogonalScrollingBehavior = .continuousGroupLeadingBoundary
        section.contentInsets = NSDirectionalEdgeInsets(top: 80, leading: 10, bottom: 20, trailing: 20)
        
        return section
    }
    
    func createIntroductionSection() -> NSCollectionLayoutSection {
        let itemSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1.0), heightDimension: .estimated(100))
        let item = NSCollectionLayoutItem(layoutSize: itemSize)

        let gruopSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1.0), heightDimension: .estimated(150))
        let group = NSCollectionLayoutGroup.horizontal(layoutSize: gruopSize, subitems: [item])
        
        let section = NSCollectionLayoutSection(group: group)
        section.contentInsets = NSDirectionalEdgeInsets(top: 20, leading: 0, bottom: 20, trailing: 20)
        
        let headerSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1.0), heightDimension: .absolute(240))
        let sectionHeader = NSCollectionLayoutBoundarySupplementaryItem(layoutSize: headerSize, elementKind: UICollectionView.elementKindSectionHeader, alignment: .top)
        
        section.boundarySupplementaryItems = [sectionHeader]
        return section
    }
    
    func createContactLinkLayout() -> NSCollectionLayoutSection {
        let itemSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1.0), heightDimension: .absolute(80))
        let item = NSCollectionLayoutItem(layoutSize: itemSize)
        
        let groupSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1.0), heightDimension: .estimated(80))
        let group = NSCollectionLayoutGroup.horizontal(layoutSize: groupSize, subitems: [item])
        group.interItemSpacing = .fixed(10)

        let section = NSCollectionLayoutSection(group: group)
        section.interGroupSpacing = 10
        section.contentInsets = NSDirectionalEdgeInsets(top: 20, leading: 10, bottom: 20, trailing: 10)
        
        return section
    }

    func configureDataSource() {
        dataSource = UICollectionViewDiffableDataSource<Section, Item>(collectionView: collectionView) { collectionView, indexPath, itemIdentifier in
            
            switch itemIdentifier {
            case .hashTag(let hashtag):
                guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: VerticalHashtagCollectionViewCell.id, for: indexPath) as? VerticalHashtagCollectionViewCell else {
                    fatalError("Unable to dequeue HashTagCollectionViewCell")
                }
                
                cell.configure(with: hashtag)
                return cell
                
            case .introduction(let introduction):
                guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: IntroduceYourselfCollectionViewCell.id, for: indexPath) as? IntroduceYourselfCollectionViewCell else {
                    fatalError("Unable to dequeue IntroduceYourselfCollectionViewCell")
                }
                
                cell.configure(content: introduction)
                return cell
                
            case .contact(_, let blogLink, let githubLink):
                guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: LinkCollectionViewCell.id, for: indexPath) as? LinkCollectionViewCell else {
                    fatalError("Unable to dequeue TwoItemCollectionViewCell")
                }
                
                cell.blogLink = blogLink
                cell.githubLink = githubLink
                return cell
            }
        }
        
        dataSource?.supplementaryViewProvider = { collectionView, kind, indexPath in
            
            guard kind == UICollectionView.elementKindSectionHeader else {
                return UICollectionReusableView()
            }
            
            if self.dataSource?.snapshot().sectionIdentifiers[indexPath.section] == .introduction {
                let header = collectionView.dequeueReusableSupplementaryView(ofKind: kind, withReuseIdentifier: HeaderView.id, for: indexPath) as! HeaderView
                
                if let member = self.selectedMember {
                    let memberHeader = MemberHeader(id: "\(member.getKey())", profileImage: "\(member.getImgAssetName())", name: member.getKrName(), role: member.getRole())
                    header.configure(with: memberHeader)
                }
                
                return header
            }
            return nil
        }
    }
    
    func applySnapshot() {
        var snapshot = NSDiffableDataSourceSnapshot<Section, Item>()
        snapshot.appendSections([.hashTag, .introduction, .contact])
        
        guard let member = selectedMember else {
            print("No member selected")
            return
        }
        
        snapshot.appendItems(member.getHash().map { Item.hashTag($0) }, toSection: .hashTag)
        snapshot.appendItems([.introduction(member.getIntroduction())], toSection: .introduction)
        
        let blogLink = member.getBlogUrlPath()
        let githubLink = member.getGitUrlPath()
        snapshot.appendItems([.contact("Link", blogLink, githubLink)], toSection: .contact)
        
        dataSource?.apply(snapshot, animatingDifferences: true)
    }
}

// UI Set 구현
private extension MemberDetailViewController {
    func setImageView() {
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.image = UIImage(named: "bottomArrow")
        imageView.contentMode = .scaleAspectFit
        
        view.addSubview(imageView)

        NSLayoutConstraint.activate([
            imageView.widthAnchor.constraint(equalToConstant: 12),
            imageView.heightAnchor.constraint(equalToConstant: 12),
            imageView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            imageView.topAnchor.constraint(equalTo: view.topAnchor, constant: 40)
        ])
    }
    
    func setCollectionView() {
        collectionView.collectionViewLayout = createCompositionalLayout()
        collectionView.contentInset = UIEdgeInsets(top: 10, left: 10, bottom: 10, right: 10)
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        collectionView.isScrollEnabled = false

        view.addSubview(collectionView)
        
        NSLayoutConstraint.activate([
            collectionView.topAnchor.constraint(equalTo: imageView.bottomAnchor),
            collectionView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            collectionView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            collectionView.bottomAnchor.constraint(equalTo: view.bottomAnchor)
        ])
        
        collectionView.register(VerticalHashtagCollectionViewCell.self, forCellWithReuseIdentifier: VerticalHashtagCollectionViewCell.id)
        collectionView.register(HeaderView.self, forSupplementaryViewOfKind: UICollectionView.elementKindSectionHeader, withReuseIdentifier: HeaderView.id)
        collectionView.register(IntroduceYourselfCollectionViewCell.self, forCellWithReuseIdentifier: IntroduceYourselfCollectionViewCell.id)
        collectionView.register(LinkCollectionViewCell.self, forCellWithReuseIdentifier: LinkCollectionViewCell.id)
    }
}
