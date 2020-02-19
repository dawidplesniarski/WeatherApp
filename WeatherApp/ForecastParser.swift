//
//  ForecastParser.swift
//  WeatherApp
//
//  Created by Dawid on 19/02/2020.
//  Copyright © 2020 Dawid. All rights reserved.
//

import UIKit

struct Forecast: Codable{
    let list: [ForecastArray]
}

struct ForecastArray: Codable {
    let main:MainForecast
    let weather: [WeatherForArray]
}

struct MainForecast: Codable{
    let temp:Double
}


struct WeatherForArray: Codable {
    let main: String
    let icon: String
}



class ForecastParser: UIViewController {
    
    var forecastArray:[(temp:Double,icon:String,description:String)] = []

    func loadData(){
        let jsonUrlString = "http://api.openweathermap.org/data/2.5/forecast?q=Brzesko,PL&cnt=10&units=metric&APPID=\(getApiKey())"
        guard let url = URL(string: jsonUrlString) else { return }
        
        URLSession.shared.dataTask(with: url) { (data, response, err) in
            guard let data = data else { return }
            do{
                let weatherObj = try JSONDecoder().decode(Forecast.self, from: data)
                
                for weatherCounter in weatherObj.list {
                
                    for weatherCounterNested in weatherCounter.weather{
                        
                        self.forecastArray.append((
                            temp: weatherCounter.main.temp,
                            icon: weatherCounterNested.icon,
                            description: weatherCounterNested.main
                        ))
                    }
                }
                
                                
                
            }catch let jsonErr{
                print(jsonErr)
            }
        }.resume()
    }

    func getApiKey() -> String {
      let filePath = Bundle.main.path(forResource: "keys", ofType: "plist")
      let plist = NSDictionary(contentsOfFile:filePath!)
      let value = plist?.object(forKey: "apiKey") as! String
      return value
    }
}
