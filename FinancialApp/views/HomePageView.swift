//
//  HomePageView.swift
//  FinancialApp
//
//  Created by Josileudo Rodrigues on 30/09/22.
//

import SwiftUI;
import SwiftUICharts;

struct HomePageView: View {
    @EnvironmentObject var transactionListVM: TransactionListViewModel;
    
    var body: some View {
        VStack(){
            ScrollView {
                VStack(alignment: .leading, spacing: 24) {
                    // MARK: Title
                    Text("Overview")
                        .font(.title2)
                        .bold()
                    
                    TransactionBalance();
                    
                    // MARK: Chart
                    let data = transactionListVM.accomulateTransactions()
                    if (!data.isEmpty) {
                        let totalExpenses = data.last?.1 ?? 0;
                        
                        CardView {
                            VStack (alignment: .leading) {
                                ChartLabel((totalExpenses.formatted(.currency(code: "USD"))), type: .title)
                                LineChart()
                            }
                            .background(Color.systemBackground)
                        }
                        .data(data)
                        .chartStyle(ChartStyle(
                            backgroundColor: Color.systemBackground,
                            foregroundColor: ColorGradient(
                                Color.icon.opacity(0.4),
                                Color.icon)
                        )
                        )
                        .frame( height: 300 )
                    }
                    
                    // MARK: Transaction List
                    RecentTransactionList();
                }
                .padding()
                .frame(maxWidth: .infinity)
            }
            .background(Color.background)
            .navigationBarTitleDisplayMode(.inline)
            .toolbar{
                
                // MARK: Notification Item
                ToolbarItem {
                    Image(systemName: "bell.badge")
                        .symbolRenderingMode(.palette)
                        .foregroundStyle(Color.icon, .primary)
                }
            }
        }
    }
}

struct HomePageView_Previews: PreviewProvider {
    
    static let transactionListVM: TransactionListViewModel = {
        let transactionListVM = TransactionListViewModel();
        transactionListVM.transactions = transactionListPreviewData;
        return transactionListVM;
    }()
    
    static var previews: some View {
        Group {
            HomePageView()
            HomePageView()
                .preferredColorScheme(.dark)
        }
        .environmentObject(transactionListVM)
    }
}
