//
//  ModalSheetView.swift
//  FinancialApp
//
//  Created by Josileudo Rodrigues on 05/12/22.
//

import SwiftUI
import SwiftUIFontIcon

struct ModalSheetView: View {
    
    var categories: [Category]
    
    @Binding var showModalView: Bool;
    
    @State private var curHeight: CGFloat = 400
    @State private var gestureSize: CGSize = CGSize.zero;
    
    let minHeight: CGFloat = 400;
    let maxHeight: CGFloat = 700;
    
    var body: some View {
        if showModalView {
            //TODO: Fix animation
            withAnimation(.easeInOut(duration: 10)) {
                ZStack(alignment: .bottom)  {
                    Color.black
                        .opacity(0.3)
                        .ignoresSafeArea()
                        .onTapGesture {
                            showModalView.toggle()
                        }
        
                    mainView
                        .transition(.move(edge: .bottom))
                }
                .frame(maxWidth: .infinity, maxHeight: .infinity,  alignment: .bottom)
                .ignoresSafeArea()
           }
        }
    }
    
    var mainView: some View {
        VStack {
            ZStack() {
                Capsule()
                    .frame(width: 40, height: 6)
            }
            .frame(height: 40)
            .frame(maxWidth: .infinity)
            .background(Color.white.opacity(0.0001))
            .gesture(modalGesture)
                        
            ZStack(){
                HStack {
                    List(){
                        ForEach(Array(categories), id: \.id) { category in
                            //MARK: Add categories here
                            CategoriesView(category: category)
                        }
                    }
                    .listStyle(.plain)
                }
            }
            .frame(maxHeight: .infinity)
        }
        .frame(height: curHeight)
        .frame(maxWidth: .infinity)
        .background(content: {
           CustomCornerModel(corners: [.topLeft, .topRight], radius: 30).fill(Color.white)
        })
    }
  
    var modalGesture: some Gesture {
        DragGesture(minimumDistance: 0, coordinateSpace: .global)
            .onChanged { val in
                let dragAmount = val.translation.height - gestureSize.height
                
                if(curHeight > maxHeight) {
                    withAnimation(.easeInOut(duration: 1)) {
                        curHeight = maxHeight//dragAmount / 6
                    }
                } else if (curHeight < minHeight) {
                    withAnimation(.easeInOut(duration: 1)) {
                        curHeight = minHeight//dragAmount / 6
                    }
                } else {
                    curHeight -= dragAmount
                }
                
                gestureSize = val.translation
            }
            .onEnded { val in
                gestureSize = .zero
        }
    }
}

struct ModalSheetView_Previews: PreviewProvider {
    static var previews: some View {
        ModalSheetView(categories: Category.categories, showModalView: .constant(true))
    }
}
