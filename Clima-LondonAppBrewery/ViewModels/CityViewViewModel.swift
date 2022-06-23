//
//  CityViewViewModel.swift
//  Clima-LondonAppBrewery
//
//  Created by Paul Kirnoz on 22.06.2022.
//

import Foundation
import CoreLocation
import SwiftUI
///instances monitor changes in this class according to ObservableObject
final class CityViewViewModel: ObservableObject {
    
    @Published var weather = WeatherResponse.empty()
    
    @Published var city: String = "San Francisco" {
        didSet {
            getLocation()
        }
    }
    
    init() {
        getLocation()
    }
    
    var weatherIcon: String {
        if weather.current.weather.count > 0 {
            return weather.current.weather[0].icon
        }
        return "sunny"
    }
    
    var temperature: String {
        return getTempFor(temp: weather.current.temp)
    }
    
    var conditions: String {
        if weather.current.weather.count > 0 {
            return weather.current.weather[0].main
        }
        return ""
    }
    
    
    func getTempFor(temp: Double) -> String {
        return String(format: "%0.1f", temp)
    }
    
    ///get location for a certain place
    private func getLocation() {
        CLGeocoder().geocodeAddressString(city) { (placemarks, error) in
            if let places = placemarks, let place = places.first {
                self.getWeather(coord: place.location?.coordinate)
            }
        }
    }
    
    ///function to get the lat and lot for the address
    private func  getWeather(coord: CLLocationCoordinate2D?) {
        if let coord = coord {
            let urlString = API.getURLFor(lat: coord.latitude, lon: coord.longitude)
            getWeatherInternal(city: city, for: urlString)
            
        } else {
            let urlString = API.getURLFor(lat: 37.5485, lon: -121.9886)
            
            getWeatherInternal(city: city, for: urlString)
        }
    }
    
    ///func to get the weather information.
    ///Place where network calls are done
    private func getWeatherInternal(city: String, for urlString: String) {
        NetworkManager<WeatherResponse>.fetch(for: URL(string: urlString)!) { (result) in
            switch result {
                
            case .success(let response) :
                
                DispatchQueue.main.async {
                    self.weather = response
                }
                
            case .failure(let err):
                print(err.localizedDescription)
            }
        }
    }
    
    func getLottieAnimationFor(icon: String) -> String {
        withAnimation(.spring()) {
            switch icon {
            case "01d" :
                return "sunnyDay"
            case "01n" :
                return "clearNight"
            case "02d" :
                return "cloudyDayNight"
            case "03d" :
                return "cloudyDayNight"
            case "04d" :
                return "cloudyDayNight.json"
            case "02n" :
                return "cloudyNight"
            case "03n" :
                return "cloudyNight"
            case "04n" :
                return "cloudyNight"
            case "09d" :
                return "rainDay"
            case "10d" :
                return "rainDay"
            case "09n" :
                return "RainNight"
            case "10n" :
                return "RainNight"
            case "11d" :
                return "stormDay"
            case "11n" :
                return "stormDayNight"
            case "13d" :
                return "snowDay"
            case "13n" :
                return "snowNight"
            case "50d" :
                return "mistDayNight"
            case "50n" :
                return "mistDayNight"
            default :
                return "sunnyDay"
            }
        }
    }
    
    //    func getWeatherIconFor(icon: String) -> Image {
    //        withAnimation(.spring()) {
    //            switch icon {
    //            case "01d":
    //                return Image(systemName: "sun.max.fill")
    //            case "01n":
    //                return Image(systemName: "moon.fill")
    //            case "02d":
    //                return Image(systemName: "cloud.sun.fill")
    //            case "02n":
    //                return Image(systemName: "cloud.moon.fill")
    //            case "03d" :
    //                return Image(systemName: "cloud.fill")
    //            case "03n" :
    //                return Image(systemName: "cloud.fill")
    //            case "04d":
    //                return Image(systemName: "cloud.fill")
    //            case "04n":
    //                return Image(systemName: "cloud.fill")
    //            case "09d":
    //                return Image(systemName: "cloud.drizzle.fill")
    //            case "09n":
    //                return Image(systemName: "cloud.drizzle.fill")
    //            case "10d":
    //                return Image(systemName: "cloud.heavyrain.fill")
    //            case "10n":
    //                return Image(systemName: "cloud.heavyrain.fill")
    //            case "11d":
    //                return Image(systemName: "cloud.bolt.fill")
    //            case "11n":
    //                return Image(systemName: "cloud.bolt.fill")
    //            case "13d":
    //                return Image(systemName: "cloud.snow.fill")
    //            case "13n":
    //                return Image(systemName: "cloud.snow.fill")
    //            case "50d":
    //                return Image(systemName: "cloud.fog.fill")
    //            case "50n":
    //                return Image(systemName: "cloud.fog.fill")
    //            default :
    //                return Image(systemName: "sun.max.fill")
    //            }
    //        }
    //    }
}

