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
    @State private var inputUnit = 0
    @State private var outputUnit = 0
    
    var outputNumber: Double {
        guard  let inputValue = Double(inputNumber) else { return 0 }
        
        var valueInMeters: Double = 0
        
        switch inputUnit {
        case 0:
            valueInMeters = inputValue
        case 1:
            valueInMeters = inputValue * 1000
        case 2:
            valueInMeters = inputValue * 0.3048
        case 3:
            valueInMeters = inputValue * 0.9144
        case 4:
            valueInMeters = inputValue * 1609.344
        default:
            break
        }
        
        var outputValue: Double = 0
        
        switch outputUnit {
        case 0:
            outputValue = valueInMeters
        case 1:
            outputValue = valueInMeters / 1000
        case 2:
            outputValue = valueInMeters / 0.3048
        case 3:
            outputValue = valueInMeters / 0.9144
        case 4:
            outputValue = valueInMeters / 1609.344
        default:
            break
        }
        
        return outputValue
    }
    
    var body: some View {
        NavigationView {
            Form {
                Section(header: Text("Input Value")) {
                    TextField("Enter value...", text: $inputNumber)
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
                Section(header: Text("Output Value")) {
                    Text("\(outputNumber, specifier: "%.4f")")
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
