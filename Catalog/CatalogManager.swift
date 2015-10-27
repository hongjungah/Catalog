//
//  ProducManager.swift
//  Catalog
//
//  Created by sdt5 on 2015. 10. 26..
//  Copyright © 2015년 tacademy. All rights reserved.
//

import Foundation

class CatalogManager: NSObject {
    static var sharedManager = CatalogManager()
    
    var catalogList = [String]()
    
    var count: Int {
        return catalogList.count
    }
    
    func CatalogAt(index: Int) -> String {
        return catalogList[index]
    }
}
