//
//  requestController.swift
//  Catalog
//
//  Created by 홍정아 on 2015. 10. 28..
//  Copyright © 2015년 tacademy. All rights reserved.
//

import Foundation
import Alamofire
import SwiftyJSON

class RequestManager {
    
    let manager: Manager
    
    static var sharedManger = RequestManager()
    
    init() {
        var defaultHeaders = Manager.sharedInstance.session.configuration.HTTPAdditionalHeaders ?? [:]
        defaultHeaders["X-Parse-REST-API-Key"] = "kmFkkCvOVbbYwNjla11W0U4Lwm1iOvkcOnR6v0Ob"
        defaultHeaders["X-Parse-Application-Id"] = "ajLkM9eoIQ4ddHaGKb9umaQSV9Sx58iOGxRPoRER"
        
        let configuration = NSURLSessionConfiguration.defaultSessionConfiguration()
        configuration.HTTPAdditionalHeaders = defaultHeaders
        manager = Alamofire.Manager(configuration: configuration)
    }
    
    // Parse DB 서버와 통신하여 데이터 저장
    func sendRequestPOST(data: String) {
        
        // JSON Body
        let bodyParameters = [
            "name": data
        ]
        
        let encoding = Alamofire.ParameterEncoding.JSON
        
        // Fetch Request
        manager.request(.POST, "https://api.parse.com/1/classes/CartItem", parameters: bodyParameters, encoding: encoding)
            .validate(statusCode: 200..<300)
            .responseJSON{ response in
                guard response.result.error == nil else {
                    print("Error")
                    return
                }
                print("전송완료")
                print(response.result.value)
        }
    }
    
    // Parse DB 서버와 통신하여 데이터 조회
    func sendRequestGET() {
        
        // Fetch Request
        manager.request(.GET, "https://api.parse.com/1/classes/CartItem").responseJSON{ response in
            let json = JSON(response.result.value!)
            guard response.result.error == nil else {
                return
            }
            CartManager.sharedManger.cartList.removeAll()
            for (_, subJson):(String, JSON) in json["results"] {
                let productName = subJson["name"].stringValue
                CartManager.sharedManger.cartList.append(productName)
            }
            NSNotificationCenter.defaultCenter().postNotificationName("CartChanged", object: nil)
        }
    }
}