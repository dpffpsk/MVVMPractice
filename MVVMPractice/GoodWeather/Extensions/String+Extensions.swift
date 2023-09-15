//
//  String+Extensions.swift
//  MVVMPractice
//
//  Created by jiweon.lee on 2023/09/12.
//

import Foundation

extension String {
    
    func escaped() -> String {
        
        return self.addingPercentEncoding(withAllowedCharacters: .urlHostAllowed) ?? self
    }
}
