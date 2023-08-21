//
//  OrderCell.swift
//  MVVMPractice
//
//  Created by jiweon.lee on 2023/08/21.
//

import Foundation
import UIKit

class OrderCell: UITableViewCell {
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        // 디폴트로 지정된 테이블 셀(UITableViewCell) 사용시, value1, value2는 적용 안 됨
        super.init(style: .value1, reuseIdentifier: reuseIdentifier)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
