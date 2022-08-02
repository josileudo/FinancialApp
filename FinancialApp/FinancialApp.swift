//
//  FinancialAppApp.swift
//  FinancialApp
//
//  Created by Josileudo Rodrigues on 28/07/22.
//

import SwiftUI

@main
struct FinancialApp: App {
    @StateObject var transactionListVM = TransactionListViewModel();
    
    var body: some Scene {
        WindowGroup {
            ContentView()
                .environmentObject(transactionListVM);
        }
    }
}
