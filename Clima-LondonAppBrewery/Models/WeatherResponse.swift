//
//  WeatherResponse.swift
//  Clima-LondonAppBrewery
//
//  Created by Paul Kirnoz on 22.06.2022.
//

import Foundation

struct WeatherResponse: Codable {
    var current: Weather

    
    ///creates instances for each hour weather data (23 hours)
    ///creates instances for each day weather data (8 days)
    static func empty() -> WeatherResponse {
        return WeatherResponse(current: Weather())
    }
}
