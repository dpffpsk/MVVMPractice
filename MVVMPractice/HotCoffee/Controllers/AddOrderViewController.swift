//
//  AddOrderViewController.swift
//  MVVMPractice
//
//  Created by jiweon.lee on 2023/08/11.
//

import UIKit
import SnapKit

class AddOrderViewController: UIViewController {

    let tableView = UITableView(frame: .zero, style: .plain)
//    let segmentedControl = UISegmentedControl(items: ["Small", "Medium", "Large"])
    var segmentedControl: UISegmentedControl!
    let firstTextField = UITextField()
    let secondTextField = UITextField()
    let cancelButton = UIBarButtonItem()
    let saveButton = UIBarButtonItem()
    
    var vm = AddCoffeeOrderViewModel()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        self.navigationItem.title = "Add New Order"

        self.segmentedControl = UISegmentedControl(items: self.vm.sizes)
        
        setupAttribute()
        setupLayout()
    }
    
    func setupAttribute() {
        view.addSubview(tableView)
        view.addSubview(segmentedControl)
        view.addSubview(firstTextField)
        view.addSubview(secondTextField)
        
        view.backgroundColor = .systemBackground
        
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: "AddOrderCell")
        tableView.rowHeight = UITableView.automaticDimension
        tableView.delegate = self
        tableView.dataSource = self
        
        firstTextField.placeholder = "first"
        firstTextField.borderStyle = UITextField.BorderStyle.roundedRect
        
        secondTextField.placeholder = "second"
        secondTextField.borderStyle = UITextField.BorderStyle.roundedRect
        
        cancelButton.title = "Cancel"
        cancelButton.style = .done
        cancelButton.target = self
        cancelButton.action = #selector(tappedCancelButton)
        navigationItem.setLeftBarButton(cancelButton, animated: true)
        
        saveButton.title = "Save"
        saveButton.style = .done
        saveButton.target = self
        saveButton.action = #selector(tappedSaveButton)
        navigationItem.setRightBarButton(saveButton, animated: true)
    }
    
    func setupLayout() {
        tableView.snp.makeConstraints {
            $0.top.equalToSuperview()
            $0.leading.trailing.equalToSuperview()
            $0.height.equalTo(self.view.frame.height/2)
        }
        
        segmentedControl.snp.makeConstraints {
            $0.top.equalTo(tableView.snp.bottom).offset(20)
            $0.centerX.equalToSuperview()
            $0.width.equalTo(300)
            $0.height.equalTo(40)
        }
        
        firstTextField.snp.makeConstraints {
            $0.top.equalTo(segmentedControl.snp.bottom).offset(20)
            $0.centerX.equalToSuperview()
            $0.width.equalTo(200)
            $0.height.equalTo(40)
        }
        secondTextField.snp.makeConstraints {
            $0.top.equalTo(firstTextField.snp.bottom).offset(20)
            $0.centerX.equalToSuperview()
            $0.width.equalTo(200)
            $0.height.equalTo(40)
        }
    }
    
    @objc private func tappedCancelButton() {
        self.dismiss(animated: true)
    }
    
    @objc private func tappedSaveButton() {
        let name = firstTextField.text
        let email = secondTextField.text
        
        let selectedSize = segmentedControl.titleForSegment(at: segmentedControl.selectedSegmentIndex)
        
        guard let indexPath = self.tableView.indexPathForSelectedRow else { fatalError("Error in selecting coffee") }
        
        self.vm.name = name
        self.vm.email = email
        
        self.vm.selectedSize = selectedSize
        self.vm.selectedType = self.vm.types[indexPath.row]
    }
}

extension AddOrderViewController: UITableViewDataSource, UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.vm.types.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "AddOrderCell", for: indexPath)
        
        var content = cell.defaultContentConfiguration()
        content.text = self.vm.types[indexPath.row]
        cell.contentConfiguration = content
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.cellForRow(at: indexPath)?.accessoryType = .checkmark
    }
    
    func tableView(_ tableView: UITableView, didDeselectRowAt indexPath: IndexPath) {
        tableView.cellForRow(at: indexPath)?.accessoryType = .none
    }
}
