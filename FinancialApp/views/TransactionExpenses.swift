//
//  TransactionExpanses.swift
//  FinancialApp
//
//  Created by Josileudo Rodrigues on 12/08/22.
//

import SwiftUI
import SwiftUIFontIcon

struct TransactionExpenses: View {
    
    @EnvironmentObject var transactionListVM : TransactionListViewModel;
    
    var body: some View {
        HStack(spacing: 20) {
            
            // MARK: Income total
            HStack(spacing: 8) {
                
                // MARK: Income icon
                RoundedRectangle(cornerRadius: 18, style: .continuous)
                    .fill(Color.income)
                    .frame(width: 35, height: 35)
                    .overlay {
                        FontIcon.text(.materialIcon(code: .arrow_upward), fontsize: 22, color: Color.background)
                    }
                
                // MARK: Income view
                VStack(alignment: .leading , spacing: 5) {
                    let dataCredit = transactionListVM.incomeTotal(type: .credit);
                                        
                    Text("Credit")
                        .font(.subheadline)
                        .opacity(0.6)
                        
                    Text(dataCredit)
                        .bold()
                        .lineLimit(1)
                        .font(.system(size: 16))
                        .foregroundColor(Color.income)
                }
            }
            
            Spacer();
            
            // MARK: Expenses
            HStack(spacing: 8) {
                
                // MARK: Expenses icon
                RoundedRectangle(cornerRadius: 20, style: .continuous)
                    .fill(Color.expense)
                    .frame(width: 35, height: 35)
                    .overlay {
                        FontIcon.text(.materialIcon(code: .arrow_downward), fontsize: 22, color: Color.background)
                    }
                
                VStack(alignment: .leading, spacing: 5) {
                    let dataDebit = transactionListVM.incomeTotal(type: .debit);
                    
                    // MARK: Expense view
                    Text("Debit")
                        .font(.subheadline)
                        .opacity(0.6)
                    
                    Text(dataDebit)
                        .bold()
                        .lineLimit(1)
                        .font(.system(size: 16))
                        .foregroundColor(Color.expense)
                }
            }
        }
        .padding(.vertical, 8)
    }
}

struct TransactionExpanses_Previews: PreviewProvider {
    static let transactionListVM: TransactionListViewModel = {
        let transactionListVM = TransactionListViewModel();
        transactionListVM.transactions = transactionListPreviewData;
        return transactionListVM;
    }()
    
    static var previews: some View {
        Group {
            TransactionExpenses()
            TransactionExpenses()
                .preferredColorScheme(.dark)
        }
        .environmentObject(transactionListVM);
    }
}
