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
}

struct Main: Codable{
    let temp:Double
    let pressure:Int
    let humidity:Int
}


class JsonParser: UIViewController {

    var temperature = 0.0
    
    
    func loadData(){
        let jsonUrlString = "https://api.openweathermap.org/data/2.5/weather?q=Tarnow,pl&APPID=749561a315b14523a8f5f1ef95e45864&units=metric"
        guard let url = URL(string: jsonUrlString) else { return }

        URLSession.shared.dataTask(with: url) { (data, response, err) in
            guard let data = data else { return }
            //let dataAsString = String(data: data, encoding: .utf8)
            //print(dataAsString ?? "")
            do{
                //let json = try JSONSerialization.jsonObject(with: data, options: .mutableContainers)
                //let weather = Weather(json: json as! [String : Any])
                let weather = try JSONDecoder().decode(Weather.self, from: data)
                //self.weatherVC.temperature = weather.main.temp
                self.temperature = weather.main.temp
                print("JSON PARSER", self.temperature)
               // print(json)
            }catch let jsonErr{
                print(jsonErr)
            }
        }.resume()
    }


}/**let jsonUrlString = "https://api.openweathermap.org/data/2.5/weather?q=Tarnow,pl&APPID=749561a315b14523a8f5f1ef95e45864&units=metric"
guard let url = URL(string: jsonUrlString) else { return }

URLSession.shared.dataTask(with: url) { (data, response, err) in
    guard let data = data else { return }
    //let dataAsString = String(data: data, encoding: .utf8)
    //print(dataAsString ?? "")
    do{
        //let json = try JSONSerialization.jsonObject(with: data, options: .mutableContainers)
        //let weather = Weather(json: json as! [String : Any])
        let weatherJSON = try JSONDecoder().decode(Weather.self, from: data)
        print(weatherJSON.name)
        
       // print(json)
    }catch let jsonErr{
        print(jsonErr)
    }
    
}.resume()*/
