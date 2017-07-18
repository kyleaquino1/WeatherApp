//
//  Constants.swift
//  WeatherApp
//
//  Created by Kyle on 7/13/17.
//  Copyright © 2017 Kyle Aquino. All rights reserved.
//

import Foundation
let API_KEY = "4f5c385d283b48573806524f9e14e027"
let BASE_URL = "http://api.openweathermap.org/data/2.5/weather?"
let LATITUDE = "lat="
let LONGITUDE = "&lon="
let APP_ID = "&appid="

let FORECAST_BASE = "api.openweathermap.org/data/2.5/forecast/daily?"
let COUNT = "&cnt=6"

let CURRENTLAT = Location.sharedInstance.latitude
let CURRENTLONG = Location.sharedInstance.longitude

typealias DownloadComplete = () -> ()

let CURRENT_WEATHER_URL = "\(BASE_URL)\(LATITUDE)\(CURRENTLAT!)\(LONGITUDE)\(CURRENTLONG!)\(APP_ID)\(API_KEY)"
//let FORECAST_URL = "\(FORECAST_BASE)\(LATITUDE)36\(LONGITUDE)-115\(COUNT)\(APP_ID)\(API_KEY)"
let FORECAST_URL = "http://api.openweathermap.org/data/2.5/forecast/daily?lat=\(CURRENTLAT!)&lon=\(CURRENTLONG!)&cnt=10&mode=json&appid=42a1771a0b787bf12e734ada0cfc80cb"
