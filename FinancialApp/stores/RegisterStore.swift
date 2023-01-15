//
//  RegisterStore.swift
//  FinancialApp
//
//  Created by Josileudo Rodrigues de Freitas on 15/01/23.
//

import Foundation
import SwiftUI

class RegisterStore: ObservableObject {
    @Published var store: [Register] = [];
    
    private static func fileUrl() throws -> URL {
        try FileManager.default.url(for: .documentDirectory,
                                    in: .userDomainMask,
                                    appropriateFor: nil,
                                    create: false)
        .appendingPathComponent("register.data")
    }
}
