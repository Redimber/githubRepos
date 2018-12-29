//
//  Object.swift
//  github
//
//  Created by Ibrahim El Mountasser on 28/12/2018.
//  Copyright © 2018 Ibrahim El Mountasser. All rights reserved.
//

import Foundation
struct Objects : Codable{
    var items: [Items]
    init(total_count: Int, incomplete_results: Bool, items: [Items]) {
        self.items = items
    }
    
}
