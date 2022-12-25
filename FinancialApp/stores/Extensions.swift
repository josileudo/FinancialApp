//
//  Extensions.swift
//  FinancialApp
//
//  Created by Josileudo Rodrigues on 28/07/22.
//

import Foundation;
import SwiftUI;
import SwiftUIFontIcon;

extension Color {
    static let background = Color("Background");
    static let icon = Color("Icon");
    static let text = Color("Text");
    static let systemBackground = Color(uiColor: .systemBackground);
    static let income = Color("Income");
    static let expense = Color("expense");
    static let headerIncomeColor = Color("HeaderIncomeColor");
}

extension DateFormatter {
    static let allNumericUSA: DateFormatter = {
        print("Initializing DateFormatter");
        let formatter = DateFormatter();
        formatter.dateFormat = "MM/dd/yyyy";
        
        return formatter;
    }()
}

extension String {
    func dateParsed() -> Date {
        guard let parsedDate = DateFormatter.allNumericUSA.date(from: self) else { return Date() };
        
        return parsedDate;
    }
}

extension Date: Strideable {
    func formatted() -> String {
        return self.formatted(.dateTime.year().month().day());
    }
}

extension Double {
    func convertTo2Digits() -> Double {
        return (self * 100).rounded() / 100;
    }
}

    
func choiceColorToType(typeRegister: TransactionType.RawValue) -> Color {
    let types = typeRegister;
    
    if (types == TransactionType.debit.rawValue) {
        return Color.expense
    } else {
        return Color.income
    }
}

func debitType(register: TransactionType.RawValue) -> String {
    if register == TransactionType.debit.rawValue {
        return "Paid"
    } else {
        return "Received"
    }
}

func returnCategoryIcon(id: Int) -> FontAwesomeCode {
    if let categoryIcon = Category.all.first(where: { $0.id == id }) {
        return categoryIcon.icon
    } else {
        return Category.all.first!.icon
    }
}

func returnCategoryName(id: Int) -> String {
    if let categoryIcon = Category.all.first(where: { $0.id == id }) {
        return categoryIcon.name
    } else {
        return Category.all.first!.name
    }
}
