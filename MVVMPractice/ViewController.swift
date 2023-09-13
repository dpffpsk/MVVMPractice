//
//  ViewController.swift
//  MVVMPractice
//
//  Created by wony on 2023/06/21.
//

import UIKit

class ViewController: UITableViewController {

    let list = ["GoodNews", "Orders", "GoodWeather", "Bluetooth"]
    let navigationBarAppearance = UINavigationBarAppearance()
    
    override func viewDidLoad() {
        super.viewDidLoad()
       
        self.navigationBarAppearance.backgroundColor = .systemBackground
        self.navigationController?.navigationBar.scrollEdgeAppearance = navigationBarAppearance
        self.navigationController?.navigationBar.standardAppearance = navigationBarAppearance
        
        self.navigationController?.navigationBar.prefersLargeTitles = false
        self.navigationController?.navigationBar.tintColor = .systemBlue
    }

    override func viewWillDisappear(_ animated: Bool) {
        
        self.navigationBarAppearance.backgroundColor = UIColor(displayP3Red: 52/255, green: 154/255, blue: 219/255, alpha: 1.0)
        self.navigationBarAppearance.titleTextAttributes = [NSAttributedString.Key.foregroundColor: UIColor.white]
        self.navigationBarAppearance.largeTitleTextAttributes = [NSAttributedString.Key.foregroundColor: UIColor.white]

        self.navigationController?.navigationBar.scrollEdgeAppearance = navigationBarAppearance
        self.navigationController?.navigationBar.standardAppearance = navigationBarAppearance
        
        self.navigationController?.navigationBar.prefersLargeTitles = true
        self.navigationController?.navigationBar.tintColor = .white
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return list.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "TableViewCell", for: indexPath)
        
        var content = cell.defaultContentConfiguration()
        content.text = list[indexPath.row]
        cell.contentConfiguration = content

        return cell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        switch indexPath.row {
        case 0:
            print("index 0")
            let newsVC = NewsListTableViewController()
            self.navigationController?.pushViewController(newsVC, animated: true)
        case 1:
            print("index 1")
            let orderVC = OrdersTableViewController()
//            let orderVC = AddOrderViewController()
            self.navigationController?.pushViewController(orderVC, animated: true)
        case 2:
            print("index 2")
            let weatherVC = WeatherListTableViewController()
            self.navigationController?.pushViewController(weatherVC, animated: true)
        case 3:
            print("index 3")
            let BluetoothVC = BluetoothViewController()
            self.navigationController?.pushViewController(BluetoothVC, animated: true)
        default:
            print("default")
        }
    }
}
