//
//  JSONEncodeDecode.swift
//  BoostCourse
//
//  Created by jaekyung you on 2021/01/09.
//

import UIKit

// JSONEncoder
struct GroceryProduct: Codable {
    var name: String
    var points: Int
    var description: String?
}

let pear = GroceryProduct(name: "Pear", points: 250, description: "A ripe pear")

let json =  """
{
    "name" : "Durian",
    "points" : 600,
    "description" : "A fruit with distinctive scent"
}
""".data(using: .utf8)!

class JSONEncodeDecodeViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    @IBAction func TappedEncode(_ sender: Any) {
        do {
            let encoder = JSONEncoder()
            encoder.outputFormatting = .prettyPrinted
            let data = try encoder.encode(pear)
            print(String(data: data, encoding: .utf8)!)
        } catch {
            print(error)
        }
        
    }
    
    @IBAction func TappedDecode(_ sender: Any) {
        
        do {
            let data = try JSONDecoder().decode(GroceryProduct.self, from: json)
            print(data.name)
            
        } catch {
            print(error)
        }
    }
    
}
