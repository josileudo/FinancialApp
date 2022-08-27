//
//  BottomNavbarItem.swift
//  FinancialApp
//
//  Created by Josileudo Rodrigues on 22/08/22.
//

import SwiftUI;
import SwiftUIFontIcon;

struct BottomNavbarItem: View {
    @State var selectIndex = 0;
    
    var icons : [String] = ["house", "list.bullet", "plus", "square.and.pencil", "ellipsis"]
    var body: some View {
        
        HStack {
            ForEach(0..<5, id: \.self) { number in
                Spacer()
                    Button(action: {
                        selectIndex = number;
                    }, label: {
                        VStack{
                            if( number == 2) {
                                Image(systemName: icons[number])
                                    .font(.system(size: 25, weight: .bold, design: .default))
                                    .foregroundColor(Color.white)
                                    .frame(width: 60, height: 60)
                                    .background(Color.icon)
                                    .cornerRadius(50)
                                    .shadow(color: Color.primary.opacity(0.4), radius: 10, x: 0, y: 5)
                                    .offset(y: -25)
                                
                            } else {
                                
                                VStack(alignment: .center) {
                                    Image(systemName: icons[number])
                                        .font(.system(size: 25, weight: .regular, design: .default))
                                        .foregroundColor(selectIndex == number
                                                         ? Color.primary
                                                         : Color.primary.opacity(0.4))
                                        
                                    
                                    if(selectIndex == number) {
                                    RoundedRectangle(cornerRadius: 50, style: .continuous)
                                        .frame(width: 5, height: 5)
                                        
                                    }
                                }
                                .frame(maxHeight: 30)
                                
                            }
                        }
                    })
                
                Spacer()
            }
        }
    }
}

struct BottomNavbarItem_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            BottomNavbarItem()
            BottomNavbarItem()
                .preferredColorScheme(.dark)
        }
    }
}
