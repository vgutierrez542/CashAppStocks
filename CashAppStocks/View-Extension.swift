//
//  View-Extension.swift
//  CashAppStocks
//
//  Created by Victor Gutierrez on 8/16/23.
//

import Foundation
import SwiftUI

extension View {
    func navigate<NewView: View>(to view: NewView, when binding: Binding<Bool>) -> some View {
        NavigationView {
            HStack {
                self
                NavigationLink(destination: view, isActive: binding) {
                    EmptyView()
                }
            }
        }
        .navigationViewStyle(.stack)
    }
}
