//
//  NetworkingViewController.swift
//  BoostCourse
//
//  Created by jaekyung you on 2021/01/12.
//

import UIKit

class NetworkingViewController: UIViewController {
    
    var students : [Student] = []
    
    @IBOutlet weak var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        NotificationCenter.default.addObserver(self, selector: #selector(didReceiveStudentsNotification), name: DidReceiveStudentsNotification, object: nil)
        
        tableView.dataSource = self
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
        requestStudents()
    }
    
    @objc func didReceiveStudentsNotification(_ noti: Notification) {
        
        guard  let students = noti.userInfo?["students"] as? [Student] else { return }
        
        self.students = students
        
        DispatchQueue.main.async {
            self.tableView.reloadData()
        }
    }
}

extension NetworkingViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return students.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "friendCell", for: indexPath)
        
        let student = students[indexPath.row]
        
        cell.textLabel?.text = student.name.full
        cell.detailTextLabel?.text = student.email
        cell.imageView?.image = nil // 초기화 
        
        DispatchQueue.global().async {
            guard let imageURL = URL(string: student.picture.thumbnail) else { return  }
            guard let imageData = try? Data(contentsOf: imageURL) else { return } // 동기식
            
            DispatchQueue.main.async {
                // 유저가 스크롤하면서 이름과 이미지가 일치하도록
                if let index = tableView.indexPath(for: cell) {
                    if index.row == indexPath.row {
                        cell.imageView?.image = UIImage(data: imageData)
                    }
                }
            }
        }
       
        return cell
    }
}
