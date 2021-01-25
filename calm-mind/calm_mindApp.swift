//
//  calm_mindApp.swift
//  calm-mind
//
//  Created by Christopher Ching on 2020-11-23.
//

import SwiftUI
import Purchases

@main
struct calm_mindApp: App {
    
    init() {
        setupRevenueCat()
    }
    
    var body: some Scene {
        WindowGroup {
            FeaturedView()
                .environmentObject(MeditationModel())
        }
    }
    
    func setupRevenueCat() {
        
        Purchases.debugLogsEnabled = true
        Purchases.configure(withAPIKey: "Your_Own_RevenueCat_ApiKey")
        // Sign up for a free account at https://codewithchris.com/rcat2
    }
}
