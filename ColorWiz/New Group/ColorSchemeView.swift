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

        print("Analagous + 30 is: \(result)")
        return (result)

    }
    
    var analagousB: Double {

        let result = (hue - 30).remainder(dividingBy: 360.0)
        print(("Analagous - 30 is: \(result)"))
        return (result)

    }
    
    var complementary: Double {

        let result = (hue + 180.0).remainder(dividingBy: 360.0)
        print(("Complementary is: \(result)"))
        return result

    }
    
    var R: Double = 0
    var G: Double = 255
    var B: Double = 255
    
    var triadic120: Double {
        
        let result = (hue + 120.0).remainder(dividingBy: 360.0)
        print("Triadic + 120 is: \(result)")
        return result
        
    }

    var triadic240: Double {
        
        let result = (hue + 240.0).remainder(dividingBy: 360.0)
        print("Triadic + 240 is: \(result)")
        return result
        
    }
    
    // MARK: Computed properties
    var body: some View {
        NavigationView {
            VStack {
                
                HueSliderView()
                    .padding(.top)
                
                Slider(value: $hue, in: 0...360, label: {Text("Hues")}, minimumValueLabel: {Text("  0 ")}, maximumValueLabel: {Text("360")})
                    .padding(.horizontal)
                
                Text("Hue: \(hue.formatted(.number.precision(.fractionLength(1))))")
                
                Rectangle()
                    .foregroundColor(Color(hue: hue/360, saturation: 1, brightness: 1))
                    .frame(width: 200, height: 75)
                
                HStack {
                    Text("R: 0")
                    
                    Text("G: 255")
                    
                    Text("B: 255")
                }
                
                HStack {
                    VStack(spacing: 0) {
                        Text("Analogous")
                            .font(.system(size: 12))
                            .padding(.vertical)

                        Rectangle()
                            .foregroundColor(Color(hue: analagousB/360, saturation: 1, brightness: 1))
                            .frame(width: 75, height: 75)

                        Rectangle()
                            .foregroundColor(Color(hue: hue/360, saturation: 1, brightness: 1))
                            .frame(width: 75, height: 75)

                        Rectangle()
                            .foregroundColor(Color(hue: analagousA/360, saturation: 1, brightness: 1))
                            .frame(width: 75, height: 75)
                        
                        Button(action: {
                            
                        }, label: {
                            Text("Save")
                        })
                        .buttonStyle(.bordered)
                        .padding(.vertical)
                    }
                    
                    VStack(spacing: 0) {
                        Text("Monochromatic")
                            .font(.system(size: 12))
                            .padding(.vertical)

                        Rectangle()
                            .foregroundColor(Color(hue: hue/360, saturation: 1, brightness: 1))
                            .frame(width: 75, height: 75)

                        Rectangle()
                            .foregroundColor(Color(hue: hue/360, saturation: 1, brightness: 2/3))
                            .frame(width: 75, height: 75)

                        Rectangle()
                            .foregroundColor(Color(hue: hue/360, saturation: 1, brightness: 1/3))
                            .frame(width: 75, height: 75)
                        
                        Button(action: {
                            
                        }, label: {
                            Text("Save")
                        })
                        .buttonStyle(.bordered)
                        .padding(.vertical)
                    }
                    
                    VStack(spacing: 0) {
                        Text("Complementary")
                            .font(.system(size: 12))
                            .padding(.vertical)
                        
                        Rectangle()
                            .foregroundColor(Color(hue: hue/360, saturation: 1, brightness: 1))
                            .frame(width: 75, height: 112.5)
                        
                        Rectangle()
                            .foregroundColor(Color(hue: complementary/360, saturation: 1, brightness: 1))
                            .frame(width: 75, height: 112.5)
                    
                        Button(action: {
                            
                        }, label: {
                            Text("Save")
                        })
                        .buttonStyle(.bordered)
                        .padding(.vertical)
                    }
                    
                    VStack(spacing: 0) {
                        Text("Triadic")
                            .font(.system(size: 12))
                            .padding(.vertical)

                        Rectangle()
                            .foregroundColor(Color(hue: hue/360, saturation: 1, brightness: 1))
                            .frame(width: 75, height: 75)

                        Rectangle()
                            .foregroundColor(Color(hue: triadic120/360, saturation: 1, brightness: 1))
                            .frame(width: 75, height: 75)

                        Rectangle()
                            .foregroundColor(Color(hue: triadic240/360, saturation: 1, brightness: 1))
                            .frame(width: 75, height: 75)
                        
                        Button(action: {
                            
                        }, label: {
                            Text("Save")
                        })
                        .buttonStyle(.bordered)
                        .padding(.vertical)
                    }
                    
                }
                Spacer()
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
