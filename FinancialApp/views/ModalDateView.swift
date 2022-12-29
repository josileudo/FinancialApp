//
//  ModalDateView.swift
//  FinancialApp
//
//  Created by Josileudo Rodrigues on 27/12/22.
//

import SwiftUI
import SwiftUIFontIcon

struct ModalDateView: View {
  
    @Binding var showModalDateView: Bool;
    @EnvironmentObject var register : RegisterTypes;
    @EnvironmentObject var dateValue : DateValue;
    
    @State private var curHeight: CGFloat = 300;
    @State private var gestureSize: CGSize = CGSize.zero;
      
    let columns = [
        GridItem(.flexible(), spacing: nil, alignment: .leading),
        GridItem(.fixed(200), spacing: nil, alignment: .center),
        GridItem(.flexible(), spacing: nil, alignment: .trailing),
     ]
    
    var body: some View {
                
        if showModalDateView {
                ZStack(alignment: .bottom)  {
                    Color.black
                        .opacity(0.3)
                        .onTapGesture {
                            showModalDateView.toggle()
                        }
                   
                    mainView
                        .transition(.move(edge: .bottom));
                }
                .frame(maxWidth: .infinity, maxHeight: .infinity,  alignment: .bottom)
                .ignoresSafeArea()
        }
    }
    
    var mainView: some View {
        VStack(alignment: .leading, spacing: 0){
            HStack(spacing: 0) {
                LazyVGrid(columns: columns) {
                    Spacer()
                    
                    Text("Select a Date")
                                            
                    Button(action: {
                        showModalDateView.toggle()
                    }, label: {
                        Text("Done")
                    })
                }
                .font(.system(size: 16, weight: .bold))
                .foregroundColor(Color.white)
                .padding([.leading, .trailing], 30)
                
            }
            .frame(height: 50)
            .frame(maxWidth: .infinity)
            .background(content: {
                CustomCornerModel(corners: [.topLeft, .topRight], radius: 22).fill(choiceColorToType(typeRegister: register.type))
            })
            
            VStack(spacing: 0){
                ZStack(alignment: .center) {
                    DatePicker("", selection: $dateValue.date, displayedComponents: [.date])
                        .datePickerStyle(.wheel)
                        .padding([.leading, .trailing], 12)
                        .frame(maxHeight: .infinity)
                        .onChange(of: dateValue.date, perform: {(value) in
                            dateValue.date = value
                            dateValue.show = true
                        })
                }
            }
            .frame(maxHeight: .infinity)
            
        }
        .frame(height: curHeight)
        .frame(maxWidth: .infinity)
        .background(content: {
           CustomCornerModel(corners: [.topLeft, .topRight], radius: 22).fill(Color.white)
        })
    }
}

struct ModalDateView_Previews: PreviewProvider {
    
    static var previews: some View {
       
        ModalDateView(showModalDateView: .constant(true))
            .environmentObject(DateValue())
    }
}
