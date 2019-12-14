//
//  Operation.swift
//  BankAccountEsgi
//
//  Created by Jordan on 14/12/2019.
//  Copyright © 2019 beNext. All rights reserved.
//

import Foundation

enum Operation {
    case deposit(amount: Double, date: Date)
    case withdraw(amount: Double, date: Date)
}

extension Operation {
    
    var date: Date {
        switch self {
        case let .deposit(_, date):
            return date
        case let .withdraw(_, date):
            return date
        }
    }
    
    var value: Double {
        switch self {
        case let .deposit(amount, _):
            return amount
        case let .withdraw(amount, _):
            return -amount
        }
    }
    
    func applyToBalance(_ balance: Double) -> Double {
        return balance + value
    }
}
