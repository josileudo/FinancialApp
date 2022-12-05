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
    @State private var menu: String = "";
    @State private var date = Date();
    @State private var toggleSwitch: Bool = false;
    @State private var describerField: String = "";
    
    var body: some View {
        let columns = Array(
            repeating: GridItem(.flexible(), spacing: 0), count: 3
        )
        
        GeometryReader {_ in
            
            VStack() {
                LazyVGrid(columns: columns, alignment: .leading){
                    VStack(alignment: .leading) {
                    
                        Button(action: {
                            isPresented.toggle()
                        }, label: {
                            Text("Cancel")
                                .font(.system(size: 20))
                        })
                    }
                    
                    //MARK: Drop-down list 
                    DropDownMenuView()
                }
                .frame(maxWidth: .infinity)
                .foregroundColor(Color.white)
                .padding([.leading, .trailing])
                
                // MARK: Receiver value
                VStack(alignment: .leading ) {
                    Text("Digite sua Receita")
                        .font(.system(size: 14, weight: .semibold))
                    
                    TextField("R$ 0,00", text: $value)
                        .font(.system(size: 40))
                }
                .frame(maxWidth: .infinity)
                .foregroundColor(Color.white)
                .padding()
                
                //MARK: Screen contains form informations
                VStack() {
                    
                    VStack(alignment: .leading, spacing: 12){
                        
                        
                        // MARK: Toggle button
                        Toggle(isOn: $toggleSwitch) {
                            HStack(){
                                Image(systemName: "checkmark.circle")
                                    .font(.system(size: 22))
                                    .padding(.trailing, 6)
                                
                                Text("Recebido")
                                    .font(.system(size: 18))
                            }
                        }
                        .toggleStyle(SwitchToggleStyle(tint: Color.expense))
                        .frame(minHeight: 40)
                        
                        Divider()
                        
                        //MARK: DatePicker component
                        DatePicker( selection: $date, in: Date()..., displayedComponents: [.date]) {
                            HStack(){
                                Image(systemName: "calendar.badge.plus")
                                    .font(.system(size: 22))
                                    .padding(.trailing, 6)
                                
                                Text("Data")
                                    .font(.system(size: 18))
                            }
                        }
                        .frame(minHeight: 40)
                        Divider()
                        
                        //MARK: Describer component
                        HStack() {
                            Image(systemName: "pencil")
                                .font(.system(size: 22))
                                .padding(.trailing, 6)
                            
                            TextField("Descrição", text: $describerField)
                        }
                        .frame(minHeight: 40)
                        
                        Divider()
                        
                        //MARK: Categories
                        
                        
                    }
                    .padding(.top, 15)
                   
                    Spacer()
                
                    //MARK: SAVE BUTTON
                    Button(action: {
                        
                    }, label: {
                        Text("Salvar")
                    })
                    .padding()
                    .background(Color.expense)
                    .foregroundColor(Color.white)
                    .font(.system(size: 18, weight: .bold))
                    .cornerRadius(10)
                   // .scaleEffect(configuration.isPressed ? 1.2 : 1)
                                        
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
        .zIndex(0)
        
    }
}

struct TransactionModal_Previews: PreviewProvider {
    static var previews: some View {
        TransactionModal(isPresented: .constant(false));
    }
}
