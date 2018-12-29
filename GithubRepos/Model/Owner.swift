//
//  Owner.swift
//  github
//
//  Created by Ibrahim El Mountasser on 28/12/2018.
//  Copyright © 2018 Ibrahim El Mountasser. All rights reserved.
//

import Foundation
struct Owner : Codable {
    var login : String
    var avatar_url : String
    init(login: String, avatar_url: String) {
        self.login = login
        self.avatar_url = avatar_url
    }
}
