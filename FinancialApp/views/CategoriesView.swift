//
//  CategoriesView.swift
//  FinancialApp
//
//  Created by Josileudo Rodrigues on 06/12/22.
//

import SwiftUI;
import SwiftUIFontIcon;

struct CategoriesView: View {
    @Binding var showModalView: Bool;
    
    @EnvironmentObject var categoryId : CategoryId;
    
    @State private var toggleActive: Bool = false;
    
    var category: Category;

    var body: some View {
        HStack(){
            HStack {
                RoundedRectangle(cornerRadius: 20, style: .continuous)
                    .fill(Color.icon.opacity(0.3))
                    .frame(width: 44, height: 44)
                    .overlay {
                        FontIcon.text(.awesome5Solid(code: category.icon), fontsize: 24, color: Color.icon);
                    }
                
                Text(category.name);
            }
            
            Spacer();
            
            ZStack() {
                
                Circle()
                    .stroke(categoryId.id == category.id ?  Color.icon : Color.black.opacity(0.5), lineWidth: 1)
                    .frame(width: 25 , height: 25);
                
                if(categoryId.id == category.id) {
                    Circle()
                        .frame(width: 20, height: 20)
                        .foregroundColor(Color.icon);
                }
            }
        }
        .onTapGesture {
            self.categoryId.id = category.id;
            showModalView.toggle();
        }
    }
}

struct CategoriesView_Previews: PreviewProvider {
    static var previews: some View {
        CategoriesView(showModalView: .constant(false), category: Category.creditCardPayment)
            .environmentObject(CategoryId());
    }
}
