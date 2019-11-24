//
//  WeatherViewController.swift
//  WeatherApp
//
//  Created by Dawid on 22/11/2019.
//  Copyright © 2019 Dawid. All rights reserved.
//

import UIKit

class WeatherViewController: UIViewController {
    
    @IBOutlet weak var testLabel: UILabel!
    
    let jsonParser = JsonParser()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        jsonParser.loadData()
        run(after: 1){
            self.testLabel.text = String(self.jsonParser.temperature)
        }
    }

    
    func run(after seconds: Int, completion: @escaping () -> Void){
        let deadline = DispatchTime.now() + .seconds(seconds)
        DispatchQueue.main.asyncAfter(deadline: deadline){
            completion()
        }
    }
    
    
    
}
