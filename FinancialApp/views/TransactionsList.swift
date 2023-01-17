//
//  SwiftUIView.swift
//  FinancialApp
//
//  Created by Josileudo Rodrigues on 05/08/22.
//

import SwiftUI

struct TransactionList: View {
    @Binding var register: [Register];
    
    var body: some View {
        VStack {
            List {
                // MARK: Transaction Groups
                ForEach($register) { $register in
                    Section {
                        // MARK: Transaction List
                        //ForEach(transactions) { transaction in
                        TransactionRow(transaction: register)
                       // }
                    } header: {
                        // MARK: Transaction Month
                        //Text(month);
                    }
                    .listSectionSeparator(.hidden)
                }
            }
            .listStyle(.plain)
        }
        .navigationTitle("Transactions")
        .navigationBarTitleDisplayMode(.inline)
    }
}

struct SwiftUIView_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            NavigationView {
                TransactionList(register: .constant(Register.sampleData))
            }
            NavigationView {
                TransactionList(register: .constant(Register.sampleData))
                    .preferredColorScheme(.dark)
            }
        }
    }
}
