//
//  Double+.swift
//  UberSwiftUI
//
//  Created by 이기완 on 2023/02/07.
//

import SwiftUI

extension Double {
    private var currencyFormatter: NumberFormatter {
        let formatter = NumberFormatter()
        formatter.numberStyle = .currency
        formatter.minimumFractionDigits = 0
        formatter.maximumFractionDigits = 0
        
        return formatter
        
    }
    
    
    func toCurrency() -> String {
        return currencyFormatter.string(for: self) ?? ""
    }
}
