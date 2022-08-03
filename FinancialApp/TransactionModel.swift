//
//  TransactionModel.swift
//  FinancialApp
//
//  Created by Josileudo Rodrigues on 29/07/22.
//

import Foundation

struct Transaction: Identifiable, Decodable, Hashable {
    let id: Int
    let date: String
    let institution: String
    let account: String
    let merchant: String
    let amount: Double
    let type: TransactionType.RawValue
    let categoryId: Int
    let category: String
    let isPending: Bool
    let isTransfer: Bool
    let isExpense: Bool
    let isEdited: Bool
    
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
