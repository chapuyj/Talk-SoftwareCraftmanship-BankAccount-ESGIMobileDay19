//
//  StatementLine.swift
//  BankAccountEsgi
//
//  Created by Jordan on 11/12/2019.
//  Copyright © 2019 beNext. All rights reserved.
//

import Foundation

struct StatementLine {
    let amount: Double
    let date: Date
    let balance: Double
}

extension StatementLine: Equatable {}
