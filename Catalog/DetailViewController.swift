//
//  DetailViewController.swift
//  Catalog
//
//  Created by sdt5 on 2015. 10. 26..
//  Copyright © 2015년 tacademy. All rights reserved.
//

import UIKit

class DetailViewController: UIViewController {

    var itemName: String!
    
    @IBOutlet weak var webView: UIWebView!
    
    override func viewWillAppear(animated: Bool) {
        if let url = NSURL(string: "https://en.wikipedia.org/wiki/\(itemName)") {
            let request = NSURLRequest(URL: url)
            self.webView.loadRequest(request)
        }
        else {
            print("URL 에러")
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
}
