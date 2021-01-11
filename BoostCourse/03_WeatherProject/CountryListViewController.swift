//
//  CountryListViewController.swift
//  BoostCourse
//
//  Created by jaekyung you on 2021/01/09.
//

import UIKit

class CountryListViewController: UIViewController {

//    var countries: [Country] = []
    @IBOutlet weak var tableView: UITableView!
    
    let viewModel = WeatherViewModel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        viewModel.downloadCountry {
            self.tableView.reloadData()
        }
        
        tableView.delegate = self
        tableView.dataSource = self

    }

}

extension CountryListViewController : UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel.countries.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "countryCell", for: indexPath) as! CountryCell
        
        // let countryName = countries[indexPath.row].koreanName
        let countryImage = viewModel.countries[indexPath.row].assetName // "flag_\(country.assetName)"
        
        cell.countryNameLabel.text = viewModel.countries[indexPath.row].koreanName
        cell.countryImageView.image = UIImage(named: "flag_\(countryImage)")
        
        return cell
        
    }
    
    // selected Row
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        performSegue(withIdentifier: "showCities", sender: self)
    }
    
    // pass data through segue  "\(asset_name).json"
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let destination = segue.destination as? CityListViewController {
            
            destination.country = viewModel.countries[tableView.indexPathForSelectedRow!.row]
            
        }
    }
    
}
