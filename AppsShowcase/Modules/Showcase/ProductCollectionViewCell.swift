//
//  ProductCollectionViewCell.swift
//  AppsShowcase
//
//  Created by Rafael Amezquita on 7/01/17.
//  Copyright © 2017 Rafael Amezquita. All rights reserved.
//

import UIKit

class ProductCollectionViewCell: UICollectionViewCell {

    @IBOutlet weak var titleLable:UILabel?
    @IBOutlet weak var imageView:UIImageView?
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }
    
    func configureCell(withTitle title:String, image:UIImage) {
        
        guard let label = titleLable else {
            return
        }
        
        guard let productImage = imageView else {
            return
        }
        
        label.text = title
        productImage.image = image
    }

}
