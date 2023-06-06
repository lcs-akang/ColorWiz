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

    // MARK: Computed properties
    var body: some View {
        HStack(spacing: 15) {
            
            Text("\(typeName)")
                .font(.title2.smallCaps())
            
            HStack(spacing: 3) {
                
                Rectangle()
                    .foregroundColor(Color(hue: 150/360, saturation: 1, brightness: 1))
                    .frame(width: colorWidth, height: 50)
                
                Rectangle()
                    .foregroundColor(Color(hue: 180/360, saturation: 1, brightness: 1))
                    .frame(width: colorWidth, height: 50)
                
                Rectangle()
                    .foregroundColor(Color(hue: 210/360, saturation: 1, brightness: 1))
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
