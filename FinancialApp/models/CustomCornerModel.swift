//
//  CustomCornerModel.swift
//  FinancialApp
//
//  Created by Josileudo Rodrigues on 29/11/22.
//

import Foundation
import SwiftUI

struct CustomCornerModel: Shape {
    var corners: UIRectCorner
    var radius: CGFloat
    
    func path(in rect: CGRect) -> Path {
        let path = UIBezierPath(
            roundedRect: rect,
            byRoundingCorners: corners,
            cornerRadii: CGSize(
                width: radius, height: radius
            )
        );
        
        return Path(path.cgPath);
    }
}
