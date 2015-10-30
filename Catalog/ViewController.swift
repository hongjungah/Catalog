//
//  ViewController.swift
//  Catalog
//
//  Created by sdt5 on 2015. 10. 22..
//  Copyright © 2015년 tacademy. All rights reserved.
//

import UIKit
import Alamofire

class ViewController: UIViewController, UITableViewDataSource, ProductCellDelegate {

    var data: [String]!
    
    @IBOutlet weak var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        data = ["baseball",
            "basketball",
            "football",
            "golf",
            "rugby",
            "shuttlecock",
            "pingpong",
            "volleyball",
            "tennis",
            "iceHockey",
            "billiard"
        ]
        
        CatalogManager.sharedManager.catalogList = data
        self.automaticallyAdjustsScrollViewInsets = false
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    // 화면들 간에 데이터 넘기기
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {

        let cell = sender as! UITableViewCell
        let indexPath = tableView.indexPathForCell(cell)!
        let selectedItem  = CatalogManager.sharedManager.CatalogAt(indexPath.row)
        
        let detailVC = segue.destinationViewController as! DetailViewController
        detailVC.itemName = selectedItem
    }
    
    // 테이블뷰 내 색션 개수
    func numberOfSectionsInTableView(tableView: UITableView) -> Int
    {
        return 1
    }
    
    // 테이블뷰 내 색션 타이틀 이름 설정
    func tableView(tableView: UITableView, titleForHeaderInSection section: Int) -> String?
    {
        return "Catalog"
    }
    
    func addCart(productCode: String) {
        
        CartManager.sharedManger.addCart(productCode)
    }
    
    // 테이블뷰 내 섹션에 따른 행 개수
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int
    {
        return CatalogManager.sharedManager.count
    }

    // 테이블뷰 내 섹션에 따른 행 안에 컨텐츠 설정
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCellWithIdentifier("PRODUCT_CELL", forIndexPath: indexPath) as! ProductCell
        
        cell.productName.text = CatalogManager.sharedManager.CatalogAt(indexPath.row)
        let image = UIImage(named: "\(CatalogManager.sharedManager.CatalogAt(indexPath.row)).png")
        cell.productImage.image = image
        cell.productPrice.text = "\(indexPath.row+1)00"
        
        cell.productCode = CatalogManager.sharedManager.CatalogAt(indexPath.row)
        
        cell.delegate = self
        
        return cell

    }
}

