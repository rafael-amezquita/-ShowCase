//
//  CategoriesTableViewCell.swift
//  AppsShowcase
//
//  Created by Rafael Amezquita on 8/01/17.
//  Copyright © 2017 Rafael Amezquita. All rights reserved.
//

import UIKit

class CategoriesTableViewCell: UITableViewCell {

    @IBOutlet weak var categoryLabel:UILabel?
    @IBOutlet weak var categoryImageView:UIImageView?
    
    static func cellHeight() -> CGFloat {
        return CGFloat(142)
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
    }
    
    func configureCategoryCell(withTitle title:String, imageURL:String) {
        
        guard let cellTitle = categoryLabel else {
            return
        }
        
        cellTitle.text = title
     
        guard let imageView = categoryImageView else {
            return
        }
        
        let url = URL(string: imageURL)!
        imageView.sd_setImage(with: url)
    }
    
}
