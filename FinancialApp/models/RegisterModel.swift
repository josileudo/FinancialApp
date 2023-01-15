//
//  Register.swift
//  FinancialApp
//
//  Created by Josileudo Rodrigues de Freitas on 14/01/23.
//

import Foundation

struct Register: Identifiable, Codable {
    let id: UUID
    var type: String
    var value: Double
    var isCheck: Bool
    var date: String
    var description: String
    var category: String
    
    init(id: UUID = UUID(), type: String, value: Double, isCheck: Bool, date: String, description: String, category: String) {
        self.id = id
        self.type = type
        self.value = value
        self.isCheck = isCheck
        self.date = date
        self.description = description
        self.category = category
    }
}

extension Register {
    struct Data {
        var type: String = ""
        var value: Double = 0.00
        var isCheck: Bool = false
        var date: String = ""
        var description: String = ""
        var category: String = ""
    }
    
    var data: Data {
        Data(type: type, value: value, isCheck: isCheck, date: date, description: description, category: category)
    }
    
    mutating func update(from data: Data) {
        type = data.type
        value = data.value
        isCheck = data.isCheck
        date = data.date
        description = data.description
        category = data.category
    }
    
    init(data: Data) {
        id = UUID();
        type = data.type
        value = data.value
        isCheck = data.isCheck
        date = data.date
        description = data.description
        category = data.category
    }
}

extension Register {
    static let sampleData: [Register] = [
        Register(type: "Debit", value: 60.00, isCheck: true, date: "2023-01-13 20:28:39 +0000", description: "Xbox pay", category: "Eletronics"),
        Register(type: "Credit", value: 10.00, isCheck: true, date: "2023-01-10 20:28:39 +0000", description: "Jov", category: "home"),
        Register(type: "Credit", value: 20.00, isCheck: true, date: "2023-01-11 20:28:39 +0000", description: "Job", category: "home")
    ]
}
