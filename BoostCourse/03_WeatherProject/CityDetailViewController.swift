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
        
        // 섭씨 / 강수확률 에 따라 글씨색깔 -> extension String ?
        
        stateImageView.image = UIImage(named: "\(cities!.state.imageString)")
        stateLabel.text = cities!.state.stateText
        tempartureLabel.text = cities?.temperatureText
        rainProbabilityLabel.text = cities?.rainfallProbabilityText
    }
}
