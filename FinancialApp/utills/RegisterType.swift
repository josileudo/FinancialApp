//
//  RegisterType.swift
//  FinancialApp
//
//  Created by Josileudo Rodrigues on 10/12/22.
//

import SwiftUI

@MainActor class RegisterTypes : ObservableObject {
    @Published var type: String = "";
    
    init() {
        self.type = TransactionType.debit.rawValue
    }
}
