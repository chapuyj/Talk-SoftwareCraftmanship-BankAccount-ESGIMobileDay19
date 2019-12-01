//
//  BalanceViewController.swift
//  BankAccountEsgi
//
//  Created by Jordan on 29/11/2019.
//  Copyright © 2019 beNext. All rights reserved.
//

import UIKit

class BalanceViewController: UIViewController {
    
    // MARK: - Outlets
    
    @IBOutlet private weak var amountLabel: UILabel!
    @IBOutlet private weak var inputTextField: UITextField!
    @IBOutlet private weak var withdrawButton: UIButton!
    @IBOutlet private weak var depositButton: UIButton!
    
    // MARK: - Vars
    
    private var amount = 0.0
    
    // MARK: - Life cycle

    override func viewDidLoad() {
        super.viewDidLoad()
        
        amountLabel.text = "\(amount) €"
    }
    
    // MARK: - Withdraw
    
    @IBAction func didTapWithdraw(_ sender: Any) {
        if let input = inputTextField.text {
            if let number = Double(input) {
                amount -= number
            }
        }
        amountLabel.text = "\(amount) €"
        inputTextField.text = ""
    }
    
    // MARK: - Deposit
    
    @IBAction func didTapDeposit(_ sender: Any) {
        if let input = inputTextField.text {
            if let number = Double(input) {
                amount += number
            }
        }
        amountLabel.text = "\(amount) €"
        inputTextField.text = ""
    }
    
    // MARK: - Segue
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard let viewController = segue.destination as? StatementsViewController else {
            return
        }
        
        viewController.statements = makeStatementViewModels()
    }
    
    private func makeStatementViewModels() -> [StatementViewModel] {
        return [
            StatementViewModel(date: "le 14/06/19 à 21:34:45", amount: "- 600 €", balance: "- 60 €"),
            StatementViewModel(date: "le 13/06/19 à 07:00:00", amount: "+ 20 €", balance: "540 €"),
            StatementViewModel(date: "le 12/06/19 à 15:54:55", amount: "+ 520 €", balance: "520 €")
        ]
    }
}
