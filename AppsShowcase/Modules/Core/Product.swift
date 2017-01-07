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
    
    init(withTitle title:String?, imageURL:String?, summary:String?) {
        let data = NSData(contentsOf: NSURL(string:imageURL!) as! URL)
        self.title = title
        //TODO: Do this in background
        self.image = UIImage(data: (data as? Data)!)
        self.summary = summary!
    }
}
