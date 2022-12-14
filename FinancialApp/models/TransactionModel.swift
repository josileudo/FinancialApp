//
//  TransactionModel.swift
//  FinancialApp
//
//  Created by Josileudo Rodrigues on 29/07/22.
//

import Foundation
import SwiftUIFontIcon
import SwiftUI

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
    
    var icon: FontAwesomeCode {
        
        if let category = Category.all.first(where: { $0.id == categoryId }) {
            return category.icon;
        }
        return .question;
    }
        
    var dateParsed: Date {
        date.dateParsed();
    }
    
    var signedAmount: Double {
        return type == TransactionType.credit.rawValue ? amount : -amount;
    }
    
    var month: String {
        dateParsed.formatted(.dateTime.year().day().month(.wide));
    }
}

enum TransactionType: String, CaseIterable {
    case debit = "debit";
    case credit = "credit";
    
    static let allValues = [debit, credit]
}

struct Category {
    let id: Int
    let name: String
    let icon: FontAwesomeCode
    var mainCategoryId: Int?
}

extension Category {
    static let autoAndTransport = Category(id: 1, name: "Auto & Transport", icon: .car_alt);
    static let billsAndUtilities = Category(id: 2, name: "Billis & Utilities", icon: .file_invoice_dollar);
    static let entertainement = Category(id: 3, name: "Entertainment", icon: .film);
    static let feesAndChanges = Category(id: 4, name: "Fees & Changes", icon: .hand_holding);
    static let foodAndDining = Category(id: 5, name: "Food & Dining", icon: .hamburger);
    static let home = Category(id: 6, name: "Home", icon: .home);
    static let income = Category(id: 7, name: "Income", icon: .dollar_sign);
    static let shopping = Category(id: 8, name: "Shopping", icon: .shopping_cart);
    static let transfer = Category(id: 9, name: "Transfer", icon: .exchange_alt);
    
    static let publicTransportation = Category(id: 101, name: "Public Transportation", icon: .bus, mainCategoryId: 1);
    static let taxi = Category(id: 102, name: "Taxi", icon: .taxi, mainCategoryId: 1);
    static let mobilePhone = Category(id: 201, name: "Mobile Phone", icon: .mobile_alt, mainCategoryId: 2);
    static let moviesAndDVDs = Category(id: 301, name: "Movies & DVDs", icon: .file, mainCategoryId: 3);
    static let bankFee = Category(id: 401, name: "Bank Fee", icon: .hand_holding_usd, mainCategoryId: 4);
    static let financeChange = Category(id: 402, name: "Finance Change", icon: .shopping_basket, mainCategoryId: 4);
    static let groceries = Category(id: 501, name: "Groceries", icon: .bus, mainCategoryId: 5);
    static let restaurants = Category(id: 502, name: "Restaurants", icon: .utensils, mainCategoryId: 5);
    static let rent = Category(id: 601, name: "Rent", icon: .house_user, mainCategoryId: 6);
    static let homeSupplies = Category(id: 602, name: "Home Supplies", icon: .lightbulb, mainCategoryId: 6);
    static let paycheque = Category(id: 701, name: "Paycheque", icon: .dollar_sign, mainCategoryId: 7);
    static let software = Category(id: 702, name: "Software", icon: .icons, mainCategoryId: 8);
    static let creditCardPayment = Category(id: 801, name: "Credit Card Payment", icon: .exchange_alt, mainCategoryId: 9);
}

extension Category {
    static let categories: [Category] = [
        autoAndTransport,
        billsAndUtilities,
        entertainement,
        feesAndChanges,
        foodAndDining,
        home,
        income,
        shopping,
        transfer
    ];
    
    static let subCategories: [Category] = [
        publicTransportation,
        taxi,
        mobilePhone,
        moviesAndDVDs,
        bankFee,
        financeChange,
        groceries,
        restaurants,
        rent,
        homeSupplies,
        paycheque,
        software,
        creditCardPayment
    ];
    
    
    static let all: [Category] = categories + subCategories;
}

struct DateButton: Hashable, Decodable {
    let id: Int
    var name: String
}

extension DateButton {
    static let today = DateButton(id: 1, name: "Today")
    static let yesterday = DateButton(id: 2, name: "Yesterday")
    static let others = DateButton(id: 3, name: "Others")
}

extension DateButton {
    static let dateButtons: [DateButton] = [
        today, yesterday, others
    ]
    
    static let all: [DateButton] = dateButtons;
}

extension String {
    func captilizingFirstLetter() -> String {
        return prefix(1).uppercased() + self.lowercased().dropFirst()
    }
    
    mutating func captilizeFirstLetter() {
        self = self.captilizingFirstLetter()
    }
}

