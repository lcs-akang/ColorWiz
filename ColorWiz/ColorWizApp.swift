//
//  ColorWizApp.swift
//  ColorWiz
//
//  Created by Aidan Kang on 2023-06-01.
//

import SwiftUI

@main
struct ColorWizApp: App {
    var body: some Scene {
        WindowGroup {
                ResultView(somePriorResult: resultforPreviews)
        }
    }
}
