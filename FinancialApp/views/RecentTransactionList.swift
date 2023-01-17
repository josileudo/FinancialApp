//
//  RecentTransactionList.swift
//  FinancialApp
//
//  Created by Josileudo Rodrigues on 03/08/22.
//

import SwiftUI

struct RecentTransactionList: View {
        
    @Binding var register: [Register]
    
    var body: some View {
        VStack {
            HStack {
                // MARK: Header Title
                Text("Recent Transactions")
                    .bold();
                
                Spacer();
                
                // MARK: Header Link
                NavigationLink {
                    TransactionList(register: $register);
                } label: {
                    HStack(spacing: 4) {
                        Text("See All");
                        Image(systemName: "chevron.right");
                    }
                    .foregroundColor(Color.icon);
                }
            }
            .padding(.top);
            
            // MARK: Recent Transactions List
            ForEach(register) { register in
                TransactionRow(transaction: register)
               
                Divider()
                 //   .opacity(index == 4 ? 0 : 1);
            }
        }
        .padding()
        .background(Color.systemBackground)
        .clipShape(RoundedRectangle(cornerRadius: 20, style: .continuous))
        .shadow(color: Color.primary.opacity(0.2), radius: 10, x: 0, y: 5)
      }
    
    }

struct RecentTransactionList_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            RecentTransactionList(register: .constant(Register.sampleData))
            RecentTransactionList(register: .constant(Register.sampleData))
                .preferredColorScheme(.dark);
        }
    }
}
