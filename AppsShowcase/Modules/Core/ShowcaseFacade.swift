//
//  ShowcaseFacade.swift
//  Showcase
//
//  Created by Rafael Amezquita on 6/01/17.
//  Copyright © 2017 Rafael Amezquita. All rights reserved.
//

import Foundation
import Alamofire

class ShowcaseFacade {
    
    static func categoriesResponse(withHandler handler:@escaping ([Product]?)->()) {
        ShowcaseFacade.entriesResponse { jsonResponse in
            guard let response = jsonResponse else {
                handler(nil)
                return
            }
            
            let feed = response["feed"] as! [String: AnyObject]
            let appNamesList = product(fromEntries: feed["entry"] as! [AnyObject])
            
            handler(appNamesList)
        }
    }
    
    static func productResponse(withHandler handler:@escaping ([Product]?)->()) {
        ShowcaseFacade.entriesResponse { jsonResponse in
            guard let response = jsonResponse else {
                handler(nil)
                return
            }
            
            let feed = response["feed"] as! [String: AnyObject]
            let appNamesList = product(fromEntries: feed["entry"] as! [AnyObject])
            
            handler(appNamesList)
        }
    }
    
    // MARK: - private methods
    
    private static func entriesResponse(withHandler handler:@escaping ([String: AnyObject]?)->()) {
        Alamofire.request("https://itunes.apple.com/us/rss/topfreeapplications/limit=20/json").responseJSON { response in
            
            if response.result.value == nil {
                handler(nil)
                return
            }
            
            handler(response.result.value as? [String : AnyObject])
        }
    }
    
    private static func product(fromEntries entries:[AnyObject]) -> [Product] {
        var products = [Product]()
        for (_, value) in entries.enumerated() {
            let entry = value as! [String: AnyObject]
            let title = entry["title"] as! [String: AnyObject]
            let label = "\(title["label"]!)"
            let imagesList = entry["im:image"]
            let biggestImage = (imagesList as! [AnyObject]).last
            let imageURL =  "\((biggestImage as! [String: AnyObject])["label"]!)"
            
            let currentApp = Product(withTitle: label, imageURL:imageURL, summary: "")
            products.append(currentApp)
        }
        
        return products
    }

}
