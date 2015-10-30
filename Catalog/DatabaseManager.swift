//
//  DatabaseManager.swift
//  Catalog
//
//  Created by 홍정아 on 2015. 10. 30..
//  Copyright © 2015년 tacademy. All rights reserved.
//

import Foundation
import RealmSwift

class DatabaseManager {
    static var sharedManger = DatabaseManager()
    var cartItem: Results<CartItem>
    
    init() {
        let realm = try! Realm()
        cartItem = realm.objects(CartItem)
    }
    
    // 로컬 DB 저장
    func insertData(data: String) {
        let cartItem = CartItem()
        cartItem.cartItemName = data
        cartItem.cartItemCount = 1
        
        
        let realm = try! Realm()
        try! realm.write {
            realm.add(cartItem, update: false)
        }
    }
    
    // 로컬 DB 조회
    func selectData() {
        let realm = try! Realm()
        cartItem = realm.objects(CartItem)
        for var index = 0; index < cartItem.count; ++index {
            CartManager.sharedManger.cartList.append(cartItem[index].cartItemName)
        }
    }
}