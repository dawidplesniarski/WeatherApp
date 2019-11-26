//
//  ViewController.swift
//  WeatherApp
//
//  Created by Dawid on 21/11/2019.
//  Copyright © 2019 Dawid. All rights reserved.
//

import UIKit
//import Foundation

class ViewController: UIViewController, UIPickerViewDataSource, UIPickerViewDelegate {
    
    
    
    @IBOutlet weak var submitButtonBlurEffect: UIVisualEffectView!
    @IBOutlet weak var typeCityBlurEffect: UIVisualEffectView!
    @IBOutlet weak var typeCity: UITextField!
    @IBOutlet weak var countriesPickerView: UIPickerView!
    
    var cityName:String = ""
    var countryName:String = ""
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
            weatherVC.userCountryName = countryName
        }

    }
    
    let countriesList:Array = ["PL","AT","DE","SE","GB","CZ","FR","IT","CH","ES","UA","NO","FI","DK","BY"]
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return countriesList.count
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return countriesList[row]
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        countryName = countriesList[row]
    }

}

