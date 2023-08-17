//
//  StockListView.swift
//  CashAppStocks
//
//  Created by Victor Gutierrez on 8/16/23.
//

import SwiftUI

struct StockListView: View {
    @ObservedObject var viewModel = StockViewModel()
    @State var showStockView = false
    @State var pickedStock: Stock?
    private let correctJson = "https://storage.googleapis.com/cash-homework/cash-stocks-api/portfolio.json"
    private let malformedJson = "https://storage.googleapis.com/cash-homework/cash-stocks-api/portfolio_malformed.json"
    private let emptyJson = "https://storage.googleapis.com/cash-homework/cash-stocks-api/portfolio_empty.json"
    
    var body: some View {
        VStack {
            if viewModel.stocks.isEmpty {
                Text("Your portfolio is empty")
                    .padding(.top, 50)
            } else {
                List(viewModel.stocks, id: \.ticker) { stock in
                    Button(action: {
                        if !viewModel.isLoading {
                            showStockView.toggle()
                            pickedStock = stock
                        }
                    }, label: {
                        VStack(alignment: .leading) {
                            Text(stock.name).font(.headline)
                            Text(stock.ticker).font(.subheadline)
                            Text(String(format: "%.2f \(stock.currency)", centsToDollars(stock.current_price_cents))).font(.subheadline)
                        }
                    })
                    .foregroundColor(.black)
                }
            }
            Spacer()
            HStack {
                Button("Correct", action: {
                    viewModel.fetchStocks(urlString: correctJson)
                })
                .padding()
                Button("Malformed", action: {
                    viewModel.fetchStocks(urlString: malformedJson)
                })
                .padding()
                Button("Empty", action: {
                    viewModel.fetchStocks(urlString: emptyJson)
                })
                .padding()
            }
        }
        .onAppear {
            viewModel.fetchStocks(urlString: correctJson)
        }
        .navigate(to: StockDetailView(stock: pickedStock), when: $showStockView)
        .alert(isPresented: Binding<Bool>(
            get: { self.viewModel.error != nil },
            set: { _ in self.viewModel.error = nil }
        )) {
            Alert(title: Text("Error"),
                  message: Text(viewModel.error?.localizedDescription ?? "Unknown error"),
                  dismissButton: .default(Text("OK")))
        }
        .overlay(content: {
            if viewModel.isLoading {
                Text("Loading...")
            }
        })
    }
    
    // MARK: Helper functions
    func centsToDollars(_ cents: Int) -> Double {
        return Double(cents) / 100.0
    }
}

struct StockListView_Previews: PreviewProvider {
    static var previews: some View {
        StockListView()
    }
}
