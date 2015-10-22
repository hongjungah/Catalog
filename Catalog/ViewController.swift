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
    var cartList = [String]()
    
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
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func numberOfSectionsInTableView(tableView: UITableView) -> Int
    {
        return 2
    }
    
    func tableView(tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        switch section {
        case 0:
            return "Catalog"
        case 1:
            return "Cart"
        default:
            return ""
        }
    }
    
    func addCart(productCode: String) {
        cartList.insert(data[Int(productCode)!], atIndex: cartList.count)
        tableView.reloadData()
        
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if section == 0 {
            return data.count
        }
        else {
            return cartList.count
        }
    }

    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        
        if indexPath.section == 0 {
            let cell = tableView.dequeueReusableCellWithIdentifier("PRODUCT_CELL", forIndexPath: indexPath) as! ProductCell
        
            let itemName = data[indexPath.row]
            print(itemName)
        
            cell.productName.text = itemName
            let image = UIImage(named: "\(itemName).png")
            cell.productImage.image = image
            cell.productPrice.text = "\(indexPath.row+1)00"
        
            let code = indexPath.row.description
            cell.productCode = code

            cell.delegate = self
            
            return cell
        }
        else {
            let cell = tableView.dequeueReusableCellWithIdentifier("CART_CELL", forIndexPath: indexPath)
        
            cell.textLabel?.text = cartList[cartList.count-indexPath.row-1]
        
            return cell
        }
    }
}

