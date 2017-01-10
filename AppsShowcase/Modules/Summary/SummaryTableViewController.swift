//
//  SummaryTableViewController.swift
//  AppsShowcase
//
//  Created by Rafael Amezquita on 6/01/17.
//  Copyright © 2017 Rafael Amezquita. All rights reserved.
//

import UIKit

class SummaryViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    @IBAction func onDismiss(sender: UIButton) {
        
        guard let weakself = storyboard else {
            return
        }
        
        let appsListController = weakself.instantiateViewController(withIdentifier: "AppsListCollectionViewController")
        
        appsListController.transitioningDelegate = self
        self.present(appsListController, animated: true, completion: nil)
    }
}

extension SummaryViewController: UIViewControllerTransitioningDelegate {
    
    func animationController(forPresented presented: UIViewController, presenting: UIViewController, source: UIViewController) -> UIViewControllerAnimatedTransitioning? {
        
        let dismissController = SummaryDismissAnimationController()
        return dismissController
    }
}

