//
//  CategoriesTableViewController.swift
//  AppsShowcase
//
//  Created by Rafael Amezquita on 7/01/17.
//  Copyright © 2017 Rafael Amezquita. All rights reserved.
//

import UIKit
import SVProgressHUD
import SDWebImage

class CategoriesTableViewController: UIViewController {

    @IBOutlet weak var categoriesTable:UITableView?
    
    fileprivate let reuseIdentifier = "CategoriesTableViewCell"
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        registerCategoryClass()
    }
    
    private func registerCategoryClass() {
        guard let table = categoriesTable else {
            return
        }
        
        table.register(UINib(nibName: "CategoriesTableViewCell", bundle: nil), forCellReuseIdentifier: reuseIdentifier)
    }
    
}

extension CategoriesTableViewController: UITableViewDataSource {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return CacheManager.sharedInstance.categories.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: reuseIdentifier, for: indexPath) as! CategoriesTableViewCell
        
        let category = CacheManager.sharedInstance.categories[indexPath.row]
        cell.configureCategoryCell(withTitle: category.name!, imageURL: category.imageURL!)
        
        return cell
    }
}

extension CategoriesTableViewController: UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        let url = CacheManager.sharedInstance.categories[indexPath.row].url!
        presentCategories(fromURL: url)
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return CategoriesTableViewCell.cellHeight()
    }
    
    func tableView(_ tableView: UITableView, willDisplay cell: UITableViewCell, forRowAt indexPath: IndexPath) {
        AnimationManager.slideUpDownTableViewCell(cell, tableView: tableView)
    }
    
    private func presentCategories(fromURL url:String) {
     
        SVProgressHUD.show()
        
        ShowcaseFacade.productResponse(fromURL:url ) { [weak self] response in
            
            guard let categories = response else {
                return
            }
            
            guard let weakself = self else {
                return
            }
            
            guard let weakStoryboard = weakself.storyboard else {
                return
            }
            
            CacheManager.sharedInstance.appsList = categories
            
            SVProgressHUD.dismiss()
            
            let productsController = weakStoryboard.instantiateViewController(withIdentifier: "AppsListCollectionViewController")
            weakself.present(productsController, animated: true, completion: nil)
        }
    }

}
