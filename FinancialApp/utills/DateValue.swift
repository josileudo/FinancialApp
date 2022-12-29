//
//  OtherDate.swift
//  FinancialApp
//
//  Created by Josileudo Rodrigues on 27/12/22.
//

import Foundation

@MainActor class DateValue: ObservableObject {
    @Published var date: Date = Date();
    @Published var show: Bool;
    
    init() {
        let calendar = Calendar.current;
        let components = calendar.dateComponents([.month, .day, .year], from: Date());
        
        date = calendar.date(from: components)!
        
        self.show = false;
    }
    
    func dateFormatted() -> String {
        return date.formatted(date: .abbreviated, time: .omitted)
    }
}
