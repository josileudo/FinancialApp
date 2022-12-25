//
//  CategoryId.swift
//  FinancialApp
//
//  Created by Josileudo Rodrigues on 24/12/22.
//

import SwiftUI

@MainActor class CategoryId : ObservableObject {
    @Published var id: Int!
    
    init() {
        self.id = Category.all.first!.id
    }
}
