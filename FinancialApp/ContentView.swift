//
//  ContentView.swift
//  FinancialApp
//
//  Created by Josileudo Rodrigues on 28/07/22.
//

import SwiftUI;
import SwiftUICharts;

struct ContentView: View {
    @State var selectIndex: Int = selectedPreviewIndex;
    @State var shouldShowModal: Bool = false;
    @Binding var register: [Register];
        
//    init() {
//        UITabBar.appearance().isHidden = true
//    }
    
    var body: some View {
        VStack(spacing: 0) {
            ZStack(alignment: .bottom) {
                               
                //MARK: Route pages
                RoutePages(selectIndex: $selectIndex, register: $register);
                Spacer();
            }
            
            // MARK: TabBar navigation
            BottomNavbarItem(selectIndex: $selectIndex,
                             shouldShowModal: self.$shouldShowModal,
                             register: $register
            );
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
            ContentView(register: .constant(Register.sampleData))
            ContentView(register: .constant(Register.sampleData))
                .preferredColorScheme(.dark)
        }
    }
}
