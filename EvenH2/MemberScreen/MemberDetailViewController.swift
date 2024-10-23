//
//  MemberDetailViewController.swift
//  EvenH2
//
//  Created by CHYUN on 10/22/24.
//  박시연

import UIKit

struct Member {
    let id: Int // 타입 논의 필요
    let name: String
    let hashTag: [String]
    let introduction: String
    let mbit: String
    let strength: String
    let teamRole: String
    let personalGoal: String
}

fileprivate enum Section {
    case hashTag
    case introduction
    case details
}

fileprivate enum Item: Hashable {
    case hashTag(String)
    case introduction(String)
    case detail(String)
}

fileprivate struct MemberHeader: Hashable {
    let id: String
    let name: String
    let age: Int
    let introduction: String
}

final class MemberDetailViewController: UIViewController {
    @IBOutlet weak var collectionView: UICollectionView!
    private var dataSource: UICollectionViewDiffableDataSource<Section, Item>?
    var members: [Member] = []
    override func viewDidLoad() {
        super.viewDidLoad()
        setCollectinoView()
        configureDataSource()
        fetchData()
        applySnapshot()
    }
    
    func fetchData() {
        members = [
            Member(id: 1, name: "안성재", hashTag: ["Swift", "iOS", "Xcode", "RxSwift", "1Swift", "2iOS", "3Xcode", "4RxSwift"], introduction: "어떠어떠한 장점과 어떠어떠한 협업스타일을 바탕으로 팀에 어떠어떠하게 기여하고 있다. 어떠어떠한 목표를 위해 어떠어떠한 노력을 하고 있다. 아자아자 화이팅어떠어떠한 장점과 어떠어떠한 협업스타일을 바탕으로 팀에 어떠어떠하게 기여하고 있다. 어떠어떠한 목표를 위해 어떠어떠한 노력을 하고 있다. 아자아자 화이팅", mbit: "ISFJ", strength: "Leadership", teamRole: "PM", personalGoal: "전서구"),
            Member(id: 2, name: "안성재", hashTag: ["Swift", "iOS", "Xcode", "RxSwift", "1Swift", "2iOS", "3Xcode", "4RxSwift"], introduction: "어떠어떠한 장점과 어떠어떠한 협업스타일을 바탕으로 팀에 어떠어떠하게 기여하고 있다. 어떠어떠한 목표를 위해 어떠어떠한 노력을 하고 있다. 아자아자 화이팅어떠어떠한 장점과 어떠어떠한 협업스타일을 바탕으로 팀에 어떠어떠하게 기여하고 있다. 어떠어떠한 목표를 위해 어떠어떠한 노력을 하고 있다. 아자아자 화이팅", mbit: "ISFJ", strength: "Leadership", teamRole: "PM", personalGoal: "전서구"),
            Member(id: 3, name: "안성재", hashTag: ["Swift", "iOS", "Xcode", "RxSwift", "1Swift", "2iOS", "3Xcode", "4RxSwift"], introduction: "어떠어떠한 장점과 어떠어떠한 협업스타일을 바탕으로 팀에 어떠어떠하게 기여하고 있다. 어떠어떠한 목표를 위해 어떠어떠한 노력을 하고 있다. 아자아자 화이팅어떠어떠한 장점과 어떠어떠한 협업스타일을 바탕으로 팀에 어떠어떠하게 기여하고 있다. 어떠어떠한 목표를 위해 어떠어떠한 노력을 하고 있다. 아자아자 화이팅", mbit: "ISFJ", strength: "Leadership", teamRole: "PM", personalGoal: "전서구"),
            Member(id: 4, name: "안성재", hashTag: ["Swift", "iOS", "Xcode", "RxSwift", "1Swift", "2iOS", "3Xcode", "4RxSwift"], introduction: "어떠어떠한 장점과 어떠어떠한 협업스타일을 바탕으로 팀에 어떠어떠하게 기여하고 있다. 어떠어떠한 목표를 위해 어떠어떠한 노력을 하고 있다. 아자아자 화이팅어떠어떠한 장점과 어떠어떠한 협업스타일을 바탕으로 팀에 어떠어떠하게 기여하고 있다. 어떠어떠한 목표를 위해 어떠어떠한 노력을 하고 있다. 아자아자 화이팅", mbit: "ISFJ", strength: "Leadership", teamRole: "PM", personalGoal: "전서구"),
            Member(id: 5, name: "안성재", hashTag: ["Swift", "iOS", "Xcode", "RxSwift", "1Swift", "2iOS", "3Xcode", "4RxSwift"], introduction: "어떠어떠한 장점과 어떠어떠한 협업스타일을 바탕으로 팀에 어떠어떠하게 기여하고 있다. 어떠어떠한 목표를 위해 어떠어떠한 노력을 하고 있다. 아자아자 화이팅어떠어떠한 장점과 어떠어떠한 협업스타일을 바탕으로 팀에 어떠어떠하게 기여하고 있다. 어떠어떠한 목표를 위해 어떠어떠한 노력을 하고 있다. 아자아자 화이팅", mbit: "ISFJ", strength: "Leadership", teamRole: "PM", personalGoal: "전서구"),
            Member(id: 6, name: "안성재", hashTag: ["Swift", "iOS", "Xcode", "RxSwift", "1Swift", "2iOS", "3Xcode", "4RxSwift"], introduction: "어떠어떠한 장점과 어떠어떠한 협업스타일을 바탕으로 팀에 어떠어떠하게 기여하고 있다. 어떠어떠한 목표를 위해 어떠어떠한 노력을 하고 있다. 아자아자 화이팅어떠어떠한 장점과 어떠어떠한 협업스타일을 바탕으로 팀에 어떠어떠하게 기여하고 있다. 어떠어떠한 목표를 위해 어떠어떠한 노력을 하고 있다. 아자아자 화이팅", mbit: "ISFJ", strength: "Leadership", teamRole: "PM", personalGoal: "전서구")
        ]
    }
    
    func setCollectinoView() {
        collectionView.collectionViewLayout = createCompositionalLayout()
        
        collectionView.register(UINib(nibName: "HashTagCollectionViewCell", bundle: nil), forCellWithReuseIdentifier: HashTagCollectionViewCell.id)
        
        collectionView.register(HeaderView.self, forSupplementaryViewOfKind: UICollectionView.elementKindSectionHeader, withReuseIdentifier: HeaderView.id)

        //collectionView.register(HashTagCollectionViewCell.self, forCellWithReuseIdentifier: HashTagCollectionViewCell.id)
    }
    
    func createCompositionalLayout() -> UICollectionViewCompositionalLayout {
        return UICollectionViewCompositionalLayout { (sectionIndex, layoutEnvironment) -> NSCollectionLayoutSection? in
            
            switch sectionIndex {
            case 0:
                return self.createHashTagSection()
                
            
                
            default:
                
                return self.createHashTagSection()
            }
        }
    }
    
    func createHashTagSection() -> NSCollectionLayoutSection {
        let itemSize = NSCollectionLayoutSize(widthDimension: .estimated(100), heightDimension: .fractionalHeight(0.7))
        let item = NSCollectionLayoutItem(layoutSize: itemSize)
        //item.contentInsets = NSDirectionalEdgeInsets(top: 0, leading: 0, bottom: 0, trailing: 10)
        
        let gruopSize = NSCollectionLayoutSize(widthDimension: .estimated(100), heightDimension: .absolute(50))
        let group = NSCollectionLayoutGroup.horizontal(layoutSize: gruopSize, subitems: [item])
        group.contentInsets = NSDirectionalEdgeInsets(top: 10, leading: 10, bottom: 10, trailing: 10)
        
        let section = NSCollectionLayoutSection(group: group)
        section.orthogonalScrollingBehavior = .continuous
        return section
    }
    
    func configureDataSource() {
        dataSource = UICollectionViewDiffableDataSource<Section, Item>(collectionView: collectionView) { collectionView, indexPath, itemIdentifier in
            switch itemIdentifier {
            case .hashTag(let hashtag):
                let cell = collectionView.dequeueReusableCell(withReuseIdentifier: HashTagCollectionViewCell.id, for: indexPath) as? HashTagCollectionViewCell
                
                cell?.configure(with: hashtag)
                return cell
                
            default:
                let cell = collectionView.dequeueReusableCell(withReuseIdentifier: HashTagCollectionViewCell.id, for: indexPath) as? HashTagCollectionViewCell
                
                return cell
            }
        }
        
        dataSource?.supplementaryViewProvider = {
            collectionView, kind, indexPath in
            let header = collectionView.dequeueReusableSupplementaryView(ofKind: kind, withReuseIdentifier: HeaderView.id, for: indexPath) as! HeaderView
            let teamMember = self.members[indexPath.section]
            
            return header
        }
    }
    
    func applySnapshot() {
        var snapshot = NSDiffableDataSourceSnapshot<Section, Item>()
        
        snapshot.appendSections([.hashTag, .introduction, .details])
        
        let member = members[0]
        snapshot.appendItems(member.hashTag.map{ Item.hashTag($0)}, toSection: .hashTag)
        
        dataSource?.apply(snapshot, animatingDifferences: true)
    }
}
