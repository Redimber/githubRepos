//
//  ReposTableViewCell.swift
//  GithubRepos
//
//  Created by Ibrahim El Mountasser on 29/12/2018.
//  Copyright © 2018 Ibrahim El Mountasser. All rights reserved.
//

import UIKit

class ReposTableViewCell: UITableViewCell {

    @IBOutlet weak var reposName: UILabel!
    @IBOutlet weak var reposDescription: UILabel!
    @IBOutlet weak var ownerAvatar: UIImageView!
    @IBOutlet weak var reposScore: UILabel!
    @IBOutlet weak var ownerName: UILabel!
}
