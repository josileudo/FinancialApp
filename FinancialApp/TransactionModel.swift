//
//  TransactionModel.swift
//  FinancialApp
//
//  Created by Josileudo Rodrigues on 29/07/22.
//

import Foundation

struct Transaction: Identifiable {
    let id: Int;
    let date: String;
    let instituition: String;
    let account: String;
    let merchant: String;
    let amount: Double;
    let type: TransactionType.RawValue;
    var categoryId: Int;
    var category: String;
    let isPending: Bool;
    var isTransfer: Bool;
    var isExpense: Bool;
    var isEdited: Bool;
    
    var dateParsed: Date {
        date.parsedDate();
    }
    
    var signedAmount: Double {
        return type == TransactionType.credit.rawValue ? amount : -amount;
    }
}

enum TransactionType: String {
    case debit = "debit"
    case credit = "credit"
}
