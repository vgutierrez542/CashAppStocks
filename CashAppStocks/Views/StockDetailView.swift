//
//  StockDetailView.swift
//  CashAppStocks
//
//  Created by Victor Gutierrez on 8/16/23.
//

import SwiftUI

struct StockDetailView: View {
    var stock: Stock?

    func centsToDollars(_ cents: Int) -> String {
        return String(format: "%.2f", Double(cents) / 100.0)
    }

    var body: some View {
        VStack(alignment: .leading, spacing: 10) {
            if let stock = stock {
                Text(stock.name).font(.largeTitle)
                Text(stock.ticker).font(.title2).foregroundColor(.gray)
                Text("Price: \(centsToDollars(stock.current_price_cents)) \(stock.currency)").font(.title3)
                if let quantity = stock.quantity {
                    Text("Quantity: \(quantity)").font(.title3)
                } else {
                    Text("Quantity: N/A").font(.title3)
                }
                Text("Price Timestamp: \(Date(timeIntervalSince1970: TimeInterval(stock.current_price_timestamp)))").font(.title3)
            } else {
                Text("No stock data to display")
            }
        }
        .padding()
    }
}

struct StockDetailView_Previews: PreviewProvider {
    static var previews: some View {
        let stock = Stock(ticker: "AAA", name: "AAA", currency: "USD", current_price_cents: 5000, quantity: 30, current_price_timestamp: 534533)
        StockDetailView(stock: stock)
    }
}
