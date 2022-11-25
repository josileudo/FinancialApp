//
//  TransactionModal.swift
//  FinancialApp
//
//  Created by Josileudo Rodrigues on 28/09/22.
//

import SwiftUI

struct TransactionModal: View {
    @Binding var isPresented: Bool;
    var body: some View {
        VStack(){
            Spacer()
                .fullScreenCover(isPresented: $isPresented, content: {
                    Text("Do you need return your previous screen?")
                    Button(action: {
                       self.isPresented = false
                    }, label: {
                        Text("Cancel")
                    })
                })            
        }
    }
}

struct TransactionModal_Previews: PreviewProvider {
    static var previews: some View {
        TransactionModal(isPresented: .constant(false));
    }
}
