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
    @State private var alertPresented = false
    
    
    var body: some View {
        ZStack {
            Color(#colorLiteral(red: 0.9529411793, green: 0.6862745285, blue: 0.1333333403, alpha: 1))
                .ignoresSafeArea()
            VStack {
                RoundedRectangle(cornerRadius: 25.0)
                    .overlay(RoundedRectangle(cornerRadius: 25.0).stroke(Color.white, lineWidth: 4))
                    .padding()
                    .frame(height: 200)
                    .foregroundColor(Color(red: redValue / 255.0, green: greenValue / 255.0, blue: blueValue / 255.0))
                SettingsView(value: $redValue,
                             alertPresented: $alertPresented,
                             color: .red)
                SettingsView(value: $greenValue,
                             alertPresented: $alertPresented,
                             color: .green)
                SettingsView(value: $blueValue,
                             alertPresented: $alertPresented,
                             color: .blue)
                Spacer()
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

struct SettingsView: View {
    @Binding var value: Double
    @Binding var alertPresented: Bool
    let color: Color
    
    var body: some View {
        HStack {
            Text("\(lround(value))")
                .frame(width: 40, height: 40)
                .foregroundColor(.white)
            Slider(value: $value,
                   in: 0...255,
                   step: 1)
                .animation(.default)
                .accentColor(color)
            TextField("255",
                      value: $value,
                      formatter: NumberFormatter(), onCommit:  {
                        checkData()
                      })
                .modifireTF()
                .alert(isPresented: $alertPresented, content: {
                    Alert(title: Text("Wrong format"), message: Text("Enter number from 0 to 255"))
                })
        }.padding(10)
    }
    
    private func checkData() {
        if value < 0 || value > 255 {
            alertPresented.toggle()
            value = 0
        }
    }
}

struct TextFieldModifire: ViewModifier {
    func body(content: Content) -> some View {
        content
            .textFieldStyle(RoundedBorderTextFieldStyle())
            .frame(width: 50, height: 40)
            .multilineTextAlignment(.trailing)
    }
}

extension TextField {
    func modifireTF() -> some View {
        ModifiedContent(content: self, modifier: TextFieldModifire())
    }
}
