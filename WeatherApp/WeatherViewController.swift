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
    @IBOutlet weak var weatherBackgroundImageView: UIImageView!
    @IBOutlet weak var timeLabel: UILabel!
    @IBOutlet weak var cityNameBlurEffect: UIVisualEffectView!
    @IBOutlet weak var tempBlurEffect: UIVisualEffectView!
    @IBOutlet weak var humidityBlurEffect: UIVisualEffectView!
    @IBOutlet weak var pressureBlurEffect: UIVisualEffectView!
    @IBOutlet weak var iconBlurEffect: UIVisualEffectView!
    @IBOutlet weak var descriptionBlurEffect: UIVisualEffectView!
    @IBOutlet weak var backButtonBlurEffect: UIVisualEffectView!
    @IBOutlet weak var timeBlurEffect: UIVisualEffectView!
    
    var userCityName:String = "Warszawa"
    var weatherIcon:String = ""
    var weatherDescription:String = ""
    var userCountryName:String = "PL"

    let numberToMonth = [1:"January",2:"February",3:"March",4:"April",5:"May",6:"June",7:"July",8:"August",9:"September",10:"October",11:"November",12:"Decenmber"]
    var currentDate:String = ""
    let jsonParser = JsonParser()
    let forecastParser = ForecastParser()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        itemsRadius()
        timeLabel.text = String(getTodayString())
        forecastParser.loadData()
        jsonParser.loadData(city: userCityName, country: userCountryName)
        run(after: 1){
            if(self.jsonParser.responseCode == 200){
            self.tempLabel.text = String(self.jsonParser.temperature) + "°C"
            self.humidityLabel.text = String(self.jsonParser.humidity) + "%"
            self.pressureLabel.text = String(self.jsonParser.pressure) + "hPa"
            self.descriptionLabel.text = self.jsonParser.weatherDescription
            self.cityNameLabel.text = self.userCityName
            self.weatherIconImageView.image = UIImage(named: self.jsonParser.weatherIcon)
                if(self.jsonParser.weatherDescription.contains("mist") || self.jsonParser.weatherDescription.contains("fog")){
                    self.weatherBackgroundImageView.image = UIImage(named: "mist_background")
                }else if(self.jsonParser.weatherDescription.contains("rain")){
                    self.weatherBackgroundImageView.image = UIImage(named: "rain_background")
                }else if(self.jsonParser.weatherDescription.contains("clear")){
                    self.weatherBackgroundImageView.image = UIImage(named: "clear_sky_background")
                }else if(self.jsonParser.weatherDescription.contains("clouds")){
                    self.weatherBackgroundImageView.image = UIImage(named:"clouds_background")
                }else if(self.jsonParser.weatherDescription.contains("thunder")){
                    self.weatherBackgroundImageView.image = UIImage(named:"thunder_background")
                }else if(self.jsonParser.weatherDescription.contains("snow")){
                    self.weatherBackgroundImageView.image = UIImage(named: "snow_background")
                }
            }else{
                self.dismiss(animated: true, completion: nil)
            }
        }
    }

    
    func run(after seconds: Int, completion: @escaping () -> Void){
        let deadline = DispatchTime.now() + .seconds(seconds)
        DispatchQueue.main.asyncAfter(deadline: deadline){
            completion()
        }
    }
    
    @IBAction func onBackPressed(_ sender: Any) {
        self.dismiss(animated: true, completion: nil)
    }
    @IBAction func testTapped(_ sender: Any) {
        forecastParser.loadData()
    }
    
    func itemsRadius(){
        cityNameBlurEffect.layer.cornerRadius = 10
        cityNameBlurEffect.clipsToBounds = true
        tempBlurEffect.layer.cornerRadius = 10
        tempBlurEffect.clipsToBounds = true
        humidityBlurEffect.layer.cornerRadius = 10
        humidityBlurEffect.clipsToBounds = true
        pressureBlurEffect.layer.cornerRadius = 10
        pressureBlurEffect.clipsToBounds = true
        iconBlurEffect.layer.cornerRadius = 10
        iconBlurEffect.clipsToBounds = true
        descriptionBlurEffect.layer.cornerRadius = 10
        descriptionBlurEffect.clipsToBounds = true
        backButtonBlurEffect.layer.cornerRadius = 10
        backButtonBlurEffect.clipsToBounds = true
        timeBlurEffect.layer.cornerRadius = 10
        timeBlurEffect.clipsToBounds = true
    }
    
    func getTodayString() -> String{

        let date = Date()
        let calender = Calendar.current
        let components = calender.dateComponents([.year,.month,.day,.hour,.minute,.second], from: date)

        let month = components.month
        let day = components.day
        let hour = components.hour
        let minute = components.minute

        let today_string = String(day!) + "-" + String(numberToMonth[month!]!) + " " + String(hour!)  + ":" + String(minute!)

        return today_string
    }
    
}
