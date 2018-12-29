//
//  ReposTableViewController.swift
//  GithubRepos
//
//  Created by Ibrahim El Mountasser on 29/12/2018.
//  Copyright © 2018 Ibrahim El Mountasser. All rights reserved.
//

import UIKit

class ReposTableViewController: UITableViewController {
    let url = URL(string: "https://api.github.com/search/repositories?q=created:%3E2018-11-30&sort=stars&order=desc")
    private var repositories = [Items]()
    override func viewDidLoad() {
        super.viewDidLoad()
        downloadJson()
      
    }
    func downloadJson() {
        guard let downloadUrl = url else { return }
        URLSession.shared.dataTask(with: downloadUrl) { (data, urlResponse, error) in
            guard let data = data, error == nil, urlResponse != nil else {
                print("Something is wrong!")
                return
            }
            guard let objects = try? JSONDecoder().decode(Objects.self, from: data) else {
                print("Error: Couldn't decode data into Objects")
                return
            }
            
            print("downloaded")
            print(objects.items[0].name)
            self.repositories = objects.items
            DispatchQueue.main.async {
                self.tableView.reloadData()
                
            }
            
            }.resume()
    }

    // MARK: - Table view data source

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return repositories.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
            guard let cell = tableView.dequeueReusableCell(withIdentifier: "reposCell") as? ReposTableViewCell else { return UITableViewCell() }
            cell.ownerName.text = repositories[indexPath.row].owner.login
            cell.reposDescription.text = repositories[indexPath.row].description
            cell.reposName.text = repositories[indexPath.row].name
            cell.reposScore.text = "\(repositories[indexPath.row].stargazers_count/1000)k"
            cell.ownerAvatar.setCustomImage(repositories[indexPath.row].owner.avatar_url)
           
            return cell

    }



}

extension UIImageView {
    
    func setCustomImage(_ imgURLString: String?) {
        guard let imageURLString = imgURLString else {
            self.image = UIImage(named: "default.png")
            return
        }
        DispatchQueue.global().async {
            let data = try? Data(contentsOf: URL(string: imageURLString)!)
            DispatchQueue.main.async {
                self.image = data != nil ? UIImage(data: data!) : UIImage(named: "default.png")
            }
        }
    }
}
