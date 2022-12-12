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

struct choiceCategoryColor {
    var type: String;
    var color: Color;
    
    mutating func selectType(type: String) {
        switch type {
        case "Despesas":
            color = Color.expense
        case "Receitas":
            color = Color.income
        default:
            break
        }
    }
}

