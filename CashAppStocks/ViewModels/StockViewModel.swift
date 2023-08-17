//
//  StockViewModel.swift
//  CashAppStocks
//
//  Created by Victor Gutierrez on 8/16/23.
//

import Foundation

class StockViewModel: ObservableObject {
    @Published var stocks: [Stock] = []
    @Published var isLoading: Bool = false
    @Published var error: Error?

    func fetchStocks(urlString: String) {
        isLoading = true
        guard let url = URL(string: urlString) else {
            return
        }

        URLSession.shared.dataTask(with: url) { (data, response, error) in
            DispatchQueue.main.async { [self] in
                self.isLoading = false
                if let data = data {
                    do {
                        let portfolio = try JSONDecoder().decode(Portfolio.self, from: data)
                        self.stocks = portfolio.stocks
                    } catch {
                        self.error = error
                        stocks.removeAll()
                    }
                } else if let error = error {
                    self.error = error
                    stocks.removeAll()
                }
            }
        }.resume()
    }
}
