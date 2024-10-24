//
//  GoalViewController.swift
//  EvenH2
//
//  Created by CHYUN on 10/22/24.
//  minseok

import UIKit

class GoalViewCell: UITableViewCell {
    
    // 이름 라벨
    let GoalNameLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textAlignment = .center
        return label
    }()
    
    // 목표 라벨
    let GoalLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textAlignment = .center
        return label
    }()
    
    // 이미지뷰
    let GoalImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.contentMode = .scaleAspectFit
        imageView.clipsToBounds = true
        return imageView
    }()

    //오토레이아웃
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setupLabels()
        setupConstraints()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        setupLabels()
        setupConstraints()
    }
    
    private func setupLabels() {
        // 라벨 설정
        GoalNameLabel.translatesAutoresizingMaskIntoConstraints = false
        GoalNameLabel.text = "이름 라벨"
        GoalNameLabel.textAlignment = .left
        GoalNameLabel.font = UIFont.dmSans(size: 16, weight: UIFont.Weight.bold) // 볼드체 적용
        
        GoalLabel.translatesAutoresizingMaskIntoConstraints = false
        GoalLabel.text = "목표 라벨"
        GoalLabel.textAlignment = .left
        GoalLabel.font = UIFont.dmSans(size: 16, weight: UIFont.Weight.regular) // 일반체 폰트
        
        // 테두리 추가(임시)
//        GoalNameLabel.layer.borderWidth = 1
//        GoalLabel.layer.borderWidth = 1

        // 셀에 라벨 추가
        contentView.addSubview(GoalImageView)
        contentView.addSubview(GoalNameLabel)
        contentView.addSubview(GoalLabel)
    }
    
    private func setupConstraints() {
        NSLayoutConstraint.activate([
            // 이미지 뷰 제약 조건
            GoalImageView.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 20),
            GoalImageView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 16),
            GoalImageView.widthAnchor.constraint(equalToConstant: 70),
            GoalImageView.heightAnchor.constraint(equalToConstant: 70),
            GoalImageView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -20),
            
            // 이름 라벨 제약 조건 (이미지 뷰의 수직 중심에 맞추기)
            GoalNameLabel.centerYAnchor.constraint(equalTo: GoalImageView.centerYAnchor, constant: -12), // 중앙에서 약간 위로 배치
            GoalNameLabel.leadingAnchor.constraint(equalTo: GoalImageView.trailingAnchor, constant: 16),
            GoalNameLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -10),

            // 목표 라벨 제약 조건 (이름 라벨 아래로 8 포인트 간격으로 배치)
            GoalLabel.topAnchor.constraint(equalTo: GoalNameLabel.bottomAnchor, constant: 2),
            GoalLabel.leadingAnchor.constraint(equalTo: GoalImageView.trailingAnchor, constant: 16),
            GoalLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -10)
        ])
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        
        // 모서리 둥글기 설정
        contentView.layer.cornerRadius = 10
        contentView.layer.masksToBounds = true
        
        // 셀 테두리 설정
        contentView.layer.borderWidth = 1
        contentView.layer.borderColor = UIColor(named: "w500")?.cgColor
        
        // 여백 설정
        contentView.frame = contentView.frame.inset(by: UIEdgeInsets(top: 10, left: 0, bottom: 10, right: 0))
    }
    
}

class GoalViewController: UIViewController, UITableViewDelegate, UITableViewDataSource{
    
    @IBOutlet weak var GoalTableView: UITableView!
    //이름
    let name: [String] = ["모두의 이븐한 목표", "채현님의 목표", "시연님의 목표", "도일님의 목표", "민석님의 목표", "상경님의 목표", "영진님의 목표"]
    //목표 텍스트
    let goaltext: [String] = ["좋은 곳에 취업하기", "의도가 있는 코드를 쓰자!", "프로젝트 완주!", "함께 일하고 싶은 개발자가 되자!", "포기하지말고 프로젝트 완성하기!", "프로젝트에 최선을 다해서 임하자~", "프로젝트를 통해 한단계 발전하기!"]
    //이미지
    let goalImg: [String] = ["ic_member_team.png", "ic_member_ch.png", "ic_member_sy.png", "ic_memeber_dy.png", "ic_member_ms.png", "ic_member_sk.png", "ic_member_yj.png"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        GoalTableView.delegate = self
        GoalTableView.dataSource = self
        
        GoalTableView.register(GoalViewCell.self, forCellReuseIdentifier: "GoalTableViewCell")
        
        GoalTableView.separatorStyle = .none
        
        // 인디케이터 숨기기
        GoalTableView.showsVerticalScrollIndicator = false  // 세로 스크롤 인디케이터 숨김
        // 테이블 뷰를 뷰에 추가
        self.view.addSubview(GoalTableView)
    }
    
    //셀 수 설정 (목표랑 이미지 수만큼)
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return goaltext.count
    }
    
    //셀 내용 설정 (이미지, 텍스트)
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "GoalTableViewCell", for: indexPath) as! GoalViewCell
        
        cell.GoalImageView.image = UIImage(named: goalImg[indexPath.row]) // 이미지
        cell.GoalNameLabel.text = name[indexPath.row]   // 이름
        cell.GoalLabel.text = goaltext[indexPath.row]   // 목표 내용
        // 셀 선택효과 삭제
        cell.selectionStyle = .none
        return cell
    }
    
    //셀 크기 설정
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 130
    }
    
    // 테이블 뷰 셀과 테이블 뷰 간의 여백 설정
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        GoalTableView.frame = view.bounds.inset(by: UIEdgeInsets(top: 20, left: 16, bottom: 0, right: 16)) // 상단, 좌우 여백 설정
    }

}
