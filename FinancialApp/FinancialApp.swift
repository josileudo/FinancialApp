//
//  FinancialAppApp.swift
//  FinancialApp
//
//  Created by Josileudo Rodrigues on 28/07/22.
//

import SwiftUI

@main
struct FinancialApp: App {
    @StateObject private var store = RegisterStore();
    
    var body: some Scene {
        WindowGroup {
            NavigationView {
                ContentView(register: $store.registerStore)
            }
            .onAppear{
                RegisterStore.load { result in
                    switch result {
                    case .failure(let error):
                        fatalError(error.localizedDescription)
                    case .success(let registers):
                        store.registerStore = registers
                    }
                }
            }
        }
    }
}
