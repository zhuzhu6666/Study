//
//  ViewController.swift
//  Weather
//
//  Created by zhu on 2020/4/1.
//  Copyright © 2020 zz. All rights reserved.
//

import UIKit
import CoreLocation
import Alamofire
import SwiftyJSON

class ViewController: UIViewController,CLLocationManagerDelegate,selectCityDelegate {
    func didChangeCity(city:String) {
        let paras = ["location":city,"key":appid]
        getWeather(paras: paras)
    }
    
    
    let locationManager = CLLocationManager()
    let weather = Weather()
    let appid = "b9b6538786fd4dde8c529afafaa3e611"

    @IBOutlet weak var weatherLabel: UILabel!
    @IBOutlet weak var weatherImage: UIImageView!
    @IBOutlet weak var temperature: UILabel!
    @IBOutlet weak var city: UILabel!
    @IBAction func left(_ sender: UIButton) {
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        locationManager.delegate = self
       
        //请求位置信息
        locationManager.requestLocation()
        //请求用户授权
        locationManager.requestWhenInUseAuthorization()
    }
    override func viewWillAppear(_ animated: Bool) {
      //设置位置精度
        locationManager.desiredAccuracy = kCLLocationAccuracyHundredMeters
        
        
        
     }
    func locationManager(_ manager: CLLocationManager, didFailWithError error: Error) {
         print("Error")
     }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        if segue.identifier == "selectCity"{
            let us = segue.destination as! SelectCityController
            us.currentCity = weather.city
            us.delegate = self
        }
        
    }
    
    
    
    
    
    
    //获取当前用户地理位置
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        let lat = locations[0].coordinate.latitude
        let lon = locations[0].coordinate.longitude
        print(lat,lon)
        let parameters = [
            "location": "\(lon),\(lat)",
            "key": appid
        ]
            getWeather(paras: parameters)
        
     }
        
     //请求API
    func getWeather(paras:[String:String]){
        AF.request("https://free-api.heweather.net/s6/weather/now", parameters: paras ).responseJSON { response in
        let weather = JSON(response.data as Any)
            print(weather)
            createWeather(weathers: weather)
            updateUI()
    }
        
        
    //给weather对象赋值
    func createWeather(weathers:JSON){
            weather.city = weathers["HeWeather6",0,"basic","location"].stringValue
            weather.temp = "\(weathers["HeWeather6",0,"now","tmp"].stringValue)˚"
            weather.condition = weathers["HeWeather6",0,"now","cond_code"].intValue
            weather.info = weathers["HeWeather6",0,"now","cond_txt"].stringValue
    }
    
        
    //更新界面
    func updateUI(){
            temperature.text = weather.temp
            city.text = weather.city
            weatherImage.image = UIImage.init(named: "\(weather.icon)")
            weatherLabel.text = weather.info
    }

}

}
