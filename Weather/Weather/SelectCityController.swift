//
//  SelectCityController.swift
//  Weather
//
//  Created by zhu on 2020/4/3.
//  Copyright © 2020 zz. All rights reserved.
//

import UIKit

protocol selectCityDelegate {
    func didChangeCity(city:String)
}

class SelectCityController: UIViewController {
    var currentCity = ""
    var delegate:selectCityDelegate?
    @IBOutlet weak var inputCity: UITextField!
    @IBAction func changCity(_ sender: UIButton) {
        delegate!.didChangeCity(city: inputCity.text!)
        dismiss(animated: true, completion: nil)
    }
    @IBAction func left(_ sender: Any) {
        dismiss(animated: true, completion: nil)
    }
    @IBOutlet weak var currentCityLabel: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()
        currentCityLabel.text = currentCity
        
        // Do any additional setup after loading the view.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
