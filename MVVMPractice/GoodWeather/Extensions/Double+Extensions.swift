//
//  Double+Extensions.swift
//  MVVMPractice
//
//  Created by jiweon.lee on 2023/09/13.
//

import Foundation

extension Double {
    
    func formatAsDegree() -> String {
        return String(format: "%.0f°",self)
    }
}
