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
    
    static func productResponse(fromURL url:String, handler:@escaping ([Product]?)->()) {
        ShowcaseFacade.entriesResponse(fromURL: url) { jsonResponse in
            guard let response = jsonResponse else {
                handler(nil)
                return
            }
            
            let feed = response["feed"] as! [String: AnyObject]
            let appNamesList = product(fromEntries: feed["entry"] as! [AnyObject])
            
            handler(appNamesList)
        }
    }
    
    // MARK: - private
    
    private static func entriesResponse(fromURL url:String, handler:@escaping ([String: AnyObject]?)->()) {
        Alamofire.request(url).responseJSON { response in
            
            if response.result.value == nil {
                handler(nil)
                return
            }
            
            handler(response.result.value as? [String : AnyObject])
        }
    }
    
    // MARK: - product parsing
    
    private static func product(fromEntries entries:[AnyObject]) -> [Product] {
        var products = [Product]()
        for (_, value) in entries.enumerated() {
            let entry = value as! [String: AnyObject]
            
            //getting title
            let title = entry["title"] as! [String: AnyObject]
            let label = "\(title["label"]!)"
            
            //getting image
            let imagesList = entry["im:image"]
            let biggestImage = (imagesList as! [AnyObject]).last
            let imageURL =  "\((biggestImage as! [String: AnyObject])["label"]!)"
            
            //getting category
            let category = entry["category"]!
            let attributes = category["attributes"] as! [String: AnyObject]
            let categoryTerm = attributes["term"] as! String
            
            let currentApp = Product(withTitle: label, imageURL:imageURL, summary: "", category:categoryTerm)
            products.append(currentApp)
        }
        
        return products
    }
}
