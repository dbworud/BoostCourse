//
//  HeroListViewController.swift
//  BoostCourse
//
//  Created by jaekyung you on 2021/01/10.
//

import UIKit

class HeroListViewController: UIViewController {

    @IBOutlet weak var tableView: UITableView!
    
    private let viewModel = HeroViewModel()

    override func viewDidLoad() {
        super.viewDidLoad()

        viewModel.downloadJSON{
//            print("Complete")
            self.tableView.reloadData()
        }
        
        tableView.delegate = self
        tableView.dataSource = self
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
 
extension HeroListViewController: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel.heros.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
//        let cell = tableView.dequeueReusableCell(withIdentifier: "", for: indexPath)
        let cell = UITableViewCell(style: .default, reuseIdentifier: nil)
        cell.textLabel?.text = viewModel.heros[indexPath.row].name
        return cell
    }
    
    // row가 선택될 때 segue로 이동
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        performSegue(withIdentifier: "showDetail", sender: self)
    }
    
    // pass data
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let destination = segue.destination as? HeroDetailViewController {
            destination.hero = viewModel.heros[tableView.indexPathForSelectedRow!.row]
            // pass해줄 data
        }
    }
    
}
