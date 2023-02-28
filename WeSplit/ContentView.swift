//
//  ContentView.swift
//  WeSplit
//
//  Created by Ryan DeVault on 2/18/23.
//

import SwiftUI

struct ContentView: View {
    @State private var checkAmount = 20.0
    @State private var numberOfPeople = 2
    @State private var tipPercentage = 20
    @FocusState private var amountIsFocused: Bool
    let tipPercentages = [0, 10, 15, 20, 25]
    var tipValue: Double{
        return checkAmount / 100 * Double(tipPercentage)
    }
    var grandTotal: Double{
        return checkAmount + tipValue
    }
    var totalPerPerson: Double{
        return grandTotal / Double(numberOfPeople + 2)
    }
    var body: some View {
        NavigationView{
            Form{
                Section{
                    VStack{
                        Text("Check")
                            .frame(maxWidth: .infinity, alignment: .leading)
                            .font(.system(size: 10.0))
                            .padding(0)
                        TextField("Check Amount", value: $checkAmount, format: .currency(code: Locale.current.currency?.identifier ?? "USD"))
                            .keyboardType(.decimalPad)
                            .textFieldStyle(RoundedBorderTextFieldStyle())
                            .focused($amountIsFocused)
                    }
                    
                    Picker("Number of people", selection: $numberOfPeople){
                        ForEach(2 ..< 100){
                            Text("\($0) people")
                        }
                    }
                    
                    Picker("Tip percentage", selection: $tipPercentage){
                        ForEach(0 ..< 101, id: \.self){
                            Text($0, format: .percent)
                        }
                    }
                    .pickerStyle(.menu)
                    
                    Text("Tip \(tipValue, format: .currency(code: Locale.current.currency?.identifier ?? "USD"))").padding()
                    
                    Text("Total Cost \(grandTotal, format: .currency(code: Locale.current.currency?.identifier ?? "USD"))").padding()
                    
                    Text("Per Person \(totalPerPerson, format: .currency(code: Locale.current.currency?.identifier ?? "USD"))").padding()
                } header: {
                    Text("Calculate tip")
                }
            }.navigationTitle("WeSplit")
                .toolbar{
                    ToolbarItemGroup(placement: .keyboard){
                        Spacer()
                        
                        Button("Done"){
                            amountIsFocused = false
                        }
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
