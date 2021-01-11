//
//  AsyncViewController.swift
//  BoostCourse
//
//  Created by jaekyung you on 2021/01/10.
//

import UIKit

class AsyncViewController: UIViewController {

    @IBOutlet weak var imageView: UIImageView!
    

    // https://image.freepik.com/free-photo/panoramic-view-big-ben-london-sunset-uk_268835-1401.jpg
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    @IBAction func downloadImage(_ sender: Any) {
        let imageString = "https://image.freepik.com/free-photo/panoramic-view-big-ben-london-sunset-uk_268835-1401.jpg"
        
        /*
        guard let imageUrl = URL(string: imageString) else { return }
        guard let imageData = try? Data.init(contentsOf: imageUrl) else { return }
        let image = UIImage(data: imageData)
        
        DispatchQueue.main.async {
            self.imageView.image = image
        }*/
     
        OperationQueue.main.addOperation {
            
            guard let imageUrl = URL(string: imageString) else { return }
            guard let imageData = try? Data.init(contentsOf: imageUrl) else { return }
            let image = UIImage(data: imageData)
            
            OperationQueue.main.addOperation {
                self.imageView.image = image
            }
            
        }
        
    }
    

}
