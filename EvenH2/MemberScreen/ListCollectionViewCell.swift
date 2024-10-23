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
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setUI()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setUI() {
        stackView.axis = .vertical
        stackView.spacing = 4 // Space between labels
        stackView.translatesAutoresizingMaskIntoConstraints = false
        
        addSubview(stackView)
        
        // Constraints for stackView
        NSLayoutConstraint.activate([
            stackView.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 10),
            stackView.topAnchor.constraint(equalTo: self.topAnchor, constant: 5),
            stackView.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -10),
            stackView.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: -5)
        ])
    }
    
    func configure(mbti: String, strength: String, teamRole: String, personalGoal: String) {
        // Clear previous labels
        stackView.arrangedSubviews.forEach { $0.removeFromSuperview() }
        
        // Create and configure labels
        let mbtiLabel = createLabel(title: "MBTI:", value: mbti)
        let strengthLabel = createLabel(title: "Strength:", value: strength)
        let teamRoleLabel = createLabel(title: "Team Role:", value: teamRole)
        let personalGoalLabel = createLabel(title: "Personal Goal:", value: personalGoal)
        
        // Add labels to stack view
        stackView.addArrangedSubview(mbtiLabel)
        stackView.addArrangedSubview(strengthLabel)
        stackView.addArrangedSubview(teamRoleLabel)
        stackView.addArrangedSubview(personalGoalLabel)
    }
    
    private func createLabel(title: String, value: String) -> UILabel {
        let label = UILabel()
        label.font = UIFont.dmSans(size: 14, weight: .regular)
        label.textColor = UIColor.w700
        label.numberOfLines = 0 // Allow multi-line
        label.text = "\(title) \(value)"
        return label
    }
}
