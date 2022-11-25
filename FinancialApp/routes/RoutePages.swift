//
//  RoutePages.swift
//  FinancialApp
//
//  Created by Josileudo Rodrigues on 30/09/22.
//

import SwiftUI

struct RoutePages: View {
    @Binding var selectIndex: Int;
    
    var body: some View {
        switch selectIndex {
        case 0:
            NavigationView {
              HomePageView();
            }
            .navigationViewStyle(.stack)
            .accentColor(.primary)
            
        case 1:
            NavigationView {
                Text("Screen 2")
            }
                             
        case 3:
            NavigationView {
                Text("Screen 4")
            }
            
        default:
            ScrollView {
                Text("Remember of create other screen");
            }
        }
    }
}

struct RoutePages_Previews: PreviewProvider {
    static let transactionListVM: TransactionListViewModel = {
        let transactionListVM = TransactionListViewModel();
        transactionListVM.transactions = transactionListPreviewData;
        return transactionListVM;
    }()
    
    static var previews: some View {
        Group() {
            RoutePages(selectIndex: .constant(0))
            RoutePages(selectIndex: .constant(0))
                .preferredColorScheme(.dark)
        }
        .environmentObject(transactionListVM)
    }
}
