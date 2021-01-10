//
//  Model.swift
//  BoostCourse
//
//  Created by jaekyung you on 2021/01/09.
//

import UIKit
import SwiftUI

struct Country : Codable {
    let koreanName: String
    let assetName: String
    
    enum CodingKeys: String, CodingKey {
        case koreanName = "korean_name"
        case assetName = "asset_name"
    }
}

struct City: Codable {
    let cityName: String
    let state: stateImage
    let celsius: Double
    let rainfallProbability: Int
    
    enum CodingKeys: String, CodingKey {
        case cityName = "city_name"
        case state, celsius
        case rainfallProbability = "rainfall_probability"
    }
    
    var FarenheitText: String {
        return "(\(celsius) * 9/5) + 32"
    }
    
    var temperatureText : String {
        return "섭씨 \(celsius)도 / 화씨 \(FarenheitText)도"
    }
    
    var rainfallProbabilityText: String {
        return "강수확률 \(rainfallProbability)%"
    }
}


// enum으로 state정의
/*
 10: sunny
 11: cloudy
 12: rainy
 13: snowy
 */

enum stateImage : Int, Codable {
    case sunny = 10
    case cloudy = 11
    case rainy = 12
    case snowy = 13
    
    var imageString: String {
        switch self.rawValue {
            case 10: return "sunny"
            case 11: return "cloudy"
            case 12: return "rainy"
            case 13: return "snowy"
            default: return ""
        }
        
    }
}
