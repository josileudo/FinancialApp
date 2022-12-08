//
//  DropDownMenuView.swift
//  FinancialApp
//
//  Created by Josileudo Rodrigues de Freitas on 01/12/22.
//

import SwiftUI

struct DropDownMenuView: View {
    @State private var expand: Bool = false
    @State private var typeChoice: String = "Despesas"
    
    var body: some View {
        VStack() {
            VStack(alignment: .leading, spacing: 12){
                HStack() {
                    Text(typeChoice)
                        .font(.system(size: 18, weight: .bold))
                    
                    Image(systemName: expand
                          ? "chevron.up"
                          : "chevron.down"
                    )
                    .resizable()
                    .frame(width: 13, height: 6)
                
                }
                .onTapGesture {
                    withAnimation(.spring()) {
                        self.expand.toggle()
                    }
                }
                
                if expand {
                    Button(action: {
                        typeChoice = "Receitas"
                        self.expand.toggle()
                    }, label: {
                        Text("Receitas")
                    })
                    
                    Button(action: {
                        typeChoice = "Despesas"
                        self.expand.toggle()
                    }, label: {
                        Text("Despesas")
                    })
                }
            }
            .padding([.leading, .trailing], 15)
            .padding([.top, .bottom], 10)
            .background(content: {
                CustomCornerModel(corners: [
                    .topLeft,
                    .topRight,
                    .bottomLeft,
                    .bottomRight
                ], radius: 20)
                .fill(Color.black.opacity(0.2))
            })
            .foregroundColor(Color.white)
            .font(.system(size: 18, weight: .bold))
            .zIndex(1)
        }
    }
}

struct DropDownMenuView_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            DropDownMenuView()
            DropDownMenuView()
                .preferredColorScheme(.dark)
        }
       
    }
}
