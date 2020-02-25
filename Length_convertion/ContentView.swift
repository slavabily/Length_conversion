//
//  ContentView.swift
//  Length_convertion
//
//  Created by slava bily on 25/2/20.
//  Copyright © 2020 slava bily. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    
    @State private var inputNumber = ""
    
    var body: some View {
        NavigationView {
            Form {
                Section {
                    TextField("Input", text: $inputNumber)
                        .keyboardType(.decimalPad)
                }
            }
            .navigationBarTitle("Length conversion")
            
            
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
