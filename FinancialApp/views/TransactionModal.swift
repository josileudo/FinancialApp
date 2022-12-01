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
    @State private var menu: String = ""
    
    var body: some View {
        GeometryReader {_ in
            
            VStack() {
                HStack() {
                    VStack(alignment: .leading) {
                        
                        Button(action: {
                            isPresented.toggle()
                        }, label: {
                            
                            Text("Cancel")
                                .font(.system(size: 20))
                            
                        })
                        
                    }
                    Spacer()
                    DropDownMenuView()
                        .frame(maxWidth: .infinity)
                    Spacer()
                }
                .frame(maxWidth: .infinity)
                .foregroundColor(Color.white)
                .padding([.leading, .trailing])
                
                
                VStack(alignment: .leading ) {
                    Text("Digite sua Receita")
                        .font(.system(size: 14, weight: .semibold))
                    
                    TextField("R$ 0,00", text: $value)
                        .font(.system(size: 40))
                }
                .frame(maxWidth: .infinity)
                .foregroundColor(Color.white)
                .padding()
                
                VStack() {
                    Text("Screen 2")
                }
                .padding(15)
                .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .top)
                .background(content: {
                    CustomCornerModel(corners: [.topLeft, .topRight], radius: 25)
                        .fill(.white)
                        .ignoresSafeArea()
                })
            }
            .frame(maxWidth: .infinity, maxHeight: .infinity)
            //.padding([.leading, .trailing])
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .background (content: {
            Rectangle()
                .fill(menu == "receita" ? Color.headerIncomeColor : Color.expense)
                .ignoresSafeArea()
        })
        
    }
}

struct TransactionModal_Previews: PreviewProvider {
    static var previews: some View {
        TransactionModal(isPresented: .constant(false));
    }
}
