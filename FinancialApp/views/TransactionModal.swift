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
           // Spacer()
            //MARK: Show Page modal
//                .fullScreenCover(isPresented: $isPresented){
//                    Button(action: {
//                        self.isPresented = false
//                    }, label: {
//                        Text("Cancel");
//                    })
            VStack(){
                //MARK: HEADER WITH VALUE
                ZStack(){
                    VStack(alignment: .leading, spacing: 0){
                        Text("Valor da receita")
                            .foregroundColor(Color.white)
                            .fontWeight(.semibold)
                            .font(.system(size: 15))
                        
                        TextField("R$ 0.00", text: $value)
                            .textContentType(.flightNumber)
                            .textFieldStyle(.plain)
                            .font(.system(size: 35, weight: .bold))
                            .foregroundColor(.white.opacity(0.9))
                    }
                    .padding(.top, 30)
                    .padding(.bottom, 70)
                }
                .frame(maxWidth: .infinity)
                .padding()
                .background(Color.headerIncomeColor)
                
                VStack(){
                    Text("hi")
                }
                Spacer()
            }
               
            
           
            
//                }
         
//                .fullScreenCover(isPresented: $isPresented, content: {
//                    Text("Do you need return your adsasdscreen?")
//                    Button(action: {
//                       self.isPresented = false
//                    }, label: {
//                        Text("Cancel")
//                    })
//                })
        }
    }
}

struct TransactionModal_Previews: PreviewProvider {
    static var previews: some View {
        TransactionModal(isPresented: .constant(false));
    }
}
