//
//  Account.swift
//  BankAccountEsgi
//
//  Created by Jordan on 11/12/2019.
//  Copyright © 2019 beNext. All rights reserved.
//

import Foundation

class Account {
    
    // MARK: - Vars
    
    private var operations = [Operation]()
    
    // MARK: - Status
    
    var balance: Double {
        return operations.reduce(0) { balance, operation -> Double in
            return operation.applyToBalance(balance)
        }
    }
    
    func statement() -> [StatementLine] {
        return operations.reduce(into: [StatementLine]()) { lines, operation in
            let lastBalance = lines.last?.balance ?? 0
            let newBalance = lastBalance + operation.value
            let newLine = StatementLine(amount: operation.value, date: operation.date, balance: newBalance)
            lines.append(newLine)
        }
        .reversed()
    }
    
    // MARK: - Actions

    func withdraw(_ amount: Double, date: Date) {
        operations.append(.withdraw(amount: amount, date: date))
    }

    func deposit(_ amount: Double, date: Date) {
        operations.append(.deposit(amount: amount, date: date))
    }
}
