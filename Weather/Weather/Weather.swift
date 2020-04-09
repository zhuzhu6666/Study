//
//  Weather.swift
//  Weather
//
//  Created by zhu on 2020/4/3.
//  Copyright © 2020 zz. All rights reserved.
//

import Foundation

class Weather{
    var temp = ""
    var city = ""
    var condition = 0
    var info = ""
    
    var icon:String{
        switch (condition) {
        case 100:
            return "sunny"
        case 101...103:
            return "cloudy2"
        case 104:
            return "overcast"
        case 200...213:
            return "windy"
        case 300...301:
            return "tstorm1"
        case 302...304:
            return "tstorm3"
        case 305,306,309,314,399:
            return "light_rain"
        case 307,308,310...313,315...318:
            return "shower3"
        case 400,401,404...408,499:
            return "snow4"
        case 402,403,409,410:
            return "snow5"
        case 500...515:
            return "fog"
       
        default:
            return "dunno"
        }
    }
}
