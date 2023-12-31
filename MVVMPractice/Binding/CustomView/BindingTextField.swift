//
//  BindingTextField.swift
//  MVVMPractice
//
//  Created by jiweon.lee on 2023/09/21.
//

import Foundation
import UIKit

class BindingTextField: UITextField {
    
    var textChanged: (String) -> Void = { _ in }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        commonInit()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        commonInit()
    }
    
    private func commonInit() {
        addTarget(self, action: #selector(textFieldDidChanged), for: .editingChanged)
    }
    
    @objc func textFieldDidChanged(_ textField: UITextField) {
        if let text = textField.text {
            textChanged(text)
        }
    }
    
    func bind(callback: @escaping (String) -> Void) {
        textChanged = callback
    }
}
