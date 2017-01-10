//
//  SummaryDismissAnimationController.swift
//  AppsShowcase
//
//  Created by Rafael Amezquita on 9/01/17.
//  Copyright © 2017 Rafael Amezquita. All rights reserved.
//

import UIKit

class SummaryDismissAnimationController: NSObject, UIViewControllerAnimatedTransitioning {
    
    func transitionDuration(using transitionContext: UIViewControllerContextTransitioning?) -> TimeInterval {
        return 3.0
    }
    
    func animateTransition(using transitionContext: UIViewControllerContextTransitioning) {
        
        guard let currentController = transitionContext.viewController(forKey: .from),
            let destinationController = transitionContext.viewController(forKey: .to) else {
                return
        }
        
        let containerView = transitionContext.containerView
        let destinationView = destinationController.view!
        let currentView = currentController.view!
        
        containerView.addSubview(currentView)
        containerView.addSubview(destinationView)
        
        currentView.alpha = 1.0
        
        UIView.animate(withDuration: transitionDuration(using: transitionContext), animations: {
            currentView.alpha = 0.0
        }, completion: {
            _ in
            transitionContext.completeTransition(true)
        })
    }
}
