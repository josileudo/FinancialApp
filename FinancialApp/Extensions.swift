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
}

extension DateFormatter {
    static let allNumericUSA: DateFormatter = {
        print("Initializing DateFormatter");
        let formatter = DateFormatter();
        formatter.dateFormat = "mm/dd/yyyy";
        
        return formatter;
    }()
}

extension String {
    func parsedDate() -> Date {
        guard let parsedDate = DateFormatter.allNumericUSA.date(from: self) else { return Date() };
        
        return parsedDate;
    }
}
