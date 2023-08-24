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
        
        setupNavigation()
        setupTableView()
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        
        let navigationBarAppearance = UINavigationBarAppearance()
        navigationBarAppearance.backgroundColor = .systemBackground
        
        self.navigationController?.navigationBar.scrollEdgeAppearance = navigationBarAppearance
        self.navigationController?.navigationBar.standardAppearance = navigationBarAppearance
        
        self.navigationController?.navigationBar.prefersLargeTitles = false
        self.navigationController?.navigationBar.tintColor = .systemBlue
    }
    
    private func setupNavigation() {
        // title
        self.title = "GoodWeather"
        
        // + button
        self.plusButton.setImage(UIImage(systemName: "plus"), for: .normal)
        self.plusButton.contentVerticalAlignment = .fill
        self.plusButton.contentHorizontalAlignment = .fill
        self.plusButton.frame = CGRect(x: 0, y: 0, width: 25, height: 25)
        self.plusButton.addTarget(self, action: #selector(tappedPlusButton), for: .touchUpInside)
        let addButton = UIBarButtonItem(customView: plusButton)
        navigationItem.setRightBarButton(addButton, animated: true)
        
        // setting button
        self.settingsButton.title = "Settings"
        self.settingsButton.style = .done
        navigationItem.setLeftBarButton(settingsButton, animated: true)
    }
    
    private func setupTableView() {
        tableView.register(WeatherCell.self, forCellReuseIdentifier: "WeatherCell")
    }

    // plusButton action
    @objc func tappedPlusButton() {
        let addWeatherVC = AddWeatherCityViewController()
        let naviVC = UINavigationController(rootViewController: addWeatherVC)
        self.present(naviVC, animated: true)
    }
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "WeatherCell", for: indexPath) as? WeatherCell else { return UITableViewCell() }

        cell.cityLabel.text = "Houston"
        cell.temperatureLabel.text = "70°"
        
        return cell
    }
    
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 120
    }
}
