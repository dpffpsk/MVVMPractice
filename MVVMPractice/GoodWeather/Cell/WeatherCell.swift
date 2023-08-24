//
//  WeatherCell.swift
//  MVVMPractice
//
//  Created by jiweon.lee on 2023/08/24.
//

import UIKit

class WeatherCell: UITableViewCell {
    
    lazy var cityLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 22)
        label.sizeToFit()
        return label
    }()
    
    lazy var temperatureLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 32, weight: .bold)
        label.sizeToFit()
        return label
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        setupLayout()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupLayout() {
        self.addSubview(cityLabel)
        self.addSubview(temperatureLabel)
        
        cityLabel.snp.makeConstraints {
            $0.top.leading.bottom.equalToSuperview().inset(10)
        }
        
        temperatureLabel.snp.makeConstraints {
            $0.top.trailing.bottom.equalToSuperview().inset(10)
        }
    }
}
