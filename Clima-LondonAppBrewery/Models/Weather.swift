//
//  Weather.swift
//  Clima-LondonAppBrewery
//
//  Created by Paul Kirnoz on 22.06.2022.
//

import Foundation
import UIKit


struct Weather: Codable, Identifiable {
    
    
    var temp : Double
    var weather: [WeatherDetail]
    
    enum CodingKey: String {
        
        case temp
        case weather
    }
    
    init() {
        
        temp = 0.0
        weather = []
    }
}

///id is not passed as a parameter and instead is made as a computed property
///that way swift knows that while decoding that there's no need to decode the ID cause it is a COMPUTED PROPERTY
extension Weather {
    var id: UUID {
        return UUID()
    }
}

