//
//  ContentView.swift
//  HomeWorkProject_3.2
//
//  Created by Максим on 11.09.2021.
//

import SwiftUI

struct ContentView: View {
    @State private var redValue = 0.0
    @State private var greenValue = 0.0
    @State private var blueValue = 0.0
    @State private var redLabel = ""
    @State private var greenLabel = ""
    @State private var blueLabel = ""
    @State private var alertPresented = false
    
    var body: some View {
        VStack {
            Color(red: redValue / 255.0,
                  green: greenValue / 255.0,
                  blue: blueValue / 255.0)
                .frame(width: 100, height: 100)
            SettingsView(value: $redValue,
                         label: $redLabel,
                         alertPresented: $alertPresented,
                     color: .red)
            SettingsView(value: $greenValue,
                         label: $greenLabel,
                         alertPresented: $alertPresented,
                         color: .green)
            SettingsView(value: $blueValue,
                         label: $blueLabel,
                         alertPresented: $alertPresented,
                         color: .blue)
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

struct SettingView: View {
    @Binding var colorName: Double
    @Binding var value: String
    
    var body: some View {
        HStack {
            Text("\(colorName)")
            Slider(value: $colorName)
            
        }.padding()
    }
}

struct SettingsView: View {
    @Binding var value: Double
    @Binding var label: String
    @Binding var alertPresented: Bool
    let color: Color
    
    var body: some View {
        HStack {
            Text("\(lround(value))")
                .frame(width: 40, height: 40)
            Slider(
                value: $value,
                in: 0...255,
                step: 1)
                .accentColor(color)
            TextField("000", text: $label, onCommit:  {
                checkData()
            })
            .alert(isPresented: $alertPresented, content: {
                Alert(title: Text("Wrong format"), message: Text("Enter number from 0 to 255"))
            })
            .frame(width: 50, height: 40)
            .border(Color.black, width: 3)
        }.padding()
    }
    
    private func checkData() {
        if let number = Double(label) {
            if number >= 0 && number <= 255 {
                value = number
            } else {
                alertPresented.toggle()
                label = ""
            }
        } else {
            alertPresented.toggle()
            label = ""
        }
    }
}
