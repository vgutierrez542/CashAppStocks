//
//  Stock.swift
//  CashAppStocks
//
//  Created by Victor Gutierrez on 8/16/23.
//

import Foundation

struct Stock: Codable {
    let ticker: String
    let name: String
    let currency: String
    let current_price_cents: Int
    let quantity: Int?
    let current_price_timestamp: Int
}
