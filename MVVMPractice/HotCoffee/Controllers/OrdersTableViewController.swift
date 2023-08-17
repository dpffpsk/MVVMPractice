//
//  OrdersTableViewController.swift
//  MVVMPractice
//
//  Created by jiweon.lee on 2023/08/11.
//

import UIKit

class OrdersTableViewController: UITableViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        
    }
    
    private func populateOrders() {
        guard let coffeeOrdersURL = URL(string: "https://guarded-retreat-82533.herokuapp.com") else {
            fatalError("URL was incorrect")
        }
        
        let resource = Resource<[Order]>(url: coffeeOrdersURL)
        
        CoffeeWebService().load(resource: resource) { result in
            switch result {
            case .success(let orders):
                print(orders)
            case .failure(let error):
                print(error)
            }
        }
    }
}
