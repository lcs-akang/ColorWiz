//
//  ColorSchemeView.swift
//  ColorWiz
//
//  Created by Aidan Kang on 2023-06-01.
//

import SwiftUI

struct ColorSchemeView: View {
    
    // MARK: Stored properties
    @State var hue: Double = 180.0
    
    var R: Double = 0
    var G: Double = 255
    var B: Double = 255
    
    // MARK: Computed properties
    var body: some View {
        NavigationView {
            VStack {
                
                HueSliderView()
                
                Slider(value: $hue, in: 0...360, label: {Text("Hues")}, minimumValueLabel: {Text("0")}, maximumValueLabel: {Text("360")})
                    .padding(.horizontal)
                
                Text("Hue: \(hue.formatted(.number.precision(.fractionLength(1))))")
                
                Rectangle()
                    .foregroundColor(Color(hue: hue/360, saturation: 1, brightness: 1))
                    .frame(width: 200, height: 100)
                
                HStack {
                    Text("R: 0")
                    
                    Text("G: 255")
                    
                    Text("B: 255")
                }
                
               
                
            }
        }
        .navigationTitle("Color Schemes")
    }
}

struct ColorSchemeView_Previews: PreviewProvider {
    static var previews: some View {
        ColorSchemeView()
    }
}
