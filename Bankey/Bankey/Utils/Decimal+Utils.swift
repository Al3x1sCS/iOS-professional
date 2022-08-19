//
//  Decimal+Utils.swift
//  Bankey
//
//  Created by user on 19/08/22.
//

import Foundation

extension Decimal {
    var doubleValue: Double {
        return NSDecimalNumber(decimal:self).doubleValue
    }
}
