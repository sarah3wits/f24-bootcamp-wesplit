//
//  ContentView.swift
//  wesplit-takehome
//
//  Created by Sarah Threewits on 10/2/24.
//

import SwiftUI

struct ContentView: View {
    
    @State var amount = 0.0
    @State var numPeople = 0.0
    @State var tip = ""
    @State var total = 0.0

    let tipOption = ["10%", "15%", "20%", "25%", "0%"]
    
    let ten = 0.1
    let fifteen = 0.15
    let twenty = 0.2
    let twentyfive = 0.25
    let zero = 0.0
    
    var totalAmount: Double {
        switch tip {
        case "10%":
            return amount + (amount * ten)
        case "15%":
            return amount + (amount * fifteen)
        case "20%":
            return amount + (amount * twenty)
        case "25%":
            return amount + (amount * twentyfive)
        default:
            return amount
        }
    }
    
    var perPerson: Double {
        return totalAmount / numPeople
     }
    
    var body: some View {
        NavigationStack {
            Form {
                Section("Amount and Number of People") {
                    TextField("Amount", value: $amount, format: .number)
                    TextField("Number of People", value: $numPeople, format: .number)
                    }
                Section("Select Tip") {
                    Picker("Tip", selection: $tip) {
                        ForEach(tipOption, id: \.self) { tip in Text(tip)
                        }
                    }
                    .pickerStyle(SegmentedPickerStyle())
                    }
                Section("Check Total with Tip") {
                    Text("$\(String(format: "%.2f", totalAmount))")
                    }
                Section("Total Per Person") {
                    Text("$\(String(format: "%.2f", perPerson))")
                    }
                }
                .navigationTitle("WeSplit")
            }
        }
    }

#Preview {
    ContentView()
}
