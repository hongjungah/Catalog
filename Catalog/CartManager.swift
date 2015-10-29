//
//  CartManager.swift
//  Catalog
//
//  Created by sdt5 on 2015. 10. 26..
//  Copyright © 2015년 tacademy. All rights reserved.
//

import Foundation
import RealmSwift
import Alamofire

//let ModelChangedNotification = "ModelChangedNotification"

class CartManager {

    static var sharedManger = CartManager()
    
    var cartList = [String]()
    
    var count: Int {
        return cartList.count
    }
    
    func CartAt(index: Int) -> String {
        return cartList[index]
    }
    
    func retriveCart() {
       //let realm = try! Realm()
       // cartList = realm.objects(cartList)
    }
    
    func addCart(data: String) {
        RequestController.sharedManger.sendRequestPOST(data)
    }
}
