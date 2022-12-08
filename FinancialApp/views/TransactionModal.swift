//
//  TransactionModal.swift
//  FinancialApp
//
//  Created by Josileudo Rodrigues on 28/09/22.
//

import SwiftUI
import SwiftUIFontIcon

struct TransactionModal: View {
    @Binding var isPresented: Bool;
    
    @State private var value: String = "R$ 0,00";
    @State private var menu: String = "";
    @State private var date = Date();
    @State private var toggleSwitch: Bool = false;
    @State private var describerField: String = "";
    @State private var showModalView: Bool = false;
    @State private var typeChoice: String = "Receita"
    
    
    
    var body: some View {
        let columns = [
            GridItem(.flexible(), spacing: nil, alignment: .leading),
            GridItem(.fixed(200), spacing: nil, alignment: .center),
            GridItem(.flexible(), spacing: nil, alignment: .trailing),
        ]
        
        GeometryReader {_ in
            
            VStack() {
                LazyVGrid(columns: columns){
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
                        
                        HStack(){
                            Image(systemName: "bookmark")
                                .font(.system(size: 22))
                                .padding(.trailing, 6)
                            
                            Button(action: {
                                showModalView.toggle();
                                
                            }, label: {
                                HStack(){
                                    FontIcon.text(.awesome5Solid(code: Category.autoAndTransport.icon), fontsize: 24, color: Color.icon)
                                    
                                    Text(Category.autoAndTransport.name)
                                        .foregroundColor(Color.black)
                                        
                                }
                                .padding(12)
                                .overlay(
                                    Capsule(style: .continuous)
                                        .stroke(Color.icon, lineWidth: 1)
                                )
                            })
                        }
                        .frame(minHeight: 40)

                    }
                    .padding(.top, 15)
                   
                    Spacer()
                
                    //MARK: SAVE BUTTON
                    Button(action: {
                      
                    }, label: {
                        Text("Salvar")
                            .frame(maxWidth: .infinity)
                            .foregroundColor(Color.white)
                            .font(.system(size: 18, weight: .bold))
                            
                    })
                    .buttonStyle(PresseableButtonStyle())
                      
                    
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
                
            ModalSheetView(categories: Category.categories, showModalView: $showModalView)
               
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

struct PresseableButtonStyle: ButtonStyle {
    func makeBody(configuration: Configuration) -> some View {
        configuration.label
            .padding(12)
            .background(Color.expense)
            .cornerRadius(30)
            .brightness(configuration.isPressed ? 0.1 : 0)
            .scaleEffect(configuration.isPressed ? 1.02 : 1)
            .shadow(color: Color.black.opacity(0.3), radius: 30, x: 0, y: 2)
    }
}

struct TransactionModal_Previews: PreviewProvider {
    static var previews: some View {
        TransactionModal(isPresented: .constant(false));
    }
}
