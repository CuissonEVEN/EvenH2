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
        imageView.contentMode = .scaleAspectFill
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
        GoalNameLabel.font = UIFont.boldSystemFont(ofSize: 16) // 볼드체 적용
        
        GoalLabel.translatesAutoresizingMaskIntoConstraints = false
        GoalLabel.text = "목표 라벨"
        GoalLabel.textAlignment = .left
        
        // 셀에 라벨 추가
        contentView.addSubview(GoalImageView)
        contentView.addSubview(GoalNameLabel)
        contentView.addSubview(GoalLabel)
    }
    
    private func setupConstraints() {
        NSLayoutConstraint.activate([
            // 이미지 뷰 제약 조건
            GoalImageView.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 20),
            GoalImageView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 15),
            GoalImageView.widthAnchor.constraint(equalToConstant: 60),
            GoalImageView.heightAnchor.constraint(equalToConstant: 60),
            
            // 이름 라벨 제약 조건
            GoalNameLabel.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 20),
            GoalNameLabel.leadingAnchor.constraint(equalTo: GoalImageView.trailingAnchor, constant: 15),
            GoalNameLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -10),
            
            // 목표 라벨 제약 조건
            GoalLabel.topAnchor.constraint(equalTo: GoalNameLabel.bottomAnchor, constant: 12),
            GoalLabel.leadingAnchor.constraint(equalTo: GoalImageView.trailingAnchor, constant: 15),
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
        contentView.layer.borderColor = UIColor.lightGray.cgColor
        
        // 여백 설정
        contentView.frame = contentView.frame.inset(by: UIEdgeInsets(top: 0, left: 0, bottom: 20, right: 0))
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
        
        return cell
    }
    
    //셀 크기 설정
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 120
    }
    

    
}
