//
//  StatementsViewController.swift
//  BankAccountEsgi
//
//  Created by Jordan on 30/11/2019.
//  Copyright © 2019 beNext. All rights reserved.
//

import UIKit

class StatementsViewController: UIViewController {
    
    // MARK: - Outlets
    
    @IBOutlet private weak var tableView: UITableView!
    
    // MARK: - Vars
    
    var statements = [StatementViewModel]()
    
    // MARK: - Life cycle

    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.dataSource = self
    }
}

// MARK: - UITableViewDataSource

extension StatementsViewController: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return statements.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "StatementCell", for: indexPath) as? StatementCell else {
            return UITableViewCell()
        }
        
        let statement = statements[indexPath.row]
        cell.configure(with: statement)
        
        return cell
    }
}
