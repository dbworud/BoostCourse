//
//  DatePickerViewController.swift
//  BoostCourse
//
//  Created by jaekyung you on 2021/01/08.
//

import UIKit

class DatePickerViewController: UIViewController {

    @IBOutlet weak var datePicker: UIDatePicker!
    
    @IBOutlet weak var dateLabel: UILabel!
    
    private let dateFormatter: DateFormatter = {
        let formatter = DateFormatter()
//        formatter.dateStyle = .medium
//        formatter.timeStyle = .short
        formatter.dateFormat = "yyyy/MM/dd hh:mm:ss"
        return formatter
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        datePicker.preferredDatePickerStyle = .wheels
        datePicker.addTarget(self, action: #selector(dateChanged(_:)), for: .valueChanged)
        
    }

    /* 1. @IBActio이용한 Action method
    @IBAction func dateChanged(_ sender: Any) {
        print("Changed")
    }
    */
    
    // 2. 1. selector이용한 Action method
    @objc private func dateChanged(_ sender: UIDatePicker) {
        let date = sender.date
        let dateString = dateFormatter.string(from: date)
        dateLabel.text = dateString
        
//        print("Value Changed")
    }
}
