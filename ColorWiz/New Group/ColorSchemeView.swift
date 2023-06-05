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
    
    var analagousA: Double {

        let result = (hue + 30).remainder(dividingBy: 360.0)
//        print(abs(result))
        return abs(result)

    }
    
    var analagousB: Double {

        let result = (hue + 330)
//        print(abs(result))
        return abs(result)

    }
    
    var complementary: Double {

        let result = (hue + 180.0).remainder(dividingBy: 360.0)
        print(result)
        return result

    }
    
    var R: Double = 0
    var G: Double = 255
    var B: Double = 255
    
    // MARK: Computed properties
    var body: some View {
        NavigationView {
            VStack {
                
                HueSliderView()
                
                Slider(value: $hue, in: 0...360, label: {Text("Hues")}, minimumValueLabel: {Text("  0 ")}, maximumValueLabel: {Text("360")})
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
                
                HStack {
                    VStack(spacing: 0) {
                        Text("Analogous")
                            .font(.subheadline)

                        Rectangle()
                            .foregroundColor(Color(hue: analagousB/360, saturation: 1, brightness: 1))
                            .frame(width: 100, height: 100)

                        Rectangle()
                            .foregroundColor(Color(hue: hue/360, saturation: 1, brightness: 1))
                            .frame(width: 100, height: 100)

                        Rectangle()
                            .foregroundColor(Color(hue: analagousA/360, saturation: 1, brightness: 1))
                            .frame(width: 100, height: 100)
                    }
                    
                    VStack(spacing: 0) {
                        Text("Monochromatic")
                            .font(.subheadline)

                        Rectangle()
                            .foregroundColor(Color(hue: hue/360, saturation: 1, brightness: 1))
                            .frame(width: 100, height: 100)

                        Rectangle()
                            .foregroundColor(Color(hue: hue/360, saturation: 1, brightness: 2/3))
                            .frame(width: 100, height: 100)

                        Rectangle()
                            .foregroundColor(Color(hue: hue/360, saturation: 1, brightness: 1/3))
                            .frame(width: 100, height: 100)
                    }
                    
                    VStack(spacing: 0) {
                        Text("Complementary")
                            .font(.subheadline)

                        Rectangle()
                            .foregroundColor(Color(hue: hue/360, saturation: 1, brightness: 1))
                            .frame(width: 100, height: 150)

                        Rectangle()
                            .foregroundColor(Color(hue: complementary/360, saturation: 1, brightness: 1))
                            .frame(width: 100, height: 150)
                    }
                    
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
