//
//  OtherDate.swift
//  FinancialApp
//
//  Created by Josileudo Rodrigues on 27/12/22.
//

import Foundation

@MainActor class DateValue: ObservableObject {
    @Published var date: Date;
    @Published var show: Bool;
    
    init() {
        self.date = Date();
        self.show = false;
    }
}
