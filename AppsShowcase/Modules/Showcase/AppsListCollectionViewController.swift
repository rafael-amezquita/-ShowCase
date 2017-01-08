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
        self.productCollectionView!.backgroundColor = UIColor.lightGray
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
}

extension AppsListCollectionViewController: UICollectionViewDataSource {
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of items
        return CacheManager.sharedInstance.appsList.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: reuseIdentifier, for: indexPath) as! ProductCollectionViewCell
        let product =  CacheManager.sharedInstance.appsList[indexPath.row] as Product
        cell.configureCell(withTitle: product.title!, image: product.image!)
        // Configure the cell
        cell.backgroundColor = UIColor.white
        return cell
    }
}