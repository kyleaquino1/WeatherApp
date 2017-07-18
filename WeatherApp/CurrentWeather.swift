//
//  CurrentWeather.swift
//  WeatherApp
//
//  Created by Kyle on 7/13/17.
//  Copyright © 2017 Kyle Aquino. All rights reserved.
//

import Foundation
import Alamofire

class CurrentWeather {
    
    private var _cityName: String!
    private var _date: String!
    private var _weatherType: String!
    private var _currentTemp: Double!
    
    var cityName: String {
        if _cityName == nil {
            _cityName = ""
        }
        return _cityName
    }
    
    var date: String {
        if _date == nil {
            _date = ""
        }
        
        let dateFormatter = DateFormatter()
        dateFormatter.dateStyle = .long
        dateFormatter.timeStyle = .none
        let currentDate = dateFormatter.string(from: Date())
        
        self._date = "Today, \(currentDate)"
        return _date
    }
    
    var weatherType: String {
        if _weatherType == nil {
            _weatherType = ""
        }
        return _weatherType
    }
    
    var currentTemp: Double {
        if _currentTemp == nil {
            _currentTemp = 0.0
        }
        return _currentTemp
    }
    
    func downloadWeatherDetails(completed: @escaping DownloadComplete) {
        //Alamofire downloaded
        
        let currentWeatherURL = URL(string: CURRENT_WEATHER_URL)
        Alamofire.request(currentWeatherURL!).responseJSON {
            response in let result = response.result
            
            if let dict = result.value as? Dictionary<String, Any> {
                
                if let name = dict["name"] as? String {
                    self._cityName = name.capitalized
                }
                
                if let weather = dict["weather"] as? [Dictionary<String, Any>] {
                    
                    
                    if let main = weather[0]["main"] as? String {
                        self._weatherType = main.capitalized
                    }
                    
                }
                
                if let main = dict["main"] as? Dictionary<String, Any> {
                    
                    if let currentTemperature = main["temp"] as? Double {
                        
                        let kelvinToFarenheit = ((currentTemperature * (9/5)) - 459.67)
                        let formattedTemp = Double(round(10 * kelvinToFarenheit / 10))
                        
                        self._currentTemp = formattedTemp
                        
                    }
                    
                }
                
            }
            completed()
        } 
    }
    
}





































