//
//  HeroStats.swift
//  BoostCourse
//
//  Created by jaekyung you on 2021/01/10.
//

import UIKit

struct HeroStats : Decodable {
    let name: String
    let image: String // "/apps/dota2/images/heroes/antimage_full.png?"
    let attribute: String
    let attackType: String
    var legs: Int
    
    
    enum CodingKeys: String, CodingKey {
        case name = "localized_name"
        case image = "img"
        case attribute = "primary_attr"
        case attackType = "attack_type"
        case legs
    }
}

extension UIImageView {
    func downloadFrom(url: URL, contentMode mode: ContentMode = .scaleAspectFit) {
        contentMode = mode
        
        URLSession.shared.dataTask(with: url) { (data, response, error) in
            guard let httpURLResponse = response as? HTTPURLResponse, httpURLResponse.statusCode == 200,
                  let mimeType = response?.mimeType, mimeType.hasPrefix("image"),
                  let data = data, error == nil,
                  let image = UIImage(data: data)
            else { return }
                  
            DispatchQueue.main.async {
                self.image = image
            }
        }.resume()
    }
    
    func downloadFrom(link: String, contentMode mode: ContentMode = .scaleAspectFit) {
        guard let url = URL(string: link) else { return }
        downloadFrom(url: url, contentMode: mode)
    }
}
