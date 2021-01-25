//
//  MedidationModel.swift
//  calm-mind
//
//  Created by Christopher Ching on 2020-11-27.
//

import Foundation
import SwiftUI
import Purchases

class MeditationModel: ObservableObject {
    
    @Published var meditations = [Meditation]()
    
    // Note: For this demo, we're keeping track of purchases with a dictionary and bool flag.
    // This won't fly in a production app.
    // In a production app, you would likely persist this data in a database linked to their account
    // and then fetch that information from the database.
    @Published var userPurchases = [String:Bool]()
    @Published var allAccess = false
    
    init() {
        
        // Get meditations
        self.meditations = Meditation.TestData()
        
        // Check if the user has an active subscription
        Purchases.shared.purchaserInfo { (info, error) in
            
            // Check the info parameter for active entitlements
            if info?.entitlements["allaccess"]?.isActive == true {
                
                // Unlock all access for the user
                self.allAccess = true
            }
        }
    }
    
    func makeSubscriptionPurchase() {
        
        // Perform purchase
        PurchaseService.purchase(productId: Constants.subscriptionProductId) {
            
            // Upon successful purchase, set the all access flag
            self.allAccess = true
        }
    }
    
    func makePurchase(meditation:Meditation) {
        
        // Perform purchase
        PurchaseService.purchase(productId: meditation.productId) {
            
            // Upon successful purchase, set the purchase status of the meditation
            if meditation.productId != nil {
                self.userPurchases[meditation.productId!] = true
            }
        }
    }
}
