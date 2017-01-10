//
//  SummaryAnimationController.swift
//  AppsShowcase
//
//  Created by Rafael Amezquita on 9/01/17.
//  Copyright © 2017 Rafael Amezquita. All rights reserved.
//

import UIKit

class SummaryAnimationController: NSObject, UIViewControllerAnimatedTransitioning {
    
    func transitionDuration(using transitionContext: UIViewControllerContextTransitioning?) -> TimeInterval {
        return 1.0
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
        
        presentController(fromPresenter: currentView, presented: destinationView, transitionContext: transitionContext)
    }
    
    private func presentController(fromPresenter presenter:UIView, presented:UIView, transitionContext:UIViewControllerContextTransitioning) {
        
        presented.frame = CGRect(origin: CGPoint(x: 0,
                                                 y: -presenter.frame.size.height),
                                 size: presenter.frame.size)
        
        UIView.animateKeyframes(withDuration: transitionDuration(using: transitionContext), delay: 0, options: .beginFromCurrentState, animations: {
            
            UIView.addKeyframe(withRelativeStartTime: 0.0, relativeDuration: 0.5, animations: {
                
                presented.frame = CGRect(origin: CGPoint(x: 0,
                                                               y: 0),
                                               size: presenter.frame.size)
                
            })
            
            UIView.addKeyframe(withRelativeStartTime: 0.5, relativeDuration: 0.6, animations: {
                
                presented.frame = CGRect(origin: CGPoint(x: 0,
                                                               y: -10),
                                               size: presenter.frame.size)
            })
            
            UIView.addKeyframe(withRelativeStartTime: 0.6, relativeDuration: 1.0, animations: {
                
                presented.frame = CGRect(origin: CGPoint(x: 0,
                                                               y: 0),
                                               size: presenter.frame.size)
            })
            
        }, completion: {
            _ in
            
            transitionContext.completeTransition(!transitionContext.transitionWasCancelled)
        })
    }

}
