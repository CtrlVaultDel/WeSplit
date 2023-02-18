//
//  ContentView.swift
//  WeSplit
//
//  Created by Ryan DeVault on 2/18/23.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        VStack {
            Form{
                Section{
                    Text("Item 6")
                    Text("Item 7")
                    Text("Item 8")
                    Text("Item 9")
                    Text("Item 10")
                    Text("Item 11")
                }
            }.navigationTitle("Swift UI")
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView().previewLayout(.device).previewDevice("iPhone 14")
    }
}
