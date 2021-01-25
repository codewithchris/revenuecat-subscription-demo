//
//  PurchaseManager.swift
//  calm-mind
//
//  Created by Christopher Ching on 2020-11-25.
//

import Foundation
import Purchases

class PurchaseService {
    
    
    static func purchase(productId:String?, successfulPurchase:@escaping () -> Void) {
    
        guard productId != nil else {
            return
        }
        
        var skProduct:SKProduct?
        
        // Find product based on Id
        Purchases.shared.products([productId!]) { products in
            
            if !products.isEmpty {
                skProduct = products[0]
                
                // Purchase it
                Purchases.shared.purchaseProduct(skProduct!) { (transaction, purchaseInfo, error, userCancelled) in
                    
                    // If successful purchase...
                    if error == nil && !userCancelled {
                        successfulPurchase()
                    }
                    
                }
            }
        }
    }
    
}
