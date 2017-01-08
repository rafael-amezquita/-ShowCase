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
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        setUp()
    }
    
    // MARK: - configuration methods 
    
    private func setUp() {
        
        CacheManager.sharedInstance.saveCategories { [weak self] in

            guard let weakself = self else {
                return
            }
            
            guard let weakStoryboard = weakself.storyboard else {
                return
            }
            
            print("end loading")
            
            let categoriesController = weakStoryboard.instantiateViewController(withIdentifier: "CategoriesTableViewController")
            weakself.present(categoriesController, animated: true, completion: nil)
        }
    }

}
