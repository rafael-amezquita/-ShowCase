//
//  CategoriesFacade.swift
//  AppsShowcase
//
//  Created by Rafael Amezquita on 6/01/17.
//  Copyright © 2017 Rafael Amezquita. All rights reserved.
//

import Foundation

class CategoriesFacade {
    
    static func categoriesResponse(withHandler handler:@escaping ([String]?)->()) {
        ShowcaseFacade.fullShowcaseEntries { jsonResponse in
            guard let response = jsonResponse else {
                handler(nil)
                return
            }
            
            let feed = response["feed"] as! [String: Any]
            let entries = feed["entry"] as! [Any]
            var appNamesList = [String]()
            for (_, value) in entries.enumerated() {
                let entry = value as! [String: Any]
                let title = entry["title"] as! [String: Any]
                let label = title["label"]
                appNamesList.append(label as! String)
            }
            
            handler(appNamesList)
        }
    }
}
