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
    
    private static func fullShowcaseEntries(withHandler:@escaping ([String: Any]?)->()) {
        Alamofire.request("https://itunes.apple.com/us/rss/topfreeapplications/limit=20/json").responseJSON { response in
            
            if response.result.value == nil {
                withHandler(nil)
                return
            }
            
            withHandler(response.result.value as? [String : Any])
        }
    }
    
    static func categoriesResponse(withHandler handler:@escaping ([Product]?)->()) {
        ShowcaseFacade.fullShowcaseEntries { jsonResponse in
            guard let response = jsonResponse else {
                handler(nil)
                return
            }
            
            let feed = response["feed"] as! [String: Any]
            let entries = feed["entry"] as! [Any]
            var appNamesList = [Product]()
            for (_, value) in entries.enumerated() {
                let entry = value as! [String: Any]
                let title = entry["title"] as! [String: Any]
                let label = "\(title["label"]!)"
                let imagesList = entry["im:image"]
                let biggestImage = (imagesList as! [Any]).last
                let imageURL =  "\((biggestImage as! [String: Any])["label"]!)"
                
                let currentApp = Product(withTitle: label, imageURL:imageURL, summary: "")
                appNamesList.append(currentApp)
            }
            
            handler(appNamesList)
        }
    }

}
