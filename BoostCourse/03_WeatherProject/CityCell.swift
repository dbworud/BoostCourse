//
//  CityCell.swift
//  BoostCourse
//
//  Created by jaekyung you on 2021/01/09.
//

import UIKit

class CityCell: UITableViewCell {

    @IBOutlet weak var stateImageView: UIImageView!
    
    @IBOutlet weak var cityNameLabel: UILabel!
    
    @IBOutlet weak var celsiusLabel: UILabel!
    
    @IBOutlet weak var rainProbabilityLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
