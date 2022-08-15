//
//  TransactionBalance.swift
//  FinancialApp
//
//  Created by Josileudo Rodrigues on 10/08/22.
//

import SwiftUI

struct TransactionBalance: View {
    
    @EnvironmentObject var transactionListVM: TransactionListViewModel;
    
    var body: some View {
        
        // MARK: Transaction Balance
        let dataAmount = transactionListVM.totalTransactions()
        VStack {
            VStack(spacing: 4) {
                Text("Count Balance")
                    .opacity(0.7)
                    .lineLimit(1)
                    .font(.system(size: 16))
                        
                Text(dataAmount, format: .currency(code: "USD"))
                    .opacity(0.8)
                    .font(.system(size: 40, weight: .bold))
                    .lineLimit(1)
                    
                TransactionExpenses();
            }
        }
        .padding()
        .background(Color.systemBackground)
        .clipShape(RoundedRectangle(cornerRadius: 20, style: .continuous))
        .shadow(color: Color.primary.opacity(0.2), radius: 10, x: 0, y: 5)
    }
}

struct TransactionBalance_Previews: PreviewProvider {
    static let transactionListVM: TransactionListViewModel = {
        let transactionListVM = TransactionListViewModel();
        transactionListVM.transactions = transactionListPreviewData;
        return transactionListVM;
    }()
    
    static var previews: some View {
        Group {
            TransactionBalance()
            TransactionBalance()
                .preferredColorScheme(.dark);
        }
        .environmentObject(transactionListVM);
    }
}
