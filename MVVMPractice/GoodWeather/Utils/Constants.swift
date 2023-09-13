//
//  Constants.swift
//  MVVMPractice
//
//  Created by jiweon.lee on 2023/09/12.
//

import Foundation

struct Constants {
    struct Urls {
        static func urlForWeatherByCity(city: String) -> URL {
            let api_key = ""
            
            return URL(string: "https://api.openweathermap.org/data/2.5/weather?q=\(city.escaped())&appid=\(api_key)&units=imperial")!
        }
    }
}
