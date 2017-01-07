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
        titleLable?.text = title
        imageView?.image = image
    }

}
