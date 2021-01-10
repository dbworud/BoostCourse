//
//  HeroViewModel.swift
//  BoostCourse
//
//  Created by jaekyung you on 2021/01/10.
//

import UIKit


class HeroViewModel {
    
    var heros = [HeroStats]()
    
    // download json data
    func downloadJSON(completion: @escaping () -> Void) {
        
        let url = URL(string: "https://api.opendota.com/api/heroStats")
        
        URLSession.shared.dataTask(with: url!) { (data, resposne, error) in
            guard error == nil else { return }
                        
            do {
                self.heros = try JSONDecoder().decode([HeroStats].self, from: data!)
                DispatchQueue.main.async {
                    completion()
                }
            } catch {
                print(error)
            }
            
        }.resume()
        
    }
}
