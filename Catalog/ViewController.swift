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
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {

        let cell = sender as! UITableViewCell
        let indexPath = tableView.indexPathForCell(cell)!
        let selectedItem  = data[indexPath.row]
        
        let detailVC = segue.destinationViewController as! DetailViewController
        detailVC.itemName = selectedItem
    }
    
    func numberOfSectionsInTableView(tableView: UITableView) -> Int
    {
        return 1
    }
    
    func tableView(tableView: UITableView, titleForHeaderInSection section: Int) -> String?
    {
        return "Catalog"
    }
    
    func addCart(productCode: String) {
        //cartList.insert(data[Int(productCode)!], atIndex: cartList.count)
        //tableView.reloadData()
        let appDelegate = UIApplication.sharedApplication().delegate as! AppDelegate
        appDelegate.shareData = data[Int(productCode)!]
        print(appDelegate.shareData)
        
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int
    {
        return data.count
    }

    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCellWithIdentifier("PRODUCT_CELL", forIndexPath: indexPath) as! ProductCell
        
        let itemName = data[indexPath.row]
        
        cell.productName.text = itemName
        let image = UIImage(named: "\(itemName).png")
        cell.productImage.image = image
        cell.productPrice.text = "\(indexPath.row+1)00"
        
        let code = indexPath.row.description
        cell.productCode = code

        cell.delegate = self
            
        return cell

    }
}

