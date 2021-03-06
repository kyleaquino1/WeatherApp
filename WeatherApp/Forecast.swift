//
//  Forecast.swift
//  WeatherApp
//
//  Created by Kyle Aquino on 7/14/17.
//  Copyright © 2017 Kyle Aquino. All rights reserved.
//

import Foundation
import Alamofire

class Forecast {
    
    private var _date: String!
    private var _weatherType: String!
    private var _highTemp: String!
    private var _lowTemp: String!
    
    var date: String {
        if _date == nil {
            _date = ""
        }
        return self._date
    }
    
    var weatherType: String {
        if _weatherType == nil {
            _weatherType = ""
        }
        return self._weatherType
    }
    
    var highTemp: String {
        if _highTemp == nil {
            _highTemp = ""
        }
        return self._highTemp
    }
    
    var lowTemp: String {
        if _lowTemp == nil {
            _lowTemp = ""
        }
        return self._lowTemp
    }
    
    init(weatherDict: Dictionary<String, Any>) {
        
        if let temp = weatherDict["temp"] as? Dictionary<String, Any> {
            
            if let min = temp["min"] as? Double {
                
                let kelvinToFarenheit = ((min * (9/5)) - 459.67)
                let formattedTemp = Double(round(10 * kelvinToFarenheit / 10))
                
                self._lowTemp = "\(formattedTemp)"
                
            }
            
            if let max = temp["max"] as? Double {
                
                let kelvinToFarenheit = ((max * (9/5)) - 459.67)
                let formattedTemp = Double(round(10 * kelvinToFarenheit / 10))
                
                self._highTemp = "\(formattedTemp)"
                
            }
            
            
        }
        
        if let weather = weatherDict["weather"] as? [Dictionary<String, Any>] {
            
            if let main = weather[0]["main"] as? String {
                
                self._weatherType = main
                
            }
            
            
            
        }
        
        if let date = weatherDict["dt"] as? Double {
            
            let unixConvertedDate = Date(timeIntervalSince1970: date)
            let dateFormatter = DateFormatter()
            dateFormatter.dateStyle = .full
            dateFormatter.dateFormat = "EEEE"
            dateFormatter.timeStyle = .none
            self._date  = unixConvertedDate.dayOfTheWeek()
        
            
        }
        
    }
    
}


extension Date {

    func dayOfTheWeek() -> String {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "EEEE"
        return dateFormatter.string(from: self)
    }
}
    

