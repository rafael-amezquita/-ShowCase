//
//  AppsListCollectionViewController.swift
//  AppsShowcase
//
//  Created by Rafael Amezquita on 6/01/17.
//  Copyright © 2017 Rafael Amezquita. All rights reserved.
//

import UIKit

private let reuseIdentifier = "ProductCollectionViewCell"

class AppsListCollectionViewController: UIViewController {

    @IBOutlet weak var productCollectionView:UICollectionView?
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    @IBAction func returnToMenu(sender:UIButton) {
        let menuController = self.storyboard?.instantiateViewController(withIdentifier: "CategoriesTableViewController")
        menuController?.transitioningDelegate = self
        self.present(menuController!, animated: true, completion: nil)
    }
    
    @IBAction func onSummary(sender: UIButton) {
        let summary = storyboard?.instantiateViewController(withIdentifier: "SummaryViewController")
        summary?.transitioningDelegate = self
        self.present(summary!, animated: true, completion: nil)
    }
}

extension AppsListCollectionViewController: UICollectionViewDataSource {
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        
        return 1
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        
        return CacheManager.sharedInstance.appsList.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: reuseIdentifier, for: indexPath) as! ProductCollectionViewCell
        let product =  CacheManager.sharedInstance.appsList[indexPath.row] as Product
        cell.configureCell(withTitle: product.title!, image: product.image!)
        
        return cell
    }
}

extension AppsListCollectionViewController: UICollectionViewDelegate {
    
    func collectionView(_ collectionView: UICollectionView, willDisplay cell: UICollectionViewCell, forItemAt indexPath: IndexPath) {
        
        AnimationManager.slideUpDownCollectionViewCell(cell, tableView: collectionView)
    }
}

extension AppsListCollectionViewController: UIViewControllerTransitioningDelegate {
    
    func animationController(forPresented presented: UIViewController, presenting: UIViewController, source: UIViewController) -> UIViewControllerAnimatedTransitioning? {
        
        let animationController = presented.isKind(of: SummaryViewController.self) ? SummaryAnimationController() : CategoriesAnimationController()
        
        return animationController as? UIViewControllerAnimatedTransitioning
    }
}
