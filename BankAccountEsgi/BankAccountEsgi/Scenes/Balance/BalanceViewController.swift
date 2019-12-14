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
    
    private let account = Account()
    
    // MARK: - Life cycle

    override func viewDidLoad() {
        super.viewDidLoad()
        
        amountLabel.text = "\(account.balance) €"
    }
    // MARK: - Withdraw
    
    @IBAction func didTapWithdraw(_ sender: Any) {
        if let input = inputTextField.text, let number = Double(input) {
            account.withdraw(number, date: Date())
        }
        amountLabel.text = "\(account.balance) €"
        inputTextField.text = ""
    }
    
    // MARK: - Deposit
    
    @IBAction func didTapDeposit(_ sender: Any) {
        if let input = inputTextField.text, let number = Double(input) {
            account.deposit(number, date: Date())
        }
        amountLabel.text = "\(account.balance) €"
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
        return account.statement().map {
            StatementViewModel(line: $0)
        }
    }
}
