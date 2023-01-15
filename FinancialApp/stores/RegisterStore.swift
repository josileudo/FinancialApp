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
    
    static func load(completion: @escaping(Result<[Register], Error>) -> Void){
        DispatchQueue.global(qos: .background).async {
            do {
                let fileUrl = try fileUrl();
                guard let file = try? FileHandle(forReadingFrom: fileUrl) else {
                    DispatchQueue.main.async {
                        completion(.success([]));
                        print(completion(.success([])));
                    }
                    return;
                }
                let register = try JSONDecoder().decode([Register].self, from: file.availableData);
                DispatchQueue.main.async {
                    completion(.success(register));
                    print(completion(.success(register)));
                }
            } catch {
                DispatchQueue.main.async {
                    completion(.failure(error));
                    print(completion(.failure(error)));
                }
            }
        }
    }
}
