//
//  ContentView.swift
//  wesplit-takehome
//
//  Created by Sarah Threewits on 10/2/24.
//

import SwiftUI

struct ContentView: View {
    
    @State var amount = 0.0
    @State var numPeople = 1.0
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
    
    // (condition ? if true : if false)
    var perPerson: Double {
        return numPeople > 0 ? totalAmount / numPeople : 0.0
     }
    
    /* validateAmountInput is a helper function to ensure the amount field doesn't accept a negative value. max() takes two values and returns the larger, so if the input was less than 0.0, the function will return 0.0
     */
    
    func validateAmountInput(_ value: Double) -> Double {
        return max(value, 0.0)
    }
    
    /* floor(validatedValue): the floor() function rounds the number down to the nearest int, so there will not be decimals for people input
     */
    
    func validatePeopleInput(_ value: Double) -> Double {
        let validatedValue = max(value, 1.0)
        return floor(validatedValue)
    }
    
    var body: some View {
        
        NavigationStack {
            Form {
                Section("Amount and Number of People") {
                    TextField("Amount", value: $amount, format: .number)
                    // binding validation changes
                        .onChange(of: amount) { amount = validateAmountInput(amount)
                        }
                    
                    TextField("Number of People", value: $numPeople, format: .number)
                    // binding validation changes
                        .onChange(of: numPeople) {
                            numPeople = validatePeopleInput(numPeople)
                        }
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
