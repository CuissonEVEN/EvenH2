//
//  ListCollectionViewCell.swift
//  EvenH2
//
//  Created by miranda on 10/23/24.
//

import UIKit

final class ListCollectionViewCell: UICollectionViewCell {
    static let id = "ListCollectionViewCell"
    
    private let stackView = UIStackView()
    
    private let mbtiTitleLabel = UILabel()
    private let mbtiLabel = UILabel()
    
    private let strengthTitleLabel = UILabel()
    private let strengthLabel = UILabel()
    
    private let teamRoleTitleLabel = UILabel()
    private let teamRoleLabel = UILabel()
    
    private let personalGoalTitleLabel = UILabel()
    private let personalGoalLabel = UILabel()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setUI()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setUI() {
        // Configure stack view
        stackView.axis = .vertical
        stackView.spacing = 4
        stackView.translatesAutoresizingMaskIntoConstraints = false
        
        // Setup labels with titles
        mbtiTitleLabel.text = "MBTI:"
        strengthTitleLabel.text = "Strength:"
        teamRoleTitleLabel.text = "Team Role:"
        personalGoalTitleLabel.text = "Personal Goal:"
        
        // Add labels to the stack view
        stackView.addArrangedSubview(createHorizontalStack(with: mbtiTitleLabel, mbtiLabel))
        stackView.addArrangedSubview(createHorizontalStack(with: strengthTitleLabel, strengthLabel))
        stackView.addArrangedSubview(createHorizontalStack(with: teamRoleTitleLabel, teamRoleLabel))
        stackView.addArrangedSubview(createHorizontalStack(with: personalGoalTitleLabel, personalGoalLabel))
        
        addSubview(stackView)
        
        // Set constraints for stack view
        NSLayoutConstraint.activate([
            stackView.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 8),
            stackView.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -8),
            stackView.topAnchor.constraint(equalTo: self.topAnchor, constant: 8),
            stackView.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: -8)
        ])
    }
    
    private func createHorizontalStack(with titleLabel: UILabel, _ valueLabel: UILabel) -> UIStackView {
        let horizontalStack = UIStackView(arrangedSubviews: [titleLabel, valueLabel])
        horizontalStack.axis = .horizontal
        horizontalStack.spacing = 8
        return horizontalStack
    }
    
    func configure(mbti: String, strength: String, teamRole: String, personalGoal: String) {
        mbtiLabel.text = mbti
        strengthLabel.text = strength
        teamRoleLabel.text = teamRole
        personalGoalLabel.text = personalGoal
    }
}
