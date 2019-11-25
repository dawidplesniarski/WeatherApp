//
//  JsonParser.swift
//  WeatherApp
//
//  Created by Dawid on 23/11/2019.
//  Copyright © 2019 Dawid. All rights reserved.
//

import UIKit


struct Weather: Codable{
    let cod:Int
    let name:String
    let main:Main
    let weather:[WeatherArray]
}

struct Main: Codable{
    let temp:Double
    let pressure:Int
    let humidity:Int
}

struct WeatherArray: Codable{
    let description:String
    let icon:String
}


class JsonParser: UIViewController {

    var temperature = 0.0
    var pressure:Int = 0
    var humidity:Int = 0
    var city:String = ""
    var weatherIcon:String = ""
    var weatherDescription:String = ""
    
    
    func loadData(name: String){
        let jsonUrlString = "https://api.openweathermap.org/data/2.5/weather?q=\(name),pl&APPID=749561a315b14523a8f5f1ef95e45864&units=metric"
        guard let url = URL(string: jsonUrlString) else { return }

        URLSession.shared.dataTask(with: url) { (data, response, err) in
            guard let data = data else { return }
            do{
                let weatherObj = try JSONDecoder().decode(Weather.self, from: data)
                self.temperature = weatherObj.main.temp
                self.pressure = weatherObj.main.pressure
                self.humidity = weatherObj.main.humidity
                self.city = weatherObj.name
                
                for weatherCounter in weatherObj.weather{
                    self.weatherIcon = weatherCounter.icon
                    self.weatherDescription = weatherCounter.description
                }

                
            }catch let jsonErr{
                print(jsonErr)
            }
        }.resume()
    }
}
