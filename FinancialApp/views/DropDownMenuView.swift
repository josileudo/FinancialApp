//
//  DropDownMenuView.swift
//  FinancialApp
//
//  Created by Josileudo Rodrigues de Freitas on 01/12/22.
//

import SwiftUI

struct DropDownMenuView: View {
    @State private var expand: Bool = false
    
    var body: some View {
        VStack() {
            HStack() {
                Text("Receita")
                
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
