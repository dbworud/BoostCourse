//
//  HeroDetailViewController.swift
//  BoostCourse
//
//  Created by jaekyung you on 2021/01/10.
//

import UIKit

class HeroDetailViewController: UIViewController {

    @IBOutlet weak var heroImageView: UIImageView!
    
    @IBOutlet weak var heroNameLabel: UILabel!
    
    @IBOutlet weak var attributeLabel: UILabel!
    
    @IBOutlet weak var attackTypeLabel: UILabel!
    
    @IBOutlet weak var legsLabel: UILabel!
    
    var hero : HeroStats?

    override func viewDidLoad() {
        super.viewDidLoad()

        heroNameLabel.text = hero?.name
        attributeLabel.text = hero?.attribute
        attackTypeLabel.text = hero?.attackType
        legsLabel.text = "\((hero?.legs)!)"
        
        let imageUrl = "https://api.opendota.com" + (hero?.image)!
        
        heroImageView.downloadFrom(url: URL(string: imageUrl)!)
    }

}
