//
//  WeatherViewModel.swift
//  BoostCourse
//
//  Created by jaekyung you on 2021/01/10.
//

import UIKit

class WeatherViewModel {
    
    var countries: [Country] = []
    var cities: [City] = []
    
    var country: Country?
    
    // 1. decode Country
    func downloadCountry(completion: @escaping () -> Void) {
        guard let countryData = NSDataAsset(name: "countries") else { return }
        
        do {
            countries = try JSONDecoder().decode([Country].self, from: countryData.data)
            DispatchQueue.main.async {
                completion()
            }
        }
        catch {
            print(error)
        }
    }
    
    // 2. decode Cities
    func downloadCity(name: String, completion: @escaping () -> Void) {
        guard let cityData = NSDataAsset(name: name) else { return }
        
        do {
            cities = try JSONDecoder().decode([City].self, from: cityData.data)
            DispatchQueue.main.async {
                completion()
            }
        }
        catch {
            print(error)
        }
    }
    
}
