//
//  CategoriesView.swift
//  FinancialApp
//
//  Created by Josileudo Rodrigues on 06/12/22.
//

import SwiftUI
import SwiftUIFontIcon

struct CategoriesView: View {
    var category: Category;
    
    @State private var toggleActive: Bool = false;
    @State private var checkActive: Bool = false;
    
    @Binding var showModalView: Bool
    
    @EnvironmentObject var categoryId : CategoryId;
    
    var body: some View {
        //TODO: Fix button click between category name
        HStack(){
            HStack {
                RoundedRectangle(cornerRadius: 20, style: .continuous)
                    .fill(Color.icon.opacity(0.3))
                    .frame(width: 44, height: 44)
                    .overlay {
                        FontIcon.text(.awesome5Solid(code: category.icon), fontsize: 24, color: Color.icon)
                    }
                
                Text(category.name)
            }
            
            Spacer()
            
            ZStack(){
                Circle()
                    .stroke(checkActive ?  Color.icon : Color.black.opacity(0.5), lineWidth: 1)
                    .frame(width: 25 , height: 25)
                
                if(category.name.isEmpty){
                    Circle()
                        .frame(width: 20, height: 20)
                        .foregroundColor(Color.icon)
                }
            }
        }
        .onTapGesture {
            withAnimation(.easeIn) {
                self.categoryId.id = category.id
                showModalView.toggle()
                checkActive.toggle()
            }
        }
    }
}

struct CategoriesView_Previews: PreviewProvider {
    static var previews: some View {
        CategoriesView(category: Category.creditCardPayment, showModalView: .constant(false))
            .environmentObject(CategoryId())
    }
        
}
