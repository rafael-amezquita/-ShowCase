//
//  CategoriesAnimationController.swift
//  AppsShowcase
//
//  Created by Rafael Amezquita on 9/01/17.
//  Copyright © 2017 Rafael Amezquita. All rights reserved.
//

import UIKit

class CategoriesAnimationController: NSObject, UIViewControllerAnimatedTransitioning {

    func transitionDuration(using transitionContext: UIViewControllerContextTransitioning?) -> TimeInterval {
        return 3.0
    }
    
    func animateTransition(using transitionContext: UIViewControllerContextTransitioning) {
        
        guard let currentController = transitionContext.viewController(forKey: .from),
            let destinationController = transitionContext.viewController(forKey: .to) as? CategoriesTableViewController else {
                return
        }
        
        let containerView = transitionContext.containerView
        let destinationTableView = destinationController.categoriesTable!
        let destinationView = destinationController.view!
        let currentView = currentController.view!
        
        containerView.addSubview(currentView)
        containerView.addSubview(destinationView)
        
        currentView.alpha = 1
        destinationView.frame = CGRect(origin: CGPoint(x: -currentView.frame.size.width,
                                                       y: currentView.frame.origin.y),
                                       size: currentView.frame.size)
        destinationTableView.alpha = 0
        
        UIView.animateKeyframes(withDuration: transitionDuration(using: transitionContext), delay: 0, options: .beginFromCurrentState, animations: {
            
            UIView.addKeyframe(withRelativeStartTime: 0.0, relativeDuration: 0.3, animations: {
                
                destinationView.frame = CGRect(origin: CGPoint(x: 0,
                                                               y: currentView.frame.origin.y),
                                               size: currentView.frame.size)
                
                currentView.frame = CGRect(origin: CGPoint(x: currentView.frame.size.width,
                                                           y: currentView.frame.origin.y),
                                           size: currentView.frame.size)
            })
            
            UIView.addKeyframe(withRelativeStartTime: 0.4, relativeDuration: 1.0, animations: {
                
                destinationTableView.alpha = 1
            })
            
        }, completion: {
            _ in
            
            transitionContext.completeTransition(!transitionContext.transitionWasCancelled)
        })
    }
}
