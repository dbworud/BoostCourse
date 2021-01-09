//
//  TapGestureViewController.swift
//  BoostCourse
//
//  Created by jaekyung you on 2021/01/08.
//

import UIKit

class TapGestureViewController: UIViewController {
  
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // 1. Code로 구현하는 법
//        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(self.tapView(_:)))
//        self.view.addGestureRecognizer(tapGesture)
        
        let tapGesture : UITapGestureRecognizer = UITapGestureRecognizer()
        tapGesture.delegate = self
        self.view.addGestureRecognizer(tapGesture)
    }
    
    /*
    // 2. 함수구현하고 연결해주는 법
    @IBAction func tapView(_ sender: UITapGestureRecognizer) {
        self.view.endEditing(true)
    }
 */
}

// 3. Delegate pattern
extension TapGestureViewController: UIGestureRecognizerDelegate {
    
    func gestureRecognizer(_ gestureRecognizer: UIGestureRecognizer, shouldReceive touch: UITouch) -> Bool {
        self.view.endEditing(true)
        return true
    }
    
}
