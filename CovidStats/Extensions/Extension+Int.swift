//
//  Extension+Int.swift
//  CovidStats
//
//  Created by Guilherme Duarte on 21/02/24.
//

import Foundation

extension Int {
    var formatNumber: String {
        let formatter = NumberFormatter()
        formatter.groupingSeparator = ","
        formatter.numberStyle = .decimal
        return formatter.string(from: NSNumber(value: self))!
    }
    var roundedWithAbbreviations: String {
        let number = Double(self)
        let milion = number/1_000_000
        if milion >= 1.0 {
            return "\(round(milion*10)/10)M"
        } else {
            return "\(self.formatNumber)"
        }
    }
}
