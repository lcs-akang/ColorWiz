//
//  ResultView.swift
//  ColorWiz
//
//  Created by Aidan Kang on 2023-06-06.
//

import SwiftUI

struct ResultView: View {
    
    // MARK: Stored properties
    
    let somePriorResult: Result
    
    var colorWidth: Double {
        let result = somePriorResult.type
        
        if result == .complementary {
            return 75
        } else {
            return 50
        }
    }
    
    var colorWidthSpecial: Double {
        
        let result = somePriorResult.type
        
        if result == .complementary {
            return 0
        } else {
            return 50
        }
        
    }
    
    var typeName: String {
        let result = somePriorResult.type
        
        if result == .analogous {
            return "Analogous"
        } else if result == .monochromatic {
            return "Monochromatic"
        } else if result == .complementary {
            return "Complementary"
        } else {
            return "Triadic"
        }
    }

    var color1H: Double {
        
        let result = somePriorResult.type
        
        if result == .analogous {
            
            let analogousResult = (somePriorResult.colorH - 30).remainder(dividingBy: 360.0)
            
            
            if analogousResult < 0 {
                
                let correctedResult = analogousResult + 360.0
                print("Analogous B Corrected Result: \(correctedResult)")
                return correctedResult
                
            } else {
                
                print(("Analogous - 30 is: \(analogousResult)"))
                return analogousResult
                
            }
        } else {
            return somePriorResult.colorH
        }
        
    }
    
    var color2H: Double {
        
        let result = somePriorResult.type
        
        if result == .complementary {
            let result = (somePriorResult.colorH + 180.0).remainder(dividingBy: 360.0)
            
            
            if result < 0 {
                
                let correctedResult = result + 360.0
                print("Complementary Corrected Result: \(correctedResult)")
                return correctedResult
                
            } else {
                
                print(("Complementary is: \(result)"))
                return result
                
            }
        } else if result == .triadic {
            let result = (somePriorResult.colorH + 120.0).remainder(dividingBy: 360.0)
            
            if result < 0 {
                
                let correctedResult = result + 360.0
                print("Triadic 120 Corrected Result: \(correctedResult)")
                return correctedResult
                
            } else {
                
                print(("Triadic 120 is: \(result)"))
                return result
                
            }
        } else {
            return somePriorResult.colorH
        }
    }
    
    var color3H: Double {
        
        let result = somePriorResult.type
        
        if result == .analogous {
            let result = (somePriorResult.colorH + 30).remainder(dividingBy: 360.0)
            
            if result < 0 {
                
                let correctedResult = result + 360.0
                print("Analogous A Corrected Result: \(correctedResult)")
                return correctedResult
                
            } else {
                
                print("Analogous + 30 is: \(result)")
                return result
                
            }
        } else if result == .triadic {
            let result = (somePriorResult.colorH + 240.0).remainder(dividingBy: 360.0)
            
            if result < 0 {
                
                let correctedResult = result + 360.0
                print("Triadic 240 Corrected Result: \(correctedResult)")
                return correctedResult
                
            } else {
                
                print(("Triadic 240 is: \(result)"))
                return result
                
            }
        } else {
            return somePriorResult.colorH
        }
        
    }
    
 
    }
    // MARK: Computed properties
    var body: some View {
        HStack(spacing: 15) {
            
            Text("\(typeName)")
                .font(.title2.smallCaps())
            
            HStack(spacing: 3) {
                
                Rectangle()
                    .foregroundColor(Color(hue: color1H/360, saturation: 1, brightness: 1))
                    .frame(width: colorWidth, height: 50)
                
                Rectangle()
                    .foregroundColor(Color(hue: color2H/360, saturation: 1, brightness: 1))
                    .frame(width: colorWidth, height: 50)
                
                Rectangle()
                    .foregroundColor(Color(hue: color3H/360, saturation: 1, brightness: 1))
                    .frame(width: colorWidthSpecial, height: 50)
                
                
            }
            
        }
    }
}

struct ResultView_Previews: PreviewProvider {
    static var previews: some View {
        ResultView(somePriorResult: resultforPreviews)
    }
}
