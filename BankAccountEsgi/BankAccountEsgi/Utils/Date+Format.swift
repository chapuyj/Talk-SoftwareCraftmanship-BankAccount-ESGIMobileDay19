//
//  Date+Format.swift
//  BankAccountEsgi
//
//  Created by Jordan on 14/12/2019.
//  Copyright © 2019 beNext. All rights reserved.
//

import Foundation

extension Date {
    
    init(daytime: String) {
        let formattedDate = DateFormatter.bankFormat.date(from: daytime)
        self = formattedDate ?? Date()
    }
    
    func toDayTime() -> String {
        return DateFormatter.bankFormat.string(from: self)
    }
}

private extension DateFormatter {
    
    static var bankFormat: DateFormatter {
        let formatter = DateFormatter()
        formatter.dateFormat = "dd-MM-yyyy HH:mm"
        return formatter
    }
}
