//
//  AddWeatherCityViewController.swift
//  MVVMPractice
//
//  Created by jiweon.lee on 2023/08/23.
//

import UIKit

protocol AddWeatherDelegate {
    func addWeatherDidSave(vm: WeatherViewModel)
}

class AddWeatherCityViewController: UIViewController {

    let closeButton = UIBarButtonItem()
    let navigationBarAppearance = UINavigationBarAppearance()
    private var addWeatherVM = AddWeatherViewModel()
    
    var delegate: AddWeatherDelegate?
    
    lazy var textField: UITextField = {
        let textField = UITextField()
        textField.placeholder = "city name"
        textField.layer.borderColor = UIColor.white.cgColor
        textField.layer.borderWidth = 1.0
        return textField
    }()
    
    lazy var button: UIButton = {
        let btn = UIButton()
        btn.setTitle("Save", for: .normal)
        btn.setTitleColor(.white, for: .normal)
        btn.backgroundColor = .systemBlue
        btn.addTarget(self, action: #selector(saveCityButtonPressed), for: .touchUpInside)
        return btn
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.title = "Add City"
        view.backgroundColor = .systemBackground
        
        self.navigationBarAppearance.backgroundColor = UIColor(displayP3Red: 52/255, green: 154/255, blue: 219/255, alpha: 1.0)
        self.navigationBarAppearance.titleTextAttributes = [NSAttributedString.Key.foregroundColor: UIColor.white]
        
        self.navigationController?.navigationBar.scrollEdgeAppearance = navigationBarAppearance
        self.navigationController?.navigationBar.standardAppearance = navigationBarAppearance
        
        self.navigationController?.navigationBar.tintColor = .white
        
        setupNavigation()
        setupLayout()
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        self.navigationBarAppearance.backgroundColor = .systemBackground
        
        self.navigationController?.navigationBar.scrollEdgeAppearance = navigationBarAppearance
        self.navigationController?.navigationBar.standardAppearance = navigationBarAppearance
        
        self.navigationController?.navigationBar.tintColor = .systemBlue
    }
    
    private func setupNavigation() {
        self.closeButton.style = .done
        self.closeButton.title = "Close"
        self.closeButton.action = #selector(close)
        self.closeButton.target = self
        navigationItem.setLeftBarButton(closeButton, animated: true)
    }
    
    private func setupLayout() {
        view.addSubview(textField)
        view.addSubview(button)
        
        textField.snp.makeConstraints {
            $0.top.equalToSuperview().inset(100)
            $0.centerX.equalToSuperview()
            $0.height.equalTo(40)
            $0.width.equalTo(200)
        }
        
        button.snp.makeConstraints {
            $0.top.equalTo(textField.snp.bottom).offset(30)
            $0.centerX.equalToSuperview()
            $0.height.equalTo(30)
            $0.width.equalTo(80)
        }
    }
    
    // Close 버튼 이벤트
    @objc func close() {
        self.dismiss(animated: true)
    }
    
    // Save 버튼 이벤트
    @objc func saveCityButtonPressed() {
        if let city = textField.text {
            addWeatherVM.addWeather(for: city) { (vm) in
                self.delegate?.addWeatherDidSave(vm: vm)
                self.dismiss(animated: true)
            }
        }
    }
}
