//
//  ScrollViewController.swift
//  BoostCourse
//
//  Created by jaekyung you on 2021/01/10.
//

import UIKit
import Photos

class ScrollViewController: UIViewController, UIScrollViewDelegate {
    
    var asset: PHAsset!
    let imageManager = PHCachingImageManager()

    @IBOutlet weak var imageView: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        
        // asset에 image request
        imageManager.requestImage(for: asset,
                                  targetSize: CGSize(width: asset.pixelWidth, height: asset.pixelHeight),
                                  contentMode: .aspectFill,
                                  options: nil, resultHandler: { image, _ in
                                        self.imageView.image = image
        })
       
        
    }
    
    func viewForZooming(in scrollView: UIScrollView) -> UIView? {
        return self.imageView
    }
}

