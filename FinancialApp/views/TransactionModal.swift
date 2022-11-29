//
//  TransactionModal.swift
//  FinancialApp
//
//  Created by Josileudo Rodrigues on 28/09/22.
//

import SwiftUI

struct TransactionModal: View {
    @Binding var isPresented: Bool;
    @State private var value: String = "R$ 0,00";
    
    var body: some View {
        VStack(){

        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .background(Color.headerIncomeColor)
        .onTapGesture {
            isPresented.toggle()
        }
    }
}

struct TransactionModal_Previews: PreviewProvider {
    static var previews: some View {
        TransactionModal(isPresented: .constant(false));
    }
}
