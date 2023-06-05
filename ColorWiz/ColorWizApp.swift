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
            
            TabView {
                ColorSchemeView()
                    .tabItem {
                        Image(systemName: "paintpalette.fill")
                        Text("Color Schemes")
                    }
                
                FavoritesView()
                    .tabItem {
                        Image(systemName: "star.fill")
                        Text("Favorites")
                    }
                
            }
        }
    }
}
