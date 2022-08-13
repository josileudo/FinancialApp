//
//  TransactionExpanses.swift
//  FinancialApp
//
//  Created by Josileudo Rodrigues on 12/08/22.
//

import SwiftUI
import SwiftUIFontIcon

struct TransactionExpenses: View {
    var incomeTotal: Double = 2000;
    var expenseTotal: Double = 520;
    
    var body: some View {
        HStack(spacing: 20) {
            // MARK: Income total
            HStack(spacing: 10) {
                // MARK: Income icon
                RoundedRectangle(cornerRadius: 20, style: .continuous)
                    .fill(Color.income)
                    .frame(width: 50, height: 50)
                    .overlay {
                        FontIcon.text(.materialIcon(code: .arrow_upward), fontsize: 30, color: Color.background)
                    }
                
                // MARK: Income view
                VStack(alignment: .leading , spacing: 5) {
                    Text("Incomes")
                        .frame(width: .infinity)
                        .font(.subheadline)
                        .opacity(0.9)
                    
                    Text(incomeTotal, format: .currency(code: "USD"))
                        .bold()
                        .lineLimit(1)
                        .font(.system(size: 24))
                        .foregroundColor(Color.income)
                }
            }
            
            Spacer();
            
            // MARK: Expenses
            HStack(spacing: 10) {
                // MARK: Expenses icon
                RoundedRectangle(cornerRadius: 20, style: .continuous)
                    .fill(Color.expense)
                    .frame(width: 50, height: 50)
                    .overlay {
                        FontIcon.text(.materialIcon(code: .arrow_downward), fontsize: 30, color: Color.background)
                    }
                
                VStack(alignment: .leading, spacing: 5) {
                    
                    // MARK: Expense view
                    Text("Expenses")
                        .frame(width: .infinity)
                        .font(.subheadline)
                        .opacity(0.9)
                    
                    Text(expenseTotal, format: .currency(code: "USD"))
                        .bold()
                        .lineLimit(1)
                        .font(.system(size: 24))
                        .foregroundColor(Color.expense)
                }
            }
        }
        .padding([.top, .bottom], 8)
    }
}

struct TransactionExpanses_Previews: PreviewProvider {
    static var previews: some View {
        TransactionExpenses()
        TransactionExpenses()
            .preferredColorScheme(.dark)
    }
}
