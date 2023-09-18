//
//  SettingsTableViewController.swift
//  MVVMPractice
//
//  Created by jiweon.lee on 2023/09/18.
//

import UIKit

class SettingsTableViewController: UITableViewController {

    let doneButton = UIBarButtonItem()
    private var settingsViewModel = SettingsViewModel()
    let navigationBarAppearance = UINavigationBarAppearance()
    
    override func viewDidLoad() {
        super.viewDidLoad()

//        self.navigationController?.navigationBar.prefersLargeTitles = true
        
        view.backgroundColor = .systemBackground
        
        self.navigationBarAppearance.backgroundColor = UIColor(displayP3Red: 52/255, green: 154/255, blue: 219/255, alpha: 1.0)
        self.navigationBarAppearance.titleTextAttributes = [NSAttributedString.Key.foregroundColor: UIColor.white]
        
        self.navigationController?.navigationBar.scrollEdgeAppearance = navigationBarAppearance
        self.navigationController?.navigationBar.standardAppearance = navigationBarAppearance
        
        self.navigationController?.navigationBar.tintColor = .white
        
        setupNavigation()
        setupTableView()
    }
    
//    override func viewWillDisappear(_ animated: Bool) {
//        self.navigationBarAppearance.backgroundColor = .systemBackground
//
//        self.navigationController?.navigationBar.scrollEdgeAppearance = navigationBarAppearance
//        self.navigationController?.navigationBar.standardAppearance = navigationBarAppearance
//
//        self.navigationController?.navigationBar.tintColor = .systemBlue
//    }
    
    private func setupNavigation() {
        // title
        self.title = "Settings"
        
        // done button
        self.doneButton.title = "Done"
        self.doneButton.style = .done
        self.doneButton.action = #selector(tappedDoneButton)
        self.doneButton.target = self
        navigationItem.setRightBarButton(doneButton, animated: true)
    }
    
    @objc private func tappedDoneButton() {
        
    }
    
    private func setupTableView() {
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: "SettingsCell")
    }

    // MARK: - Table view data source
    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return settingsViewModel.units.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let settingItem = settingsViewModel.units[indexPath.row]
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "SettingsCell", for: indexPath)
        
        var content = cell.defaultContentConfiguration()
        content.text = settingItem.displayName
        cell.contentConfiguration = content
        
        if settingItem == settingsViewModel.selectedUnit {
            cell.accessoryType = .checkmark
        }
        
        return cell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        // uncheck all cells
        tableView.visibleCells.forEach { cell in
            cell.accessoryType = .none
        }
        
        if let cell = tableView.cellForRow(at: indexPath) {
            cell.accessoryType = .checkmark
            let unit = Unit.allCases[indexPath.row]
            settingsViewModel.selectedUnit = unit
        }
    }
    
    override func tableView(_ tableView: UITableView, didDeselectRowAt indexPath: IndexPath) {
        
        if let cell = tableView.cellForRow(at: indexPath) {
            cell.accessoryType = .none
        }
    }
}
