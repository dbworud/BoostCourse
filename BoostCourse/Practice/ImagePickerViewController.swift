//
//  ImagePickerViewController.swift
//  BoostCourse
//
//  Created by jaekyung you on 2021/01/08.
//

import UIKit

class ImagePickerViewController: UIViewController, UIImagePickerControllerDelegate, UINavigationControllerDelegate{


    @IBOutlet weak var imageView: UIImageView!
    
    lazy var imagePicker : UIImagePickerController = {
        let picker = UIImagePickerController()
        picker.sourceType = .photoLibrary
        picker.delegate = self
        return picker
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    @IBAction func selectImage(_ sender: Any) {
        self.present(self.imagePicker, animated: true, completion: nil)
    }
    
    func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
        self.dismiss(animated: true, completion: nil)
    }
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        if let image : UIImage = info[.originalImage] as? UIImage {
            // image ratio, size 가공하기
            self.imageView.image = image
        }
        
        self.dismiss(animated: true, completion: nil)
    }
    
}
