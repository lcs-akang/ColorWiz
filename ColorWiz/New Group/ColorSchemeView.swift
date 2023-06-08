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
    @State var saturation: Double = 1.0
    @State var value: Double = 1.0
    
    @State var priorResults: [Result] = []
    
    var analogousA: Double {
        
        let result = (hue + 30).remainder(dividingBy: 360.0)
        
        if result < 0 {
            
            let correctedResult = result + 360.0
            print("Analogous A Corrected Result: \(correctedResult)")
            return correctedResult
            
        } else {
            
            print("Analogous + 30 is: \(result)")
            return result
            
        }
        
    }
    
    var analogousB: Double {
        
        let result = (hue - 30).remainder(dividingBy: 360.0)
        
        
        if result < 0 {
            
            let correctedResult = result + 360.0
            print("Analogous B Corrected Result: \(correctedResult)")
            return correctedResult
            
        } else {
            
            print(("Analogous - 30 is: \(result)"))
            return result
            
        }
    }
    
    
    var complementary: Double {
        
        let result = (hue + 180.0).remainder(dividingBy: 360.0)
        
        
        if result < 0 {
            
            let correctedResult = result + 360.0
            print("Complementary Corrected Result: \(correctedResult)")
            return correctedResult
            
        } else {
            
            print(("Complementary is: \(result)"))
            return result
            
        }
        
    }
    
    var R: Double {
        return hsvToRGB(hue: hue, saturation: saturation, value: value).0 * 255
    }
    var G: Double {
        return hsvToRGB(hue: hue, saturation: saturation, value: value).1 * 255
    }
    var B: Double {
        return hsvToRGB(hue: hue, saturation: saturation, value: value).2 * 255
    }
    
    var triadic120: Double {
        
        let result = (hue + 120.0).remainder(dividingBy: 360.0)
        
        if result < 0 {
            
            let correctedResult = result + 360.0
            print("Triadic 120 Corrected Result: \(correctedResult)")
            return correctedResult
            
        } else {
            
            print(("Triadic 120 is: \(result)"))
            return result
            
        }
        
        
    }
    
    var triadic240: Double {
        
        let result = (hue + 240.0).remainder(dividingBy: 360.0)
        
        if result < 0 {
            
            let correctedResult = result + 360.0
            print("Triadic 240 Corrected Result: \(correctedResult)")
            return correctedResult
            
        } else {
            
            print(("Triadic 240 is: \(result)"))
            return result
            
        }
        
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
                    Text("R: \(R.formatted(.number.precision(.fractionLength(0))))")
                    
                    Text("G: \(G.formatted(.number.precision(.fractionLength(0))))")
                    
                    Text("B: \(B.formatted(.number.precision(.fractionLength(0))))")
                }
                
                HStack {
                    VStack(spacing: 0) {
                        Text("Analogous")
                            .font(.system(size: 12))
                            .padding(.vertical)
                        
                        Rectangle()
                            .foregroundColor(Color(hue: analogousB/360, saturation: 1, brightness: 1))
                            .frame(width: 75, height: 75)
                        
                        Rectangle()
                            .foregroundColor(Color(hue: hue/360, saturation: 1, brightness: 1))
                            .frame(width: 75, height: 75)
                        
                        Rectangle()
                            .foregroundColor(Color(hue: analogousA/360, saturation: 1, brightness: 1))
                            .frame(width: 75, height: 75)
                        
                        Button(action: {
                            
                            let latestResult = Result(type: .analogous,
                                                      colorH: hue,
                                                      colorS: saturation,
                                                      colorV: value)
                            
                            priorResults.insert(latestResult, at: 0)
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
                            
                            let latestResult = Result(type: .monochromatic,
                                                      colorH: hue,
                                                      colorS: saturation,
                                                      colorV: value)
                            
                            priorResults.insert(latestResult, at: 0)
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
                            
                            let latestResult = Result(type: .complementary,
                                                      colorH: hue,
                                                      colorS: saturation,
                                                      colorV: value)
                            
                            priorResults.insert(latestResult, at: 0)
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
                            
                            let latestResult = Result(type: .triadic,
                                                      colorH: hue,
                                                      colorS: saturation,
                                                      colorV: value)
                            
                            priorResults.insert(latestResult, at: 0)
                        }, label: {
                            Text("Save")
                        })
                        .buttonStyle(.bordered)
                        .padding(.vertical)
                    }
                    
                }
                
                
                List {
                    ForEach(priorResults) { currentResult in
                        HStack {
                            Spacer()
                            ResultView(somePriorResult: currentResult)
                            Spacer()
                        }
                    }
                    .onDelete(perform: removeRows)
                }
                
                
                
                
            }
        }
        .navigationTitle("Color Schemes")
    }
    // MARK: Functions
    
    func hsvToRGB(hue: Double, saturation: Double, value: Double) -> (Double, Double, Double) {
        let chroma = value * saturation
        let huePrime = hue / 60.0
        let x = chroma * (1 - abs((huePrime.truncatingRemainder(dividingBy: 2)) - 1))
        let m = value - chroma
        
        var rgb: (Double, Double, Double)
        if huePrime < 1 {
            rgb = (chroma, x, 0)
        } else if huePrime < 2 {
            rgb = (x, chroma, 0)
        } else if huePrime < 3 {
            rgb = (0, chroma, x)
        } else if huePrime < 4 {
            rgb = (0, x, chroma)
        } else if huePrime < 5 {
            rgb = (x, 0, chroma)
        } else {
            rgb = (chroma, 0, x)
        }
        
        rgb = (rgb.0 + m, rgb.1 + m, rgb.2 + m)
        return rgb
    }
    
    func removeRows(at offsets: IndexSet) {
        priorResults.remove(atOffsets: offsets)
    }
    
}

struct ColorSchemeView_Previews: PreviewProvider {
    static var previews: some View {
        ColorSchemeView()
    }
}
