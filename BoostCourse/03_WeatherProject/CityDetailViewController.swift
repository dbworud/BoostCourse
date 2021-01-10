//
//  CityDetailViewController.swift
//  BoostCourse
//
//  Created by jaekyung you on 2021/01/10.
//

import UIKit

class CityDetailViewController: UIViewController {

    @IBOutlet weak var stateImageView: UIImageView!
    
    @IBOutlet weak var stateLabel: UILabel!
    
    @IBOutlet weak var tempartureLabel: UILabel!
    
    @IBOutlet weak var rainProbabilityLabel: UILabel!
    
    var cities : City?
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        // 섭씨 / 강수확률 에 따라 글씨색깔 -> extension String ?
        stateImageView.image = UIImage(named: "cities?.state")
        
    }
}
