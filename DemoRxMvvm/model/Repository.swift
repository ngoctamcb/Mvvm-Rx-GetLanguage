//
//  Repository.swift
//  DemoRxMvvm
//
//  Created by TranNgocTam on 12/26/17.
//  Copyright © 2017 TranNgocTam. All rights reserved.
//

import Foundation

struct Repository {
    let fullName: String
    let description: String
    let starsCount: Int
    let url: String
}

extension Repository {
    init?(from json: [String: Any]) {
        guard
            let fullName = json["full_name"] as? String,
            let description = json["description"] as? String,
            let starsCount = json["stargazers_count"] as? Int,
            let url = json["html_url"] as? String
            else { return nil }
        
        self.init(fullName: fullName, description: description, starsCount: starsCount, url: url)
    }
}

class RepositoryViewModel {
    let name: String
    let description: String
    let starsCountText: String
    let url: URL
    
    init(repository: Repository) {
        self.name = repository.fullName
        self.description = repository.description
        self.starsCountText = "⭐️ \(repository.starsCount)"
        self.url = URL(string: repository.url)!
    }
}
