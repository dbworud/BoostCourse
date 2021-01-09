//
//  CellDetailViewController.swift
//  BoostCourse
//
//  Created by jaekyung you on 2021/01/09.
//

import UIKit

class CellDetailViewController: UIViewController {

    @IBOutlet weak var textLabel: UILabel!
    
    var textToSet: String?
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    // 화면이 나타나기 전에 text setting
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        textLabel.text = textToSet
    }

}
