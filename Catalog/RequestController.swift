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

class RequestController {
    
    static var sharedManger = RequestController()
    
    func sendRequestPOST(data: String) {
        
        // My API (2) (POST https://api.parse.com/1/classes/CartItem)
        
        // Add Headers
        let headers = [
            "X-Parse-REST-API-Key":"yUTg4RLJUqe94VEcu9IF1oZdge0rlu4weJ5qwOoa",
            "X-Parse-Application-Id":"14YKmKugroOhNGY9Jf8X4a8EiUqBL3hsB8TvbzL0",
            "Content-Type":"application/json"
        ]

        
        // JSON Body
        let bodyParameters = [
            "name": data
        ]
        
        let encoding = Alamofire.ParameterEncoding.JSON
        
        // Fetch Request
        Alamofire.request(.POST, "https://api.parse.com/1/classes/CartItem", parameters: bodyParameters, encoding: encoding, headers: headers)
            .validate(statusCode: 200..<300)
            .responseJSON{ response in
                print("전송완료")
                print(response.result.value)
        }
        sendRequestGET()
    }
    
    func sendRequestGET() -> String() {
    
    let names: String()
    
        // My API (2) (GET https://api.parse.com/1/classes/CartItem)

        // Add Headers
        let headers = [
            "X-Parse-REST-API-Key":"yUTg4RLJUqe94VEcu9IF1oZdge0rlu4weJ5qwOoa",
            "X-Parse-Application-Id":"14YKmKugroOhNGY9Jf8X4a8EiUqBL3hsB8TvbzL0",
        ]
        
        // Fetch Request
        Alamofire.request(.GET, "https://api.parse.com/1/classes/CartItem", headers: headers).responseJSON{ response in
            let json = JSON(response.result.value!)
            let names = json["results"]["name"]
        }
        
    }
}