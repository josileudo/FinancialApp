//
//  BottomNavbarItem.swift
//  FinancialApp
//
//  Created by Josileudo Rodrigues on 22/08/22.
//

import SwiftUI;
import SwiftUIFontIcon;

struct BottomNavbarItem: View {
    @Binding var selectIndex: Int;
    @Binding var shouldShowModal: Bool;
    
    @Namespace var animation;
    
    var icons : [String] = ["house", "list.bullet", "plus", "square.and.pencil", "ellipsis"]
    var body: some View {
        HStack {
            ForEach(0..<5, id: \.self) { number in
                Spacer()
                Button(action: {
                    if (number == 2) {
                        shouldShowModal.toggle();
                        return
                    }
                    
                    withAnimation(.spring()) {
                        selectIndex = number;
                    }
                    
                }, label: {
                    VStack(spacing: 6) {
                        if(number == 2) {
                            Image(systemName: icons[number])
                                .font(.system(size: 25, weight: .bold, design: .default))
                                .foregroundColor(Color.white)
                                .frame(width: 60, height: 60)
                                .background(Color.icon)
                                .cornerRadius(50)
                                .shadow(color: Color.primary.opacity(0.4), radius: 10, x: 0, y: 2)
                                .offset(y: -25)
                            
                        } else {
                            VStack(alignment: .center) {
                                Image(systemName: icons[number])
                                    .font(.system(size: 25))
                                    .frame(width: 25, height: 25)
                                    .foregroundColor(selectIndex == number
                                                     ? Color.primary
                                                     : Color.primary.opacity(0.4))
                                
                                
                                if(selectIndex == number) {
                                    Circle()
                                        .fill(Color.icon)
                                        .matchedGeometryEffect(id: "TAB", in: animation)
                                        .frame(width: 8, height: 8)
                                }
                            }
                        }
                    }
                    .frame(maxWidth: .infinity, maxHeight: 30)
                })
                .fullScreenCover(isPresented: $shouldShowModal ){
                    TransactionModal(isPresented: $shouldShowModal, setDateButton: DateButton.dateButtons)
                }
            }
        }
        .padding(.top)
    }
}

struct BottomNavbarItem_Previews: PreviewProvider {
    static var selectedIndex: Int = {
        let selectedIndex = selectedPreviewIndex;
        return selectedIndex;
    }()
    
    static var previews: some View {
        Group {
            BottomNavbarItem(selectIndex: .constant(selectedIndex), shouldShowModal: .constant(false))
            BottomNavbarItem(selectIndex: .constant(selectedIndex), shouldShowModal: .constant(false))
                .preferredColorScheme(.dark)
        }
    }
}
