//
//  Model.swift
//  EvenH2
//
//  Created by miranda on 10/24/24.
//

import Foundation

struct EvenMember {
    private let key: Int
    private let enName: String
    private let krName: String
    private let tmi: String
    private let imgAssetName: String
    private let hash: [String]
    private let introduction: String
    private let role: String
    private let blogUrlPath: String
    private let gitUrlPath: String
    
    init(key: Int, enName: String, krName: String, tmi: String, imgAssetName: String, hash: [String], introduction: String, role: String, blogUrlPath: String, gitUrlPath: String) {
        self.key = key
        self.enName = enName
        self.krName = krName
        self.tmi = tmi
        self.imgAssetName = imgAssetName
        self.hash = hash
        self.introduction = introduction
        self.role = role
        self.blogUrlPath = blogUrlPath
        self.gitUrlPath = gitUrlPath
    }
    
    func getKey() -> Int { return key }
    func getEnName() -> String { return enName }
    func getKrName() -> String { return krName }
    func getTmi() -> String { return tmi }
    func getImgAssetName() -> String { return imgAssetName }
    func getHash() -> [String] { return hash }
    func getIntroduction() -> String { return introduction }
    func getRole() -> String { return role }
    func getBlogUrlPath() -> String { return blogUrlPath }
    func getGitUrlPath() -> String { return gitUrlPath }
    
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

struct MemberHeader: Hashable {
    let id: String
    let profileImage: String
    let name: String
    let role: String
}

struct ContactLink: Hashable {
    let id: String
    let blogLink: String
    let githubLink: String
    
    var details: [String] {
        return [blogLink, githubLink]
    }
}

