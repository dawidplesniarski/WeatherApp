//
//  WeatherViewController.swift
//  WeatherApp
//
//  Created by Dawid on 22/11/2019.
//  Copyright © 2019 Dawid. All rights reserved.
//

import UIKit
import Foundation

class WeatherViewController: UIViewController {

    let jsonParser = JsonParser()
    
    var temperature:Double = 0.0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        jsonParser.loadData()
    }
    
}
