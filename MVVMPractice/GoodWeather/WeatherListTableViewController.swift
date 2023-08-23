//
//  WeatherListTableViewController.swift
//  MVVMPractice
//
//  Created by jiweon.lee on 2023/08/23.
//

import UIKit

class WeatherListTableViewController: UITableViewController {
    let plusButton = UIButton()
    let settingsButton = UIBarButtonItem()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // title
        self.title = "GoodWeather"
        
        // + button
        self.plusButton.setImage(UIImage(systemName: "plus"), for: .normal)
        self.plusButton.contentVerticalAlignment = .fill
        self.plusButton.contentHorizontalAlignment = .fill
        self.plusButton.frame = CGRect(x: 0, y: 0, width: 25, height: 25)
        self.plusButton.addTarget(self, action: #selector(tappedButton), for: .touchUpInside)
        let addButton = UIBarButtonItem(customView: plusButton)
        navigationItem.setRightBarButton(addButton, animated: true)
        
        // setting button
        self.settingsButton.title = "Settings"
        self.settingsButton.style = .done
        navigationItem.setLeftBarButton(settingsButton, animated: true)
        
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        
        let navigationBarAppearance = UINavigationBarAppearance()
        navigationBarAppearance.backgroundColor = .systemBackground
        
        self.navigationController?.navigationBar.scrollEdgeAppearance = navigationBarAppearance
        self.navigationController?.navigationBar.standardAppearance = navigationBarAppearance
        
        self.navigationController?.navigationBar.prefersLargeTitles = false
        self.navigationController?.navigationBar.tintColor = .systemBlue
    }
    
    @objc func tappedButton() {
        
    }

}
