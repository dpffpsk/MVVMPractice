//
//  WeatherListTableViewController.swift
//  MVVMPractice
//
//  Created by jiweon.lee on 2023/08/23.
//

import UIKit

class WeatherListTableViewController: UITableViewController, AddWeatherDelegate, SettingsDelegate {
    
    let plusButton = UIButton()
    let settingsButton = UIBarButtonItem()
    private var weatherListViewModel = WeatherListViewModel()
    private var lastUnitSelection: Unit!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupNavigation()
        setupTableView()
        
        let userDefaults = UserDefaults.standard
        if let value = userDefaults.value(forKey: "unit") as? String {
            self.lastUnitSelection = Unit(rawValue: value)!
        }
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
        self.settingsButton.action = #selector(tappedSettingsButton)
        self.settingsButton.target = self
        navigationItem.setLeftBarButton(settingsButton, animated: true)
    }
    
    private func setupTableView() {
        tableView.register(WeatherCell.self, forCellReuseIdentifier: "WeatherCell")
    }
    
    // Settings 버튼 action
    @objc func tappedSettingsButton() {
        let settingsVC = SettingsTableViewController()
        settingsVC.delegate = self
        let naviVC = UINavigationController(rootViewController: settingsVC)
        self.present(naviVC, animated: true)
    }

    // + 버튼 action
    @objc func tappedPlusButton() {
        let addWeatherVC = AddWeatherCityViewController()
        addWeatherVC.delegate = self
        let naviVC = UINavigationController(rootViewController: addWeatherVC)
        self.present(naviVC, animated: true)
    }
    
    // AddWeatherDelegate
    func addWeatherDidSave(vm: WeatherViewModel) {
        weatherListViewModel.addWeatherViewModel(vm)
        self.tableView.reloadData()
    }
    
    // SettingsDelegate
    func settingsDone(vm: SettingsViewModel) {
        if lastUnitSelection.rawValue != vm.selectedUnit.rawValue {
            weatherListViewModel.updateUnit(to: vm.selectedUnit)
            self.tableView.reloadData()
            lastUnitSelection = Unit(rawValue: vm.selectedUnit.rawValue)!
        }
    }
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return weatherListViewModel.numberOfRows(section)
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "WeatherCell", for: indexPath) as? WeatherCell else { return UITableViewCell() }

        let weatherVM = weatherListViewModel.modelAt(indexPath.row)
         
        cell.cityLabel.text = weatherVM.city
        cell.temperatureLabel.text = weatherVM.temperature.formatAsDegree()
        
        return cell
    }
    
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 120
    }
}
