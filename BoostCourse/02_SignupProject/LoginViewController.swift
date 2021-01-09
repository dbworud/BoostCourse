//
//  LoginViewController.swift
//  BoostCourse
//
//  Created by jaekyung you on 2021/01/09.
//

import UIKit

class LoginViewController: UIViewController {
    
    @IBOutlet weak var idTextfield: UITextField!
    @IBOutlet weak var passwordTextfield: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()

    }
    
    @IBAction func TappedSignup(_ sender: Any) {
        let viewController = SignupBasicViewController()
        viewController.modalPresentationStyle = .fullScreen
        self.present(viewController, animated: true, completion: nil)
        
    }
    
}
