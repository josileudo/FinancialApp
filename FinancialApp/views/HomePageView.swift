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
    @Binding var register: [Register]
    
    var body: some View {
        VStack(){
            ScrollView {
                VStack(alignment: .leading, spacing: 24) {
                    // MARK: Title
                    Text("Overview")
                        .font(.title2)
                        .bold()
                    
                   // TransactionBalance();
                    
                    // MARK: Chart
                    let data = $register
                    if (!data.isEmpty) {
                       // let totalExpenses = data.last?.1 ?? 0;
                        
                        CardView {
                            VStack (alignment: .leading) {
//                                ChartLabel((totalExpenses.formatted(.currency(code: "USD"))), type: .title)
//                                LineChart()
                            }
                            .background(Color.systemBackground)
                        }
                       // .data(data)
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
                    RecentTransactionList(register: $register);
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
    static var previews: some View {
        Group {
            HomePageView(register: .constant(Register.sampleData))
            HomePageView(register: .constant(Register.sampleData))
                .preferredColorScheme(.dark)
        }
    }
}
