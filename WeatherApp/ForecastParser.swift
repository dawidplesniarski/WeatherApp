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

    func loadData(){
        let jsonUrlString = "http://api.openweathermap.org/data/2.5/forecast?q=Brzesko,PL&cnt=3&units=metric&APPID=89c55460ad37b6b6165aef516adae10a"
        guard let url = URL(string: jsonUrlString) else { return }
        
        URLSession.shared.dataTask(with: url) { (data, response, err) in
            guard let data = data else { return }
            do{
                let weatherObj = try JSONDecoder().decode(Forecast.self, from: data)
                
                for weatherCounter in weatherObj.list {
                    print(weatherCounter.main.temp)
                
                    for weatherCounterNested in weatherCounter.weather{
                        print(weatherCounterNested.icon)
                        print(weatherCounterNested.main)
                    }
                }
                

                
            }catch let jsonErr{
                print(jsonErr)
            }
        }.resume()
    }

    
}
