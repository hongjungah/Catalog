//
//  CartCell.swift
//  Catalog
//
//  Created by 홍정아 on 2015. 10. 28..
//  Copyright © 2015년 tacademy. All rights reserved.
//

import UIKit

protocol CartCellDelegate: class {
}

class CartCell: UITableViewCell {
    
    weak var delegate: CartCellDelegate!
    
    var productCode: String!
    
    @IBOutlet weak var productImage: UIImageView!
    @IBOutlet weak var productName: UILabel!
    @IBOutlet weak var productPrice: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        
        // Configure the view for the selected state
    }
    
}
