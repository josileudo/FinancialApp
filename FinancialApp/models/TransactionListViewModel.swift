//
//  TransactionListViewModel.swift
//  FinancialApp
//
//  Created by Josileudo Rodrigues on 02/08/22.
//

import Foundation;
import Combine;
import Collections;
import SwiftUI

typealias TransactionGroup = OrderedDictionary<String, [Transaction]>
typealias TransactionPrefixSum = [(String, Double)];
typealias TotalTransactions = Double;

var dateTest: [Double] = [200, 300, 400, 500, -100];

final class TransactionListViewModel: ObservableObject {
    @Published var transactions: [Transaction] = [];
    
    private var cancellables = Set<AnyCancellable>();
    
    init() {
        getTransactions();
    }
    
    func getTransactions() {
        guard let url = URL(string: "https://designcode.io/data/transactions.json") else {
            print("Invalid URL");
            return
        }
        
        URLSession.shared.dataTaskPublisher(for: url)
            .tryMap { (data, response) -> Data in
                guard let httpResponse = response as? HTTPURLResponse, httpResponse.statusCode == 200 else {
                        dump(response)
                        throw URLError(.badServerResponse);
                }
                print(data)
                return data;
            }
            .decode(type: [Transaction].self, decoder: JSONDecoder())
            .receive(on: DispatchQueue.main)
            .sink { completion in
                switch completion {
                case .failure(let error):
                    print("Error fetching trasactions:", error.localizedDescription);
                case .finished:
                    print("Finished fetching transactions");
                }
            } receiveValue: { [weak self] result in
                self?.transactions = result
                dump(self?.transactions);
            }
            .store(in: &cancellables);
    }
    
    func groupTransactionByMonth() -> TransactionGroup {
        guard !transactions.isEmpty else { return [:] };
        
        let groupedTransactions = TransactionGroup(grouping: transactions) { $0.month }
       
        return groupedTransactions;
    }
    
    func accomulateTransactions() -> TransactionPrefixSum {
        print("AccumulateTransactions")
        guard !transactions.isEmpty else { return [] }
        
        // TODO: Fix to Current date
        let today = "02/22/2022".dateParsed() //Date()
        
        let dateInterval = Calendar.current.dateInterval(of: .month, for: today)!
        print("dateInterval", dateInterval);
        
        var sum: Double = .zero
        var cumulativeSum = TransactionPrefixSum()
        
        for date in stride(from: dateInterval.start, to: today, by: 60 * 60 * 24) {
            let dailyExpenses = transactions.filter{$0.dateParsed == date && $0.isExpense}
            let dailyTotal = dailyExpenses.reduce(0) {$0 - $1.signedAmount}
                      
            sum += dailyTotal;
            sum = sum.convertTo2Digits()
            cumulativeSum.append((date.formatted(), sum))
            print(date.formatted(), "dailyTotal: ", dailyTotal, "sum: ", sum)
        }
        
        return cumulativeSum;
    }
    
    // TODO: Create filter with (month and year)
    
    func totalTransactions() -> TotalTransactions {
        guard !transactions.isEmpty else { return 0}
        
        var sum: Double = .zero;
        sum = transactions.reduce(0){$0 + $1.signedAmount};
        
        return sum;
    }
    
    func incomeTotal(type: TransactionType) -> Double {
        guard !transactions.isEmpty else { return 0}
        var valueEx: Double = .zero;
        
        let typeExpense = transactions.filter{$0.amount > 0 && $0.type == type.rawValue}
        let res = typeExpense.reduce(0){$0 + $1.amount}
            
        valueEx = res;
        print(valueEx);
        
        return valueEx
    }
}
