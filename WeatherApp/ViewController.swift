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
    
    @IBOutlet weak var typeCity: UITextField!
    var cityName:String = ""
    let jsonParser = JsonParser()

    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if(segue.identifier == "mainSegue"){
            let weatherVC = segue.destination as! WeatherViewController
            weatherVC.userCityName = typeCity.text ?? "Warszawa"
        }

    }

}

