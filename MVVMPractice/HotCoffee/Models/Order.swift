//
//  Order.swift
//  MVVMPractice
//
//  Created by jiweon.lee on 2023/08/17.
//

import Foundation

enum CoffeeType: String, Codable {
    case cappuccino
    case latte
    case espressino
    case cortado
}

enum CoffeeSize: String, Codable {
    case small
    case medium
    case large
}

struct Order: Codable {
    let name: String
    let email: String
    let type: CoffeeSize
    let size: CoffeeSize
}
