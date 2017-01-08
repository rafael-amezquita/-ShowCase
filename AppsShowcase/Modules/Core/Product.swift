//
//  Product.swift
//  AppsShowcase
//
//  Created by Rafael Amezquita on 7/01/17.
//  Copyright © 2017 Rafael Amezquita. All rights reserved.
//

import UIKit

struct Product {
    
    var title:String?
    var image:UIImage?
    var summary:String?
    var category:String?
    
    init(withTitle title:String?, imageURL:String?, summary:String?, category:String?) {
        
        self.title = title
        self.summary = summary
        self.category = category
        
        guard let stringUrl = imageURL else {
            return
        }
        
        let data = NSData(contentsOf: URL(string:stringUrl)!)
        self.image = UIImage(data: (data as? Data)!)
    }
}
