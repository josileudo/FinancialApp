//
//  PreviewData.swift
//  FinancialApp
//
//  Created by Josileudo Rodrigues on 29/07/22.
//

import Foundation;
import SwiftUI;

var transactionPreviewData = Transaction(
    id: 25,
    date: "02/16/2022",
    institution: "Desjardins",
    account: "Visa Desjardins",
    merchant: "STM",
    amount: 6.50,
    type: "debit",
    categoryId: 101,
    category: "Public Transportation",
    isPending: true,
    isTransfer: false,
    isExpense: true,
    isEdited: false
);

var categoryPreviewData = Category(
     id: 25,
     name: "Entertainment",
     icon: .film
);

var transactionListPreviewData = [Transaction](repeating: transactionPreviewData, count: 10);

var selectedPreviewIndex: Int = 0;

var selectedPreviewCategory: String = "Despesas";
