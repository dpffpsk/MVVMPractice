//
//  OrderViewModel.swift
//  MVVMPractice
//
//  Created by jiweon.lee on 2023/08/17.
//

import Foundation

class OrderListViewModel {
    var ordersViewModel: [OrderViewModel]
    
    init() {
        self.ordersViewModel = [OrderViewModel]()
    }
}

extension OrderListViewModel {
    func orderViewModel(at index: Int) -> OrderViewModel {
        return self.ordersViewModel[index]
    }
}

struct OrderViewModel {
    let order: Order
}

extension OrderViewModel {
    
    var name: String {
        return self.order.name
    }
    
    var email: String {
        return self.order.email
    }
    
    var type: String {
        return self.order.type.rawValue.capitalized
//        return self.order.type
    }
    
    var size: String {
        return self.order.size.rawValue.capitalized
//        return self.order.size
    }
}
