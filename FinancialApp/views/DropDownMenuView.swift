//
//  DropDownMenuView.swift
//  FinancialApp
//
//  Created by Josileudo Rodrigues de Freitas on 01/12/22.
//

import SwiftUI

@MainActor class RegisterTypes : ObservableObject {
    @Published var type: String = "";
}

struct DropDownMenuView: View {
    @State private var expand: Bool = false
    @State var typeChoice: String = (TransactionType.allValues.first?.rawValue ?? "debit")
    
    @EnvironmentObject var register : RegisterTypes;
        
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
                    ForEach(TransactionType.allValues, id:\.self){ type in
                        Button(action: {
                            typeChoice = type.rawValue
                            self.register.type = typeChoice
                            self.expand.toggle()
                        }, label: {
                            Text("\(type.rawValue)")
                        })
                    }
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
    
    func returnType() {
        return self.register.type = typeChoice
    }
}

struct DropDownMenuView_Previews: PreviewProvider {
    static var typeChoiceCategory: String = {
        let typeChoiceCategory = selectedPreviewCategory;
        return typeChoiceCategory;
    }()
    
    static var previews: some View {
        Group {
            DropDownMenuView()
            DropDownMenuView()
                .preferredColorScheme(.dark)
        }
        .environmentObject(RegisterTypes())
    }
}
