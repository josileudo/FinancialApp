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
    
    @StateObject var register = RegisterTypes();
    @StateObject var categoryId = CategoryId();
    @ObservedObject var dateValue = DateValue();
  
    @State private var menu: String = "";
    @State private var describerField: String = "";
    @State private var toggleSwitch: Bool = false;
    @State private var showModalView: Bool = false;
    @State private var showModalDateView: Bool = false;
    @State private var value: String = "R$ 0,00";
    
    @State private var isShowDate: Bool = false;
    @State private var selectButton: Int = 1;
    
    var setDateButton: [DateButton];
   
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
                    Text("Write your \(register.type == "debit" ?  "expense" : "income")")
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
                                    .foregroundColor(Color.secondary)
                                
                                Text("\(toggleSwitch ? "" : "No") " + debitType(register: register.type))
                                    .font(.system(size: 18))
                            }
                        }
                        .toggleStyle(SwitchToggleStyle(tint: choiceColorToType(typeRegister: register.type)))
                        .frame(minHeight: 40)
                        
                        Divider()
                        
                        //MARK: DatePicker component
                            HStack(){
                                Image(systemName: "calendar.badge.plus")
                                    .font(.system(size: 22))
                                    .padding(.trailing, 6)
                                    .foregroundColor(Color.secondary)
                               
                                HStack {
                                    if(dateValue.show) {
                                        Text(dateValue.dateFormatted())
                                    } else {
                                        ForEach(Array(setDateButton), id: \.id) { button in
                                            Button(action: {
                                                switch button.id {
                                                case 1:
                                                    dateValue.date = Date.now;
                                                    selectButton = 1
                                                case 2:
                                                    dateValue.date = Calendar.current.date(byAdding: .day, value: -1, to: Date())!;
                                                    selectButton = 2
                                                default:
                                                    showModalDateView.toggle()
                                                }
                                            }, label: {
                                                Text("\(button.name)");
                                            })
                                            .buttonStyle(DateButtonStyle(isSelected: selectButton == button.id));
                                        }
                                        
                                    }
                                    
                                }
                                Spacer()
                            }
                            .frame(maxWidth: .infinity, minHeight: 40)
                            .onTapGesture(){ showModalDateView.toggle() }
                        
                        Divider()
                        
                        //MARK: Describer component
                        HStack() {
                            Image(systemName: "pencil")
                                .font(.system(size: 22))
                                .padding(.trailing, 6)
                                .foregroundColor(Color.secondary)
                            
                            TextField("Description", text: $describerField)
                        }
                        .frame(minHeight: 40)
                        
                        Divider()
                        
                        //MARK: Categories
                        
                        HStack(){
                            Image(systemName: "bookmark")
                                .font(.system(size: 22))
                                .padding(.trailing, 6)
                                .foregroundColor(Color.secondary)
                            
                            Button(action: {
                                showModalView.toggle();
                                
                            }, label: {
                                HStack(){
                                    FontIcon.text(.awesome5Solid(code: returnCategoryIcon(id: categoryId.id)),
                                                  fontsize: 20, color: Color.icon
                                    )
                                    
                                    Text(returnCategoryName(id: categoryId.id))
                                        .font(.system(size: 16))
                                        .foregroundColor(Color.black)
                                }
                                .padding([.top, .bottom], 6)
                                .padding([.leading, .trailing], 14)
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
                        Text("Save")
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
            ModalDateView(showModalDateView: $showModalDateView)
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .background (content: {
            Rectangle()
                .fill(choiceColorToType(typeRegister: register.type))
                .ignoresSafeArea()
        })
        .environmentObject(register)
        .environmentObject(categoryId)
        .environmentObject(dateValue)
    }
}

struct PresseableButtonStyle: ButtonStyle {
    
    @EnvironmentObject var register : RegisterTypes;
        
    @MainActor func makeBody(configuration: Configuration) -> some View {
        configuration.label
            .padding(8)
            .background(choiceColorToType(typeRegister: register.type))
            .cornerRadius(30)
            .brightness(configuration.isPressed ? 0.1 : 0)
            .scaleEffect(configuration.isPressed ? 1.02 : 1)
            .shadow(color: Color.black.opacity(0.3), radius: 30, x: 0, y: 2)
    }

}

struct DateButtonStyle : ButtonStyle {
    @EnvironmentObject var register : RegisterTypes
    var isSelected: Bool = false
     
    func makeBody(configuration: Configuration) -> some View {
             
        configuration.label
            .font(.system(size: 14, weight: .semibold))
            .foregroundColor(isSelected ? Color.white : Color.secondary)
            .padding([.trailing, .leading], 9)
            .padding([.top, .bottom], 4)
            .background(isSelected
                            ? choiceColorToType(typeRegister: register.type)
                            : Color.secondary.opacity(0.1)
                       )
            .cornerRadius(20)
            .brightness(configuration.isPressed ? 0.1 : 0)
            .scaleEffect(configuration.isPressed ? 1.02 : 1)
    }
}

struct TransactionModal_Previews: PreviewProvider {
    static var previews: some View {
        TransactionModal(isPresented: .constant(false), setDateButton: DateButton.dateButtons)
    }
}
