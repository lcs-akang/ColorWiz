//
//  HueSliderView.swift
//  ColorWiz
//
//  Created by Aidan Kang on 2023-06-01.
//

import SwiftUI

struct HueSliderView: View {
    
    let hues = Array(stride(from: 0.0, through: 360.0, by: 1.0))
    
    var body: some View {
        HStack(spacing: 0) {
            ForEach(hues, id: \.self) { currentHue in
                let _ = print(currentHue)
                Rectangle()
                    .foregroundColor(Color(hue: currentHue/360, saturation: 100.0/100.0, brightness: 100.0/100.0))
                    .frame(width:1, height: 30)
            }
        }
    }
}

struct HueSliderView_Previews: PreviewProvider {
    static var previews: some View {
        HueSliderView()
    }
}
