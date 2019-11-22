//
//  WeatherViewController.swift
//  WeatherApp
//
//  Created by Dawid on 22/11/2019.
//  Copyright © 2019 Dawid. All rights reserved.
//

import UIKit

struct Weather{
    let temp:Double
    let pressure:Int
    let humidity:Int
    
}
class WeatherViewController: UIViewController {

    
    override func viewDidLoad() {
        super.viewDidLoad()
        let jsonUrlString = "https://api.openweathermap.org/data/2.5/weather?q=Tarnow,pl&APPID=749561a315b14523a8f5f1ef95e45864&units=metric"
        guard let url = URL(string: jsonUrlString) else { return }
        
        URLSession.shared.dataTask(with: url) { (data, response, err) in
            guard let data = data else { return }
            let dataAsString = String(data: data, encoding: .utf8)
            print(dataAsString!)
        }.resume()
    }
    
}
