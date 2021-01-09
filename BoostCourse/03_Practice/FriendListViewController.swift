//
//  FriendListViewController.swift
//  BoostCourse
//
//  Created by jaekyung you on 2021/01/09.
//

import UIKit

class FriendListViewController: UIViewController {

    @IBOutlet weak var tableView: UITableView!
    var friends : [Friend] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.dataSource = self
        
        guard let jsonData = NSDataAsset(name: "friends") else { return }
        do {
            friends = try JSONDecoder().decode([Friend].self, from: jsonData.data)
        } catch {
            print(error)
        }
        
        tableView.reloadData()
    }
}

extension FriendListViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.friends.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        
        let friend = friends[indexPath.row]
        
        cell.textLabel?.text = friend.name + "(\(friend.age))"
        cell.detailTextLabel?.text = friend.addressInfo.city + ", " + friend.addressInfo.country
        
        return cell
    }

}
