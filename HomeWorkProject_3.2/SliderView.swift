//
//  SliderView.swift
//  HomeWorkProject_3.2
//
//  Created by Максим on 11.09.2021.
//

import SwiftUI

struct SliderView: View {
    let value = 50.0
    @State private var isEditing = false
    @State private var label = ""
    @State private var alertPresented = false
    
    var body: some View {
        ContentView()
    }
}

struct SliderView_Previews: PreviewProvider {
    static var previews: some View {
        SliderView()
    }
}
