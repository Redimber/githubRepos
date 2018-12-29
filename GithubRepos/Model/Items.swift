//
//  Repository.swift
//  github
//
//  Created by Ibrahim El Mountasser on 28/12/2018.
//  Copyright © 2018 Ibrahim El Mountasser. All rights reserved.
//

import Foundation

struct Items : Codable{
    var owner: Owner
    var stargazers_count: Double
    var description: String
    var name: String
    init(name: String, description: String, stargazers_count: Double, owner : Owner) {
        self.name = name
        self.stargazers_count = stargazers_count
        self.description = description
        self.owner = owner
    }
}
