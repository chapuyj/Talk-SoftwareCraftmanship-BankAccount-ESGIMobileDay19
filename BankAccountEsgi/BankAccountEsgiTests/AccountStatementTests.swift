//
//  AccountStatementTests.swift
//  BankAccountEsgiTests
//
//  Created by Jordan on 11/12/2019.
//  Copyright © 2019 beNext. All rights reserved.
//

import XCTest
@testable import BankAccountEsgi

class AccountStatementTests: XCTestCase {
    
    // MARK: - Vars
    
    var account: Account!
    
    // MARK: - SetUp & TearDown
    
    override func setUp() {
        super.setUp()
        account = Account()
    }

    override func tearDown() {
        account = nil
        super.tearDown()
    }
    
    // MARK: - Tests
    
    func test_make_a_deposit() {
        account.deposit(520, date: Date(daytime: "17-12-2019 11:23"))
        XCTAssert(account.balance == 520)
    }
    
    func test_make_a_withdraw() {
        account.deposit(500, date: Date(daytime: "17-12-2019 11:23"))
        account.withdraw(600, date: Date(daytime: "15-12-2019 15:00"))
        XCTAssert(account.balance == -100)
    }

    func test_create_account_statement() {
        //given / arrange
        account.deposit(520, date: Date(daytime: "15-12-2019 15:00"))
        account.deposit(20, date: Date(daytime: "16-12-2019 15:34"))
        account.withdraw(600, date: Date(daytime: "17-12-2019 11:23"))
    
        //when / act
        let lines = account.statement()
        
        //then / assert
        let expected = [
            StatementLine(amount: -600, date: Date(daytime: "17-12-2019 11:23"), balance: -60),
            StatementLine(amount: 20, date: Date(daytime: "16-12-2019 15:34"), balance: 540),
            StatementLine(amount: 520, date: Date(daytime: "15-12-2019 15:00"), balance: 520)
        ]
        
        XCTAssertEqual(lines, expected)
    }
}
