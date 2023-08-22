//
//  Order.swift
//  MVVMPractice
//
//  Created by jiweon.lee on 2023/08/17.
//

import Foundation

enum CoffeeType: String, Codable, CaseIterable {
    case cappuccino
    case latte
    case espressino
    case cortado
}

enum CoffeeSize: String, Codable, CaseIterable {
    case small
    case medium
    case large
}

struct Order: Codable {
    let name: String
    let email: String
    let type: CoffeeType
    let size: CoffeeSize
}

extension Order {
    static var all: Resource<[Order]> = {
        guard let url = URL(string: "https://5e08b9ed-7d65-4e58-a508-84f12b5c3ce4.mock.pstmn.io/sample") else { fatalError("URL is incorrect!") }
        
        return Resource<[Order]>(url: url)
    }()
    
    static func create(vm: AddCoffeeOrderViewModel) -> Resource<Order?> {
        let order = Order(vm)
        
        guard let url = URL(string: "") else { fatalError("URL is incorrect!") }
        
        guard let data = try? JSONEncoder().encode(order) else { fatalError("Error encoding order!") }
        
        var resource = Resource<Order?>(url: url)
        resource.httpMethod = HttpMethod.get
        resource.body = data
        
        return resource
    }
}

extension Order {
    init?(_ vm: AddCoffeeOrderViewModel) {
        guard let name = vm.name,
              let email = vm.email,
              let selectedType = CoffeeType(rawValue: vm.selectedType!.lowercased()),
              let selectedSize = CoffeeSize(rawValue: vm.selectedSize!.lowercased()) else { return nil }
        
        self.name = name
        self.email = email
        self.type = selectedType
        self.size = selectedSize
    }
    
}
