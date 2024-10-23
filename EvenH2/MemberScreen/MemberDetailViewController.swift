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
    let mbti: String
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
    case detail(Int, String)
}

struct MemberHeader: Hashable {
    let id: String
    let profileImage: String
    let name: String
    let personalGoal: String
}

struct IntroduceYourself: Hashable {
    let id: String
    let mbti: String
    let strength: String
    let teamRole: String
    let personalGoal: String
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
            Member(id: 1, name: "안성재", hashTag: ["#Swift", "#iOS", "#Xcode", "#RxSwift", "#1Swift", "#2iOS", "#3Xcode", "#4RxSwift"], introduction: "어떠어떠한 장점과 어떠어떠한 협업스타일을 바탕으로 팀에 어떠어떠하게 기여하고 있다. 어떠어떠한 목표를 위해 어떠어떠한 노력을 하고 있다. 아자아자 화이팅어떠어떠한 장점과 어떠어떠한 협업스타일을 바탕으로 팀에 어떠어떠하게 기여하고 있다. 어떠어떠한 목표를 위해 어떠어떠한 노력을 하고 있다. 아자아자 화이팅", mbti: "ISFJ", strength: "Leadership", teamRole: "PM", personalGoal: "전서구"),
            Member(id: 2, name: "안성재", hashTag: ["Swift", "iOS", "Xcode", "RxSwift", "1Swift", "2iOS", "3Xcode", "4RxSwift"], introduction: "어떠어떠한 장점과 어떠어떠한 협업스타일을 바탕으로 팀에 어떠어떠하게 기여하고 있다. 어떠어떠한 목표를 위해 어떠어떠한 노력을 하고 있다. 아자아자 화이팅어떠어떠한 장점과 어떠어떠한 협업스타일을 바탕으로 팀에 어떠어떠하게 기여하고 있다. 어떠어떠한 목표를 위해 어떠어떠한 노력을 하고 있다. 아자아자 화이팅", mbti: "ISFJ", strength: "Leadership", teamRole: "PM", personalGoal: "전서구"),
            Member(id: 3, name: "안성재", hashTag: ["Swift", "iOS", "Xcode", "RxSwift", "1Swift", "2iOS", "3Xcode", "4RxSwift"], introduction: "어떠어떠한 장점과 어떠어떠한 협업스타일을 바탕으로 팀에 어떠어떠하게 기여하고 있다. 어떠어떠한 목표를 위해 어떠어떠한 노력을 하고 있다. 아자아자 화이팅어떠어떠한 장점과 어떠어떠한 협업스타일을 바탕으로 팀에 어떠어떠하게 기여하고 있다. 어떠어떠한 목표를 위해 어떠어떠한 노력을 하고 있다. 아자아자 화이팅", mbti: "ISFJ", strength: "Leadership", teamRole: "PM", personalGoal: "전서구"),
            Member(id: 4, name: "안성재", hashTag: ["Swift", "iOS", "Xcode", "RxSwift", "1Swift", "2iOS", "3Xcode", "4RxSwift"], introduction: "어떠어떠한 장점과 어떠어떠한 협업스타일을 바탕으로 팀에 어떠어떠하게 기여하고 있다. 어떠어떠한 목표를 위해 어떠어떠한 노력을 하고 있다. 아자아자 화이팅어떠어떠한 장점과 어떠어떠한 협업스타일을 바탕으로 팀에 어떠어떠하게 기여하고 있다. 어떠어떠한 목표를 위해 어떠어떠한 노력을 하고 있다. 아자아자 화이팅", mbti: "ISFJ", strength: "Leadership", teamRole: "PM", personalGoal: "전서구"),
            Member(id: 5, name: "안성재", hashTag: ["Swift", "iOS", "Xcode", "RxSwift", "1Swift", "2iOS", "3Xcode", "4RxSwift"], introduction: "어떠어떠한 장점과 어떠어떠한 협업스타일을 바탕으로 팀에 어떠어떠하게 기여하고 있다. 어떠어떠한 목표를 위해 어떠어떠한 노력을 하고 있다. 아자아자 화이팅어떠어떠한 장점과 어떠어떠한 협업스타일을 바탕으로 팀에 어떠어떠하게 기여하고 있다. 어떠어떠한 목표를 위해 어떠어떠한 노력을 하고 있다. 아자아자 화이팅", mbti: "ISFJ", strength: "Leadership", teamRole: "PM", personalGoal: "전서구"),
            Member(id: 6, name: "안성재", hashTag: ["Swift", "iOS", "Xcode", "RxSwift", "1Swift", "2iOS", "3Xcode", "4RxSwift"], introduction: "어떠어떠한 장점과 어떠어떠한 협업스타일을 바탕으로 팀에 어떠어떠하게 기여하고 있다. 어떠어떠한 목표를 위해 어떠어떠한 노력을 하고 있다. 아자아자 화이팅어떠어떠한 장점과 어떠어떠한 협업스타일을 바탕으로 팀에 어떠어떠하게 기여하고 있다. 어떠어떠한 목표를 위해 어떠어떠한 노력을 하고 있다. 아자아자 화이팅", mbti: "ISFJ", strength: "Leadership", teamRole: "PM", personalGoal: "전서구")
        ]
    }
    
    func setCollectinoView() {
        collectionView.collectionViewLayout = createCompositionalLayout()
                
        collectionView.register(VerticalHashtagCollectionViewCell.self, forCellWithReuseIdentifier: VerticalHashtagCollectionViewCell.id)

        collectionView.register(HeaderView.self, forSupplementaryViewOfKind: UICollectionView.elementKindSectionHeader, withReuseIdentifier: HeaderView.id)
        collectionView.register(IntroduceYourselfCollectionViewCell.self, forCellWithReuseIdentifier: IntroduceYourselfCollectionViewCell.id)
        
        collectionView.register(ListCollectionViewCell.self, forCellWithReuseIdentifier: ListCollectionViewCell.id)
    }
    
    func createCompositionalLayout() -> UICollectionViewCompositionalLayout {
        return UICollectionViewCompositionalLayout { (sectionIndex, layoutEnvironment) -> NSCollectionLayoutSection? in
            
            switch sectionIndex {
            case 0:
                return self.createHashTagSection()
                
            case 1:
                return self.createIntroductionSection()
                
            case 2:
                return self.createListSection()
                
            default:
                return self.createHashTagSection()
            }
        }
    }
    
    func createHashTagSection() -> NSCollectionLayoutSection {
        let itemSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1.0), heightDimension: .fractionalHeight(0.7))
        //let itemSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1.0), heightDimension: .absolute(28))
        let item = NSCollectionLayoutItem(layoutSize: itemSize)
        item.contentInsets = NSDirectionalEdgeInsets(top: 0, leading: 0, bottom: 0, trailing: 10)
        
        let gruopSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(0.4), heightDimension: .absolute(50))
        let group = NSCollectionLayoutGroup.horizontal(layoutSize: gruopSize, subitems: [item])
        
        let section = NSCollectionLayoutSection(group: group)
        section.contentInsets = NSDirectionalEdgeInsets(top: 20, leading: 10, bottom: 20, trailing: 10)
        section.orthogonalScrollingBehavior = .continuous
        return section
    }
    
    func createIntroductionSection() -> NSCollectionLayoutSection {
        let itemSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1.0), heightDimension: .estimated(100))
        let item = NSCollectionLayoutItem(layoutSize: itemSize)

        let gruopSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1.0), heightDimension: .estimated(150))
        let group = NSCollectionLayoutGroup.horizontal(layoutSize: gruopSize, subitems: [item])
        
        let section = NSCollectionLayoutSection(group: group)
        section.contentInsets = NSDirectionalEdgeInsets(top: 20, leading: 10, bottom: 20, trailing: 10)
        
        let headerSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1.0), heightDimension: .absolute(240))
        let sectionHeader = NSCollectionLayoutBoundarySupplementaryItem(layoutSize: headerSize, elementKind: UICollectionView.elementKindSectionHeader, alignment: .top)
        
        section.boundarySupplementaryItems = [sectionHeader]
        return section
    }
    
    func createListSection() -> NSCollectionLayoutSection {
        let itemSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1.0), heightDimension: .fractionalHeight(0.4))
        let item = NSCollectionLayoutItem(layoutSize: itemSize)
        
        let gruopSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1.0), heightDimension: .absolute(320))
        let group = NSCollectionLayoutGroup.vertical(layoutSize: gruopSize, subitems: [item])
        
        let section = NSCollectionLayoutSection(group: group)
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
                
            case .detail(let memberId, let title):
                guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: ListCollectionViewCell.id, for: indexPath) as? ListCollectionViewCell else {
                    fatalError("Unable to dequeue ListCollectionViewCell")
                }
                
                if let member = self.members.first(where: { $0.id == memberId }) {
                    cell.configure(mbti: member.mbti, strength: member.strength, teamRole: member.teamRole, personalGoal: member.personalGoal)
                }
                
                return cell
                
            default:
                return UICollectionViewCell()
            }
        }
            
        dataSource?.supplementaryViewProvider = { collectionView, kind, indexPath in
            
            guard kind == UICollectionView.elementKindSectionHeader else {
                return UICollectionReusableView()
            }
            
            if self.dataSource?.snapshot().sectionIdentifiers[indexPath.section] == .introduction {
                let header = collectionView.dequeueReusableSupplementaryView(ofKind: kind, withReuseIdentifier: HeaderView.id, for: indexPath) as! HeaderView
                
                let member = self.members[0]
                let memberHeader = MemberHeader(id: "\(member.id)", profileImage: "profileImageName", name: member.name, personalGoal: member.personalGoal)
                header.configure(with: memberHeader)
                
                return header
            }
            
            return nil
        }
    }

    
    func applySnapshot() {
        var snapshot = NSDiffableDataSourceSnapshot<Section, Item>()
        
        snapshot.appendSections([.hashTag, .introduction, .details])
        
        let member = members[0]
        snapshot.appendItems(member.hashTag.map { Item.hashTag($0) }, toSection: .hashTag)
        snapshot.appendItems([.introduction(member.introduction)], toSection: .introduction)
        snapshot.appendItems([.detail(member.id, "Details")], toSection: .details)

        let details = [
            ("mbti", member.mbti),
            ("strength", member.strength),
            ("teamRole", member.teamRole),
            ("personalGoal", member.personalGoal)
        ]
        
        for (index, detail) in details.enumerated() {
            snapshot.appendItems([.detail(member.id * 1000 + index, detail.1)], toSection: .details)
        }
        
        dataSource?.apply(snapshot, animatingDifferences: true)
    }
}
