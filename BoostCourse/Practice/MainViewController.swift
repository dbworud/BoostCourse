//
//  MainViewController.swift
//  BoostCourse
//
//  Created by jaekyung you on 2021/01/08.
//

import UIKit

class MainViewController: UIViewController {
    
    
    @IBOutlet weak var nameTextField: UITextField!
    
    @IBOutlet weak var ageTextField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    
    @IBAction func saveToSingleton(_ sender: Any) {
        UserInformation.shared.name = nameTextField.text
        UserInformation.shared.age = ageTextField.text
    }
}


class SecondViewController: UIViewController {

    @IBOutlet weak var nameLabel: UILabel!
    
    @IBOutlet weak var ageLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }

    override func viewWillAppear(_ animated: Bool) {
        // view가 보여지기 전에 singleton에서 정보 가져와서 붙여주기
        nameLabel.text = UserInformation.shared.name
        ageLabel.text = UserInformation.shared.age
        
    }
    
    @IBAction func tappedPop(_ sender: Any) {
        self.navigationController?.popViewController(animated: true)
    }
    
    
    @IBAction func tappedDimiss(_ sender: Any) {
        self.dismiss(animated: true, completion: nil)
    }
}
