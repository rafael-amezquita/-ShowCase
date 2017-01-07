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
    
    static func fullShowcaseEntries(withHandler:@escaping ([String: Any]?)->()) {
        Alamofire.request("https://itunes.apple.com/us/rss/topfreeapplications/limit=20/json").responseJSON { response in
            
            if response.result.value == nil {
                withHandler(nil)
                return
            }
            
            withHandler(response.result.value as? [String : Any])
        }
    }

}
