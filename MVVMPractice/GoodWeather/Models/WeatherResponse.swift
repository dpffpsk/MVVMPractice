//
//  WeatherResponse.swift
//  MVVMPractice
//
//  Created by jiweon.lee on 2023/09/12.
//

import Foundation

struct WeatherResponse: Decodable {
    let name: String
    let main: Weather
}

struct Weather: Codable {
    let temp: Double
    let humidity: Double
}
