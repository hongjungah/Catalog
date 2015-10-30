//
//  CartCell.swift
//  Catalog
//
//  Created by 홍정아 on 2015. 10. 28..
//  Copyright © 2015년 tacademy. All rights reserved.
//

import UIKit

protocol CartCellDelegate: class {
    func addCart(data: String)
}

class CartCell: UITableViewCell {
    
    weak var delegate: CartCellDelegate!
    
    var productCode: String!
    
    @IBOutlet weak var cartItemName: UILabel!
    
    func addCart(data: String) {
        delegate.addCart(data)
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        
        // Configure the view for the selected state
    }
    
}
