//
//  ContentView.swift
//  arbitrage1_ios
//
//  Created by Nizam Mamedzadeh on 19.06.23.
//

import SwiftUI

struct ContentView: View {
    @State private var checkAmount = 0.0
    @State private var usdtPercentage = 0.0
    @State private var sellUsdt = 0.0
    @State private var buyDollars = 0.0
    @State private var fees = 0.0
    
    var pureUsdt: Double {
        let calculationUsdt = checkAmount / 100 * usdtPercentage
        return checkAmount - calculationUsdt * 100
    }
    
    var soldUsdt: Double {
        let calculationSoldUsdt = pureUsdt * sellUsdt
        return calculationSoldUsdt
    }
    
    var boughtDollars: Double {
        let calculationBoughtDollars = (soldUsdt - fees) / buyDollars
        return calculationBoughtDollars
    }
    
    var netProfit: Double {
        let calculateNetProfit = boughtDollars - checkAmount
        return calculateNetProfit
    }
    
    var body: some View {
        NavigationView {
            Form {
                Section {
                    TextField("Amount", value: $checkAmount, format:
                            .currency(code: "USD"))
                            .keyboardType(.decimalPad)
                    TextField("Percentage of usdt", value: $usdtPercentage, format: .percent)
                }
                
                Section {
                    Text(pureUsdt, format: .currency(code: "USD"))
                } header: {
                    Text("We will get usdt")
                }
                
                Section {
                    TextField("Sold on market", value: $sellUsdt, format: .currency(code: "RUB"))
                    Text(soldUsdt, format: .currency(code: "RUB"))
                } header: {
                    Text("SELL USDT TO RUB")
                }
                
                Section {
                    TextField("Buy dollars on market", value: $buyDollars, format: .currency(code: "RUB"))
                    TextField("Please enter your fees", value: $fees, format: .currency(code: "RUB"))
                    Text(boughtDollars, format: .currency(code: "USD"))
                }
                
                Section {
                    Text(netProfit, format: .currency(code: "USD"))
                }
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
