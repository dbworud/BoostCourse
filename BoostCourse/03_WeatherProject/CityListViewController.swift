//
//  CityListViewController.swift
//  BoostCourse
//
//  Created by jaekyung you on 2021/01/09.
//

import UIKit

class CityListViewController: UIViewController {
    
    var country : Country?
    
//    let viewModel = WeatherViewModel()
    
    var cities : [City] = []
    
    @IBOutlet weak var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        guard let cityData = NSDataAsset(name: "\(country!.assetName)") else { return }
        
        do {
            cities = try JSONDecoder().decode([City].self, from: cityData.data)
            DispatchQueue.main.async {
                self.tableView.reloadData()
            }
        }
        catch {
            print(error)
        }

        tableView.delegate = self
        tableView.dataSource = self
    
    }

}


extension CityListViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
//        return cities.count
        return cities.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cityCell", for: indexPath) as! CityCell
        
        cell.cityNameLabel.text = cities[indexPath.row].cityName
        cell.stateImageView.image = UIImage(named: "\(cities[indexPath.row].state.imageString)")
        cell.celsiusLabel.text = cities[indexPath.row].temperatureText
        cell.rainProbabilityLabel.text = cities[indexPath.row].rainfallProbabilityText
        
        self.navigationItem.title = cities[indexPath.row].cityName
        
        return cell
    }

    // CityList -> CityDetail
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        performSegue(withIdentifier: "showDetail", sender: self)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let destination = segue.destination as? CityDetailViewController {
            destination.cities = cities[tableView.indexPathForSelectedRow!.row]
        }
    }
    
}
