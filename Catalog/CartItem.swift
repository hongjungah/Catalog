//
//  CartItem.swift
//  Catalog
//
//  Created by sdt5 on 2015. 10. 27..
//  Copyright © 2015년 all4web. All rights reserved.
//

import Foundation
import RealmSwift

class CartItem: Object {
	dynamic var cartItemName: String = ""
	dynamic var cartItemCount: Int = 0
}