//
//  Result.swift
//  ColorWiz
//
//  Created by Aidan Kang on 2023-06-05.
//

import Foundation

enum ColorSwatchType: Int {
    case analogous = 1
    case monochromatic = 2
    case complementary = 3
    case triadic = 4
}

struct Result: Identifiable {

    var id = UUID()
    var type: ColorSwatchType
    
    var colorH: Double
    var colorS: Double
    var colorV: Double
    
}

let resultforPreviews = Result(type: .complementary,
                               colorH: 180,
                               colorS: 100,
                               colorV: 100)
