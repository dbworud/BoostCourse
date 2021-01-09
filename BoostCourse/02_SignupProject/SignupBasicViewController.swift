//
//  SignupViewController.swift
//  BoostCourse
//
//  Created by jaekyung you on 2021/01/09.
//

import UIKit

class SignupBasicViewController: UIViewController, UINavigationControllerDelegate {

    @IBOutlet weak var profileImage: UIImageView!
    
    @IBOutlet weak var idTextField: UITextField!
    
    @IBOutlet weak var passwordTextField: UITextField!
    
    @IBOutlet weak var checkPasswordTextField: UITextField!
    
    @IBOutlet weak var textView: UITextView!
    
    @IBOutlet weak var nextButton: UIButton!
    
    lazy var button : UIButton = {
       let button = UIButton()
        if self.passwordTextField.text == self.checkPasswordTextField.text && textView.hasText {
            button.isEnabled = true
            button.setTitleColor(.blue, for: .normal)
        } else {
            button.isEnabled = false
            button.setTitleColor(.lightGray, for: .disabled)
        }
        return button
    }()
    
    lazy var imagePicker : UIImagePickerController = {
       let imagePicker = UIImagePickerController()
        imagePicker.allowsEditing = true 
        imagePicker.sourceType = .photoLibrary
        imagePicker.delegate = self
        return imagePicker
    }()
     
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(selectImage))
        
        self.view.addGestureRecognizer(tapGesture)

        /*
        if self.passswordTextField.text == self.checkPasswordTextField.text && textView.hasText {
            nextButton.isEnabled = true
            nextButton.setTitleColor(.blue, for: .normal)
        } else {
            nextButton.isEnabled = false
            nextButton.setTitleColor(.lightGray, for: .disabled)
        }
        */
        
        //nextButton.addTarget(self, action: #selector(TappedNextButton(_:)), for: .touchUpInside)
    }

    @objc func selectImage() {
        self.present(imagePicker, animated: true, completion: nil)
    }
    
    /*
    // objc func
    @objc func TappedNextButton(_ sender: UIButton) {
        
        // push navigation controller
        self.navigationController?.pushViewController(SignupPlusViewController(), animated: true)
        
        // Singleton에 저장
        UserInfo.shared.id = idTextField.text
        UserInfo.shared.password = passwordTextField.text
        
    }*/

}

extension SignupBasicViewController: UIImagePickerControllerDelegate {
    
    func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
        self.dismiss(animated: true, completion: nil)
    }
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
    
        if let selectedImage = info[.editedImage] as? UIImage {
            self.profileImage.image = selectedImage
        }
        self.dismiss(animated: true, completion: nil)
    }

}


// Recognize UITapGesture


