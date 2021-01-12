//
//  PhotoCollectionViewCell.swift
//  BoostCourse
//
//  Created by jaekyung you on 2021/01/11.
//

import UIKit

class PhotoCollectionViewCell: UICollectionViewCell {
    
    static let identifier = "PhotoCollectionViewCell"
    
    private let imageView : UIImageView = {
       let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFill
        imageView.clipsToBounds = true
        return imageView
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        contentView.addSubview(imageView)
        
        // assign randomly
        let image = [
            UIImage(named: "flag_de"),
            UIImage(named: "flag_fr"),
            UIImage(named: "flag_it"),
            UIImage(named: "flag_jp"),
            UIImage(named: "flag_kr"),
            UIImage(named: "flag_us")
        ]
        .compactMap({ $0 })  // fix error: cannot assign value of type 'UIImage??' -> 'UIImage?'
        
        imageView.image = image.randomElement()
    }
    
    required init?(coder: NSCoder) {
        fatalError()
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        imageView.frame = contentView.bounds
    }
    
    override func prepareForReuse() {
        super.prepareForReuse()
//        imageView.image = nil // clean it up
    }
}
