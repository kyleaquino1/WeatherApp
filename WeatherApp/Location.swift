//
//  Location.swift
//  WeatherApp
//
//  Created by Kyle Aquino on 7/15/17.
//  Copyright © 2017 Kyle Aquino. All rights reserved.
//

import CoreLocation

class Location {
    
    static var sharedInstance = Location()
    private init() {
        
    }
    
    var latitude: Double!
    var longitude: Double!
    
}
