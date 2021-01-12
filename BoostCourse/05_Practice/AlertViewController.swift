//
//  AlertViewController.swift
//  BoostCourse
//
//  Created by jaekyung you on 2021/01/12.
//

import UIKit

class AlertViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        
    }
    
    func showAlertController(style: UIAlertController.Style) {
        let alertController = UIAlertController(title: "Title", message: "Message", preferredStyle: style)
        
        let okAction = UIAlertAction(title: "OK", style: .default) { (action) in
            print("OK pressed")
        }
        let cancelAction = UIAlertAction(title: "Cancel", style: .cancel, handler: nil) // .cancel은 한 번만 호출 가능
        
        alertController.addAction(okAction)
        alertController.addAction(cancelAction)
        
        let handler: (UIAlertAction) -> Void
        handler = { (action: UIAlertAction) in
            print("action pressed \(action.title ?? "")")
        }
        
        let someAction = UIAlertAction(title: "Some", style: .destructive, handler: handler)
        
        let anotherAction = UIAlertAction(title: "Another", style: .default, handler: handler)
        
        alertController.addAction(someAction)
        alertController.addAction(anotherAction)
        
        alertController.addTextField { (field: UITextField) in
            field.placeholder = "입력하시오"
            field.textColor = .red
        }
        
        self.present(alertController, animated: true) {
            print("Alert Controller shown")
        }
    }
    

    @IBAction func touchUpShowAlert(_ sender: Any) {
        self.showAlertController(style: .alert)
    }

    @IBAction func touchUpShowActionSheet(_ sender: Any) {
        self.showAlertController(style: .actionSheet)
    }
    
}
