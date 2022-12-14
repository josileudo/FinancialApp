//
//  Extensions.swift
//  FinancialApp
//
//  Created by Josileudo Rodrigues on 28/07/22.
//

import Foundation;
import SwiftUI;

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

    
func choiceColorToType(typeRegister: String) -> Color {
    let types = typeRegister;
    
    if (types == TransactionType.debit.rawValue) {
        return Color.expense
    } else {
        return Color.income
    }
}

