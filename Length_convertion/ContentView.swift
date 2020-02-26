//
//  ContentView.swift
//  Length_convertion
//
//  Created by slava bily on 25/2/20.
//  Copyright © 2020 slava bily. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    
    let units = ["meter", "kilometer", "foot", "yard", "mile"]
    
    @State private var inputNumber = ""
    @State private var inputUnit = 2
    @State private var outputUnit = 2
    
    var outputNumber: Double {
        guard  let inputValue = Double(inputNumber) else { return 0 }
        var valueInMeters: Double = 0
        
        switch inputUnit {
        case 0:
            valueInMeters = inputValue
        case 1:
            valueInMeters = inputValue * 1000
        case 2:
            valueInMeters = inputValue / 3
        case 3:
            valueInMeters = inputValue * 100
        case 4:
            valueInMeters = inputValue * 1600
        default:
            break
        }
        
        let outputValue = valueInMeters
        
        return outputValue
    }
    
    var body: some View {
        NavigationView {
            Form {
                Section {
                    TextField("Input", text: $inputNumber)
                        .keyboardType(.decimalPad)
                }
                Section(header: Text("Input Unit")) {
                    Picker("Input Unit", selection: $inputUnit) {
                        ForEach(0 ..< units.count) {
                            Text("\(self.units[$0])")
                        }
                    }
                    .pickerStyle(SegmentedPickerStyle())
                }
                Section(header: Text("Output Unit")) {
                    Picker("Output Unit", selection: $outputUnit) {
                        ForEach(0 ..< units.count) {
                            Text("\(self.units[$0])")
                        }
                    }
                    .pickerStyle(SegmentedPickerStyle())
                }
                Section(header: Text("Output")) {
                    Text("\(outputNumber, specifier: "%.2f")")
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
