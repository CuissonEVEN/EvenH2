//
//  LinkCollectionViewCell.swift
//  EvenH2
//
//  Created by miranda on 10/24/24.
//

import UIKit

final class LinkCollectionViewCell: UICollectionViewCell {
    static let id = "LinkCollectionViewCell"
    var blogLink: String?
    var githubLink: String?
    
    let blogImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(named: "blogicon")
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.contentMode = .scaleAspectFit
        return imageView
    }()
    
    let githubImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(named: "githubicon")
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.contentMode = .scaleAspectFit
        return imageView
    }()
    
    let blogButton: UIButton = {
        let button = UIButton()
        button.backgroundColor = .clear
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    let githubButton: UIButton = {
        let button = UIButton()
        button.backgroundColor = .clear
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setUI()
        setButtonTarger()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setUI() {
        contentView.addSubview(blogImageView)
        contentView.addSubview(blogButton)
        
        contentView.addSubview(githubImageView)
        contentView.addSubview(githubButton)
        
        NSLayoutConstraint.activate([
            blogImageView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 10),
            blogImageView.centerYAnchor.constraint(equalTo: contentView.centerYAnchor),
            blogImageView.widthAnchor.constraint(equalToConstant: 30),
            blogImageView.heightAnchor.constraint(equalToConstant: 30),
            
            blogButton.centerXAnchor.constraint(equalTo: blogImageView.centerXAnchor),
            blogButton.centerYAnchor.constraint(equalTo: blogImageView.centerYAnchor),
            blogButton.widthAnchor.constraint(equalToConstant: 50),
            blogButton.heightAnchor.constraint(equalToConstant: 50)
        ])
        
        NSLayoutConstraint.activate([
            githubImageView.leadingAnchor.constraint(equalTo: blogImageView.trailingAnchor, constant: 20),
            githubImageView.centerYAnchor.constraint(equalTo: contentView.centerYAnchor),
            githubImageView.widthAnchor.constraint(equalToConstant: 30),
            githubImageView.heightAnchor.constraint(equalToConstant: 30),
            
            githubButton.centerXAnchor.constraint(equalTo: githubImageView.centerXAnchor),
            githubButton.centerYAnchor.constraint(equalTo: githubImageView.centerYAnchor),
            githubButton.widthAnchor.constraint(equalToConstant: 50),
            githubButton.heightAnchor.constraint(equalToConstant: 50)
        ])
    }
    
    func setButtonTarger() {
        blogButton.addTarget(self, action: #selector(blogButtonTapped), for: .touchUpInside)
        
        githubButton.addTarget(self, action: #selector(githubButtonTapped), for: .touchUpInside)
    }
    
    @objc func blogButtonTapped() {
        if let urlString = blogLink, let url = URL(string: urlString) {
            UIApplication.shared.open(url, options: [:], completionHandler: nil)
        }
    }
    
    @objc func githubButtonTapped() {
        if let urlString = githubLink, let url = URL(string: urlString) {
            UIApplication.shared.open(url, options: [:], completionHandler: nil)
        }
    }
}
