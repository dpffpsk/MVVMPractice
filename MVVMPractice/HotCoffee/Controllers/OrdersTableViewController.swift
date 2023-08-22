//
//  OrdersTableViewController.swift
//  MVVMPractice
//
//  Created by jiweon.lee on 2023/08/11.
//

import UIKit

class OrdersTableViewController: UITableViewController, AddCoffeeOrderDelegate {

    var orderListViewModel = OrderListViewModel()
    let button = UIButton()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // title
        self.title = "Orders"
        
        // + button
        button.setImage(UIImage(systemName: "plus"), for: .normal)
        button.contentVerticalAlignment = .fill
        button.contentHorizontalAlignment = .fill
        button.imageView?.contentMode = .scaleAspectFit
        button.frame = CGRect(x: 0, y: 0, width: 25, height: 25)
        
        button.addTarget(self, action: #selector(tappedButton), for: .touchUpInside)
        let addButton = UIBarButtonItem(customView: button)
        navigationItem.setRightBarButton(addButton, animated: true)
        
        tableView.register(OrderCell.self, forCellReuseIdentifier: "OrderCell")
        
        populateOrders()
    }
    
    private func populateOrders() {
        CoffeeWebService().load(resource: Order.all) { [weak self] result in
            switch result {
            case .success(let orders):
                self?.orderListViewModel.ordersViewModel = orders.map(OrderViewModel.init)
                self?.tableView.reloadData()
            case .failure(let error):
                print(error)
            }
        }
    }
    
    func addCoffeeOrderViewControllerDidSave(order: Order, controller: UIViewController) {
        controller.dismiss(animated: true, completion: nil)
        
        let orderVM = OrderViewModel(order: order)
        self.orderListViewModel.ordersViewModel.append(orderVM)
        self.tableView.insertRows(at: [IndexPath.init(row: self.orderListViewModel.ordersViewModel.count - 1, section: 0)], with: .automatic)
    }
    
    func addCoffeeOrderViewControllerDidClose(controller: UIViewController) {
        controller.dismiss(animated: true, completion: nil)
    }
    
    @objc private func tappedButton() {
        let modalVC = AddOrderViewController()
        modalVC.delegate = self
        let naviVC = UINavigationController(rootViewController: modalVC)
        self.present(naviVC, animated: true)
    }
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.orderListViewModel.ordersViewModel.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let vm = self.orderListViewModel.orderViewModel(at: indexPath.row)
        
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "OrderCell", for: indexPath) as? OrderCell else { return UITableViewCell() }
        
        var content = cell.defaultContentConfiguration()
        content.text = vm.type
        content.secondaryText = vm.size
        cell.contentConfiguration = content
        
        return cell
    }
}
