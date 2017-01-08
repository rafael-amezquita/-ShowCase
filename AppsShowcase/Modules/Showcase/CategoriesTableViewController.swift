//
//  CategoriesTableViewController.swift
//  AppsShowcase
//
//  Created by Rafael Amezquita on 7/01/17.
//  Copyright © 2017 Rafael Amezquita. All rights reserved.
//

import UIKit

class CategoriesTableViewController: UIViewController {

    fileprivate let reuseIdentifier = "CategoryCell"
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
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
        let cell = tableView.dequeueReusableCell(withIdentifier: reuseIdentifier, for: indexPath)
        
        if let textField = cell.textLabel {
            textField.text = CacheManager.sharedInstance.categories[indexPath.row].name
            print("name = \(CacheManager.sharedInstance.categories[indexPath.row].name)")
        }

        return cell
    }
}

extension CategoriesTableViewController: UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        let url = CacheManager.sharedInstance.categories[indexPath.row].url!
        presentCategories(fromURL: url)
    }
    
    private func presentCategories(fromURL url:String) {
     
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
            
            let productsController = weakStoryboard.instantiateViewController(withIdentifier: "AppsListCollectionViewController")
            weakself.present(productsController, animated: true, completion: nil)
        }
    }

}
