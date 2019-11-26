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
    @IBOutlet weak var cityNameBlurEffect: UIVisualEffectView!
    @IBOutlet weak var tempBlurEffect: UIVisualEffectView!
    @IBOutlet weak var humidityBlurEffect: UIVisualEffectView!
    @IBOutlet weak var pressureBlurEffect: UIVisualEffectView!
    @IBOutlet weak var iconBlurEffect: UIVisualEffectView!
    @IBOutlet weak var descriptionBlurEffect: UIVisualEffectView!
    @IBOutlet weak var backButtonBlurEffect: UIVisualEffectView!
    
    var userCityName: String = "Warszawa"
    var weatherIcon:String = ""
    var weatherDescription:String = ""
    
    
    
    
    
    let jsonParser = JsonParser()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        itemsRadius()
        jsonParser.loadData(name: userCityName)
        run(after: 1){
            if(self.jsonParser.responseCode == 200){
            self.tempLabel.text = String(self.jsonParser.temperature)
            self.humidityLabel.text = String(self.jsonParser.humidity)
            self.pressureLabel.text = String(self.jsonParser.pressure)
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
        
    }
    
    
}
