//
//  CartViewController.swift
//  Catalog
//
//  Created by sdt5 on 2015. 10. 26..
//  Copyright © 2015년 tacademy. All rights reserved.
//

import UIKit
import SystemConfiguration
import Foundation

class CartViewController: UIViewController, CartCellDelegate {
    
    @IBOutlet weak var tableView: UITableView!
    
    override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(animated)
        
        if isConnectedToNetwork() {
            RequestManager.sharedManger.sendRequestGET()
        }
        else {
            DatabaseManager.sharedManger.selectData()
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        NSNotificationCenter.defaultCenter().addObserver(self, selector: "handlerModelChange", name: "CartChanged", object: nil)
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    // 장바구니 내 물품 추가
    func addCart(data: String) {
        CartManager.sharedManger.addCart(data)
    }
    
    // 장바구니 내 물품 추가 후 테이블 데이터 반영
    func handlerModelChange() {
        tableView.reloadData()
    }
    
    // 테이블뷰 내 섹션 개수
    func numberOfSectionsInTableView(tableView: UITableView) -> Int
    {
        return 1
    }
    
    // 테이블뷰 내 색션 타이틀 이름 설정
    func tableView(tableView: UITableView, titleForHeaderInSection section: Int) -> String?
    {
        return "Cart"
    }
    
    // 테이블뷰 내 섹션에 따른 행 개수
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int
    {
        return CartManager.sharedManger.count
    }

    // 테이블뷰 내 섹션에 따른 행 안에 컨텐츠 설정
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCellWithIdentifier("CART_CELL", forIndexPath: indexPath)
        // 카트
        cell.textLabel?.text = CartManager.sharedManger.CartAt(CartManager.sharedManger.count-indexPath.row-1)

        return cell
    }
    
    // 네트워크 연결 상태 체크
    func isConnectedToNetwork() -> Bool {
        
        var zeroAddress = sockaddr_in(sin_len: 0, sin_family: 0, sin_port: 0, sin_addr: in_addr(s_addr: 0), sin_zero: (0, 0, 0, 0, 0, 0, 0, 0))
        zeroAddress.sin_len = UInt8(sizeofValue(zeroAddress))
        zeroAddress.sin_family = sa_family_t(AF_INET)
        
        let defaultRouteReachability = withUnsafePointer(&zeroAddress) {
            SCNetworkReachabilityCreateWithAddress(kCFAllocatorDefault, UnsafePointer($0))
        }
        
        var flags: SCNetworkReachabilityFlags = SCNetworkReachabilityFlags(rawValue: 0)
        if SCNetworkReachabilityGetFlags(defaultRouteReachability!, &flags) == false {
            return false
        }
        
        let isReachable = flags == .Reachable
        let needsConnection = flags == .ConnectionRequired
        
        return isReachable && !needsConnection
        
    }

}
