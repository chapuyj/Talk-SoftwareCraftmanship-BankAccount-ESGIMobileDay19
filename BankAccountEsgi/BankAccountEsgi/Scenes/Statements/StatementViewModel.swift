//
//  StatementViewModel.swift
//  BankAccountEsgi
//
//  Created by Jordan on 01/12/2019.
//  Copyright © 2019 beNext. All rights reserved.
//

import Foundation

struct StatementViewModel {
    let date: String
    let amount: String
    let balance: String
}

extension StatementViewModel {
    init(line: StatementLine) {
        self.date = line.date.toDayTime()
        self.amount = "\(line.amount) €"
        self.balance = "\(line.balance) €"
    }
}
