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
    
    // MARK: Computed properties
    var body: some View {
        NavigationView {
            VStack {
                HueSliderView()
                
                Slider(value: $hue, in: 0...360, label: {Text("Hues")}, minimumValueLabel: {Text("0")}, maximumValueLabel: {Text("360")})
                
                Rectangle()
                    .foregroundColor(Color(hue: hue/360, saturation: 1, brightness: 1))
                    .frame(width: 100, height: 100)
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
