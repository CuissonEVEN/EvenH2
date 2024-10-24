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
    case details
}

fileprivate enum Item: Hashable {
    case hashTag(String)
    case introduction(String)
    case detail(String, String?, String?)
}

final class MemberDetailViewController: UIViewController {
    let imageView = UIImageView()
    var selectedMember: EvenMember?
    lazy var collectionView: UICollectionView = {
        let layout = createCompositionalLayout()
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        return collectionView
    }()
    private var dataSource: UICollectionViewDiffableDataSource<Section, Item>?
    var members: [EvenMember] = []
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        fetchData()
        setImageView()
        setCollectionView()
        configureDataSource()
        applySnapshot()
        
        if let member = selectedMember {
            print(member.getKrName())
        }
    }
    
    func fetchData() {
        members = [
            EvenMember(key: 0, enName: "Chae-Hyun Park", krName: "박채현", tmi: "동생이 지난 달에 전역함 👽", imgAssetName: "img_ch", hash: ["ESTJ", "적극적", "리더십", "KIA팬"],
                       introduction: "안녕하세요, 저는 2조의 팀장을 맡고 있는 박채현입니다.  팀원분들의 의견을 적극 수용하려 노력하며 작업을 진행하였습니다. 2븐조 팀원이 제일 최고야!", role: "헤드 프레젠터",
                       blogUrlPath: "https://chhue96.tistory.com/", gitUrlPath: "https://github.com/chaehyunp"),
            
            EvenMember(key: 1, enName: "Si-Yeon Park", krName: "박시연", tmi: "집 앞 떡볶이 JMT 💕", imgAssetName: "img_sy", hash: ["ISFJ", "바지런함", "부드러움", "명예소방관"],
                       introduction: "안녕하세요 2조 박시연입니다. 이번 소개 앱에서는 팀원 디테일 뷰를 맡았습니다. 멘탈케어와 간단한 코드 이슈를 함께 해결했습니다!", role: "미니 튜터",
                       blogUrlPath: "https://velog.io/@sy0201", gitUrlPath: "https://github.com/sy0201"),
            
            EvenMember(key: 2, enName: "Doyle Hwang", krName: "황도일", tmi: "커피보다는 마테차 🍵", imgAssetName: "img_dy", hash: ["INFP", "침착함", "끈기", "포토그래퍼"],
                       introduction: "안녕하세요! 2조의 깐죽 담당 황도일입니다. 놓치기 쉬운 디테일을 보고 완성도를 높이기 위해 팀원을 귀찮게 하는 걸 좋아합니다 >:D", role: "세션 리마인더",
                       blogUrlPath: "https://velog.io/@doylehworks", gitUrlPath: "https://github.com/DoyleHWorks"),
            
            EvenMember(key: 3, enName: "Min-Seok Park", krName: "박민석", tmi: "아직 여름이불 덮는 중~ 💦", imgAssetName: "img_ms", hash: ["INTP", "분석적", "섬세함", "Git해결사"],
                       introduction: "안녕하세요, 저는 2조의 팀장을 맡고 있는 박채현입니다.  팀원분들의 의견을 적극 수용하려 노력하며 작업을 진행하였습니다. 2븐조 팀원이 제일 최고야!", role: "바이브 매니저",
                       blogUrlPath: "https://iosstudyletsgo.tistory.com/", gitUrlPath: "https://github.com/maxminseok"),
            
            EvenMember(key: 4, enName: "Young-Jin Na", krName: "나영진", tmi: "창문이 너무 커서 뜨거움 🌈", imgAssetName: "img_yj", hash: ["INFJ", "차분함", "말 잘들음", "산들바람"],
                       introduction: "안녕하세요 2조 나영진입니다. 약속 뷰를 맡았습니다.  개발이 처음이지만 팀원분들의 많은 도움 덕분에 재미도 느끼고 잘 따라갈 수 있었습니다.", role: "디지털 전서구",
                       blogUrlPath: "https://yjuni22.tistory.com/", gitUrlPath: "https://github.com/bryjna07"),
            
            EvenMember(key: 5, enName: "Sang-Kyeong Jang", krName: "장상경", tmi: "애플워치 시리즈10 구매 😈", imgAssetName: "img_sk", hash: ["INFJ", "책임감", "검색능력", "귀여움은정의"],
                       introduction: "안녕하세요, 저는 2조에서 부발표자를 맡고 있는 장상경입니다. 부족하지만 팀원분들과 최대한 협력하여 좋은 결과물이 나올 수 있도록 이끌고 따라가도록 하겠습니다.", role: "프레젠트 코디네이터",
                       blogUrlPath: "https://velog.io/@crois0509/posts", gitUrlPath: "https://github.com/Crois0509")
        ]
    }
    
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
    
    func createCompositionalLayout() -> UICollectionViewCompositionalLayout {
        return UICollectionViewCompositionalLayout { (sectionIndex, layoutEnvironment) -> NSCollectionLayoutSection? in
            
            switch sectionIndex {
            case 0:
                return self.createHashTagSection()
                
            case 1:
                return self.createIntroductionSection()
                
            case 2:
                return self.createContactLinkLayout()
                
            default:
                return self.createHashTagSection()
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
        section.contentInsets = NSDirectionalEdgeInsets(top: 80, leading: 10, bottom: 10, trailing: 10)
        
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
    
    func createContactLinkLayout() -> NSCollectionLayoutSection {
        let itemSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1.0), heightDimension: .absolute(80))
        let item = NSCollectionLayoutItem(layoutSize: itemSize)
        
        let groupSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1.0), heightDimension: .estimated(80))
        let group = NSCollectionLayoutGroup.horizontal(layoutSize: groupSize, subitems: [item])
        group.interItemSpacing = .fixed(10)

        let section = NSCollectionLayoutSection(group: group)
        section.interGroupSpacing = 10
        section.contentInsets = NSDirectionalEdgeInsets(top: 10, leading: 10, bottom: 10, trailing: 10)
        
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
                
            case .detail(_, let blogLink, let githubLink):
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
        
        snapshot.appendSections([.hashTag, .introduction, .details])
        
        guard let member = selectedMember else {
            print("No member selected")
            return
        }
        
        snapshot.appendItems(member.getHash().map { Item.hashTag($0) }, toSection: .hashTag)
        snapshot.appendItems([.introduction(member.getIntroduction())], toSection: .introduction)
        
        let blogLink = member.getBlogUrlPath()
        let githubLink = member.getGitUrlPath()
        snapshot.appendItems([.detail("Link", blogLink, githubLink)], toSection: .details)
        
        dataSource?.apply(snapshot, animatingDifferences: true)
    }
}
