//
//  CartManager.swift
//  Catalog
//
//  Created by sdt5 on 2015. 10. 26..
//  Copyright © 2015년 tacademy. All rights reserved.
//

import Foundation

let ModelChangedNotification = "ModelChangedNotification"

class CartManager {

    static var sharedManger = CartManager()
    
    var cartList = [String]()
    
    var count: Int {
        return cartList.count
    }
    
    func CartAt(index: Int) -> String {
        return cartList[index]
    }
    
    func addCart(data: String) {
        cartList.insert(data, atIndex: cartList.count)
        
        NSNotificationCenter.defaultCenter().postNotificationName("CatalogChanged", object: nil)
    }
}
