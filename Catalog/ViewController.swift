//
//  ViewController.swift
//  Catalog
//
//  Created by sdt5 on 2015. 10. 22..
//  Copyright © 2015년 tacademy. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITableViewDataSource, ProductCellDelegate {

    var data: [String]!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        data = ["baseball",
            "basketball",
            "football",
            "golf",
            "rugby",
            "shuttlecock",
            "tennis",
            "volleyball",
            "tennis",
            "iceHockey",
            "billiard"
        ]
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func addCart(productCode: String) {
        print("\(productCode)")
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return data.count
    }

    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("PRODUCT_CELL", forIndexPath: indexPath) as! ProductCell
        
        let itemName = data[indexPath.row]
        print(itemName)
        
        cell.productName.text = itemName
        let image = UIImage(named: "\(itemName).png")
        cell.productImage.image = image
        cell.productPrice.text = "\(indexPath.row+1)00"
        
        cell.delegate = self
        
        return cell
    }
}

