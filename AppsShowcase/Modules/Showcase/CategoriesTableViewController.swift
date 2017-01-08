//
//  CategoriesTableViewController.swift
//  AppsShowcase
//
//  Created by Rafael Amezquita on 7/01/17.
//  Copyright © 2017 Rafael Amezquita. All rights reserved.
//

import UIKit

private let reuseIdentifier = "CategoryCell"

class CategoriesTableViewController: UIViewController {

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
            textField.text = CacheManager.sharedInstance.categories[indexPath.row]
        }

        return cell
    }
}

extension CategoriesTableViewController: UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        guard let wrappedStoryboard = storyboard else {
            return
        }
        
        let productsList = wrappedStoryboard.instantiateViewController(withIdentifier: "AppsListCollectionViewController")
        self.present(productsList, animated: true, completion: nil)
    }

}
