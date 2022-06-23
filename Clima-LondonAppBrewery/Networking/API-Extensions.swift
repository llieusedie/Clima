//
//  API-Extensions.swift
//  Clima-LondonAppBrewery
//
//  Created by Paul Kirnoz on 22.06.2022.
//

import Foundation

extension API {
    static let baseURLString = "https://api.openweathermap.org/data/2.5/"
    
    ///made to construct the url for the request
    static func getURLFor(lat: Double, lon: Double) -> String {
        return "\(baseURLString)onecall?lat=\(lat)&lon=\(lon)&exclude=minutely&appid=\(apiKey)&units=metric"
    }
}
