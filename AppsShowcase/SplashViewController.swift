//
//  SplashViewController.swift
//  AppsShowcase
//
//  Created by Rafael Amezquita on 6/01/17.
//  Copyright © 2017 Rafael Amezquita. All rights reserved.
//

import UIKit

class SplashViewController: UIViewController {

    // MARK: - init
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setUp()
    }
    
    // MARK: - configuration methods 
    
    private func setUp() {
        ShowcaseFacade.categoriesResponse { [weak self] response in
            
            guard let categories = response else {
                return
            }
            
            CacheManager.sharedInstance.appsList = categories
            
            let categoriesController = self?.storyboard?.instantiateViewController(withIdentifier: "CategoriesTableViewController")
            self?.present(categoriesController!, animated: true, completion: nil)
        }
    }

}
