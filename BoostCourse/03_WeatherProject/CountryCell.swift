//
//  CountryCell.swift
//  BoostCourse
//
//  Created by jaekyung you on 2021/01/09.
//

import UIKit

class CountryCell: UITableViewCell {
    
    @IBOutlet weak var countryImageView: UIImageView!
    
    @IBOutlet weak var countryNameLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
