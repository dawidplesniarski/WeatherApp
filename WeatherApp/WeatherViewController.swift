//
//  WeatherViewController.swift
//  WeatherApp
//
//  Created by Dawid on 22/11/2019.
//  Copyright © 2019 Dawid. All rights reserved.
//

import UIKit

class WeatherViewController: UIViewController {
    
    @IBOutlet weak var tempLabel: UILabel!
    @IBOutlet weak var humidityLabel: UILabel!
    @IBOutlet weak var pressureLabel: UILabel!
    @IBOutlet weak var cityNameLabel: UILabel!
    @IBOutlet weak var descriptionLabel: UILabel!
    @IBOutlet weak var weatherIconImageView: UIImageView!
    
    
    var userCityName: String = "Warszawa"
    var weatherIcon:String = ""
    var weatherDescription:String = ""
    
    
    
    
    
    let jsonParser = JsonParser()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        jsonParser.loadData(name: userCityName)
        run(after: 1){
            self.tempLabel.text = String(self.jsonParser.temperature)
            self.humidityLabel.text = String(self.jsonParser.humidity)
            self.pressureLabel.text = String(self.jsonParser.pressure)
            self.descriptionLabel.text = self.jsonParser.weatherDescription
            self.cityNameLabel.text = self.userCityName
            self.weatherIconImageView.image = UIImage(named: self.jsonParser.weatherIcon)
        }
    }

    
    func run(after seconds: Int, completion: @escaping () -> Void){
        let deadline = DispatchTime.now() + .seconds(seconds)
        DispatchQueue.main.asyncAfter(deadline: deadline){
            completion()
        }
    }
    
    
    
}
