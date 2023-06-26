//
//  ViewController.swift
//  MVVMPractice
//
//  Created by wony on 2023/06/21.
//

import UIKit

class ViewController: UITableViewController {

    let list = ["GoodNews"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
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
}

