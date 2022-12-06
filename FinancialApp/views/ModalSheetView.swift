//
//  ModalSheetView.swift
//  FinancialApp
//
//  Created by Josileudo Rodrigues on 05/12/22.
//

import SwiftUI

struct ModalSheetView: View {
    @Binding var showModalView: Bool;
   
    @State private var gestureSize: CGSize = CGSize.zero;
    @State private var curHeight: CGFloat = 400
    
    let minHeight: CGFloat = 400;
    let maxHeight: CGFloat = 700;
    
    var body: some View {
        if showModalView {
            withAnimation(.easeInOut) {
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
                VStack {
                    Text("Hi everybody")
                }
                .frame(maxHeight: .infinity)
            }
            .frame(height: curHeight)
            .frame(maxWidth: .infinity)
            .background(
                ZStack(){
                    RoundedRectangle(cornerRadius: 30)
                        Rectangle()
                        .frame(maxHeight: curHeight / 4)
                }
            )
        }
//        .background(content: {
//           CustomCornerModel(corners: [.topLeft, .topRight], radius: 30).fill(Color.white)
//        })
        
    }
    
    var modalGesture: some Gesture {
        DragGesture(minimumDistance: 0, coordinateSpace: .global)
            .onChanged { val in
                let dragAmount = val.translation.height - gestureSize.height
                curHeight -= dragAmount
                
                if curHeight > maxHeight || curHeight < minHeight {
                    curHeight -= dragAmount
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
        ModalSheetView(showModalView: .constant(false))
    }
}
