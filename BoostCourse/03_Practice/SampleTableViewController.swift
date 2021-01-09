//
//  SampleTableViewController.swift
//  BoostCourse
//
//  Created by jaekyung you on 2021/01/09.
//

import UIKit

class SampleTableViewController: UIViewController {

    @IBOutlet weak var tableView: UITableView!
//    let cellIdentifier = "cell"
    
    let korean = ["가", "나", "다", "라", "마", "바", "사","아","자","차","카","타","파","하" ]
    let english = ["A", "B", "C", "D", "E", "F", "G", "H", "I", "J", "K", "L"]
    var dates: [Date] = []

    let dateFormatter: DateFormatter = {
        let formatter = DateFormatter()
        formatter.dateStyle = .medium
        return formatter
    }()
    
    let timeFormatter: DateFormatter = {
        let formatter = DateFormatter()
        formatter.timeStyle = .medium
        return formatter
    }()

    
    override func viewDidLoad() {
        super.viewDidLoad()
    
        self.tableView.delegate = self
        self.tableView.dataSource = self
    }
    
    
    @IBAction func addDate(_ sender: Any) {
        dates.append(Date())
        
//        self.tableView.reloadData() // 전체 데이터를 다시 불러오기 때문에, 비효율적 + 애니메이션 어색
        // 해당 section만 reload
        self.tableView.reloadSections(IndexSet(2...2), with: .automatic)
    }
}

extension SampleTableViewController: UITableViewDelegate, UITableViewDataSource {
    
    // 섹션(korean, english) 2개 사용
    func numberOfSections(in tableView: UITableView) -> Int {
        return 3
    }
    
    // 섹션마다 타이틀 주기
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        if section < 2 {
            return section == 0 ? "한글" : "영어"
        }
        return nil
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        switch section {
        case 0:
            return korean.count
        case 1:
            return english.count
        case 2:
            return dates.count
        default:
            return 0
        }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        // cell에 표현될 데이터 표현
        if indexPath.section < 2 {
            let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
            let text = indexPath.section == 0 ? korean[indexPath.row] : english[indexPath.row]
            cell.textLabel?.text = text
            
            return cell
            
        } else{
            let cell = tableView.dequeueReusableCell(withIdentifier: "customCell", for: indexPath) as! CustomTableViewCell
            
            cell.leftLabel?.text = self.dateFormatter.string(from: self.dates[indexPath.row])
            cell.rightLabel?.text = self.timeFormatter.string(from: self.dates[indexPath.row])
            
            return cell
        }
    }
    
    // MARK: - Navigation
    // 부모 View에서 설정
    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        guard let viewController = segue.destination as? CellDetailViewController else { return }
        
        // Pass the selected object to the new view controller. 부모 View에 있는 tableVieCell의 text를 전달
        guard let cell = sender as? UITableViewCell else { return }
        
        viewController.textToSet = cell.textLabel?.text
        
        // 이런 식으로 매개변수없이 바로 바인딩하면 오류, 아직 textLabel이 메모리에 올라와있지 않기 때문
        /*
         viewController.textLabel.text = cell.textLabel?.text
         
         (lldb) po viewController
         <BoostCourse.CellDetailViewController: 0x7fc050416500>

         (lldb) po viewController.textLabel
         nil
        */
    }
}
