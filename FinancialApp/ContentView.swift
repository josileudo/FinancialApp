//
//  ContentView.swift
//  FinancialApp
//
//  Created by Josileudo Rodrigues on 28/07/22.
//

import SwiftUI;
import SwiftUICharts;

struct ContentView: View {
    @EnvironmentObject var transactionListVM: TransactionListViewModel;
    
    @State var selectIndex: Int = selectedPreviewIndex;
    @State var shouldShowModal: Bool = false;
    
    init() {
        UITabBar.appearance().isHidden = true
    }
    
    var body: some View {
        VStack(spacing: 0) {
            ZStack(alignment: .bottom) {
                // MARK: Modal view
                TransactionModal(isPresented: $shouldShowModal);
                
                // MARK: Navigator pages
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
                
                Spacer();
                
            }
            
            // MARK: TabBar navigation
            BottomNavbarItem(selectIndex: $selectIndex, shouldShowModal: self.$shouldShowModal);
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    
    static let transactionListVM: TransactionListViewModel = {
        let transactionListVM = TransactionListViewModel();
        transactionListVM.transactions = transactionListPreviewData;
        return transactionListVM;
    }()
    
    static var previews: some View {
        Group {
            ContentView()
            ContentView()
                .preferredColorScheme(.dark)
        }
        .environmentObject(transactionListVM);
    }
}
