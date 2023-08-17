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
    let segmentedControl = UISegmentedControl(items: ["Small", "Medium", "Large"])
    let firstTextField = UITextField()
    let secondTextField = UITextField()
    let cancelButton = UIBarButtonItem()
    let saveButton = UIBarButtonItem()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        self.navigationItem.title = "Add New Order"
        
        setupAttribute()
        setupLayout()
    }
    
    func setupAttribute() {
        view.addSubview(tableView)
        view.addSubview(segmentedControl)
        view.addSubview(firstTextField)
        view.addSubview(secondTextField)
        
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: "order")
        tableView.rowHeight = UITableView.automaticDimension
        tableView.delegate = self
        tableView.dataSource = self
        
        segmentedControl.selectedSegmentIndex = 0
        
        firstTextField.placeholder = "first"
        firstTextField.borderStyle = UITextField.BorderStyle.roundedRect
        
        secondTextField.placeholder = "second"
        secondTextField.borderStyle = UITextField.BorderStyle.roundedRect
        
        cancelButton.title = "Cancel"
        cancelButton.style = .done
        
        saveButton.title = "Save"
        saveButton.style = .done
        
        navigationItem.setRightBarButton(cancelButton, animated: true)
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
}

extension AddOrderViewController: UITableViewDataSource, UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        return UITableViewCell()
    }
}
