//
//  StatementCell.swift
//  BankAccountEsgi
//
//  Created by Jordan on 30/11/2019.
//  Copyright © 2019 beNext. All rights reserved.
//

import UIKit

class StatementCell: UITableViewCell {
    
    // MARK: - Outlets
    
    @IBOutlet private weak var amountLabel: UILabel!
    @IBOutlet private weak var balanceLabel: UILabel!
    @IBOutlet private weak var dateLabel: UILabel!
    
    // MARK: - Configure
    
    func configure(with viewModel: StatementViewModel) {
        amountLabel.text = viewModel.amount
        balanceLabel.text = viewModel.balance
        dateLabel.text = viewModel.date
    }
}
