//
//  ViewController.swift
//  WeatherApp
//
//  Created by Dawid on 21/11/2019.
//  Copyright © 2019 Dawid. All rights reserved.
//

import UIKit
//import Foundation

class ViewController: UIViewController {
    
    @IBOutlet weak var submitButtonBlurEffect: UIVisualEffectView!
    @IBOutlet weak var typeCityBlurEffect: UIVisualEffectView!
    @IBOutlet weak var typeCity: UITextField!
    var cityName:String = ""
    let jsonParser = JsonParser()

    override func viewDidLoad() {
        super.viewDidLoad()
        submitButtonBlurEffect.layer.cornerRadius = 10
        submitButtonBlurEffect.clipsToBounds = true
        typeCityBlurEffect.layer.cornerRadius=10
        typeCityBlurEffect.clipsToBounds = true
    }
    
    
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if(segue.identifier == "mainSegue"){
            let weatherVC = segue.destination as! WeatherViewController
            weatherVC.userCityName = typeCity.text ?? "Warszawa"
        }

    }

}

