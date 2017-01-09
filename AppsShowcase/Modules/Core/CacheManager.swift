//
//  CacheManager.swift
//  AppsShowcase
//
//  Created by Rafael Amezquita on 7/01/17.
//  Copyright © 2017 Rafael Amezquita. All rights reserved.
//

import UIKit
import CoreData

class CacheManager {
    
    static let sharedInstance = CacheManager()
    
    var appsList = [Product]()
    
    lazy var categories:[Category] = {
        return CacheManager.sharedInstance.fetchCategories()
    }()
    
    /* 
        Using Core Data is only for the purpose of this test.
        the same behaviour can be achive using just the .plist file
    */
    func saveCategories(withHandler handler:()->()) {
        
        guard CacheManager.sharedInstance.fetchCategories().count == 0 else {
            handler()
            return
        }
        
        guard let appDelegate = UIApplication.shared.delegate as? AppDelegate else {
            handler()
            return
        }
        
        var categories: NSArray?
        if let path = Bundle.main.path(forResource: "Categories", ofType: "plist") {
            categories = NSArray(contentsOfFile: path)
        }
        
        let managedContext = appDelegate.persistentContainer.viewContext
        
        guard let categoriesList = categories else {
            handler()
            return
        }
        
        for (_, item) in categoriesList.enumerated() {
            let dictionaryItem = item as! [String : String]
            let currentCategory = Category(context: managedContext)

            currentCategory.name = dictionaryItem["name"]!
            currentCategory.url = dictionaryItem["url"]!
            currentCategory.imageURL = dictionaryItem["imageURL"]!
        }
        
        do {
            try managedContext.save()
        } catch let error as NSError {
            print("Could not fetch. \(error), \(error.userInfo)")
        }
        
        handler()
    }
    
    // MARK: - private 
    
    private func fetchCategories() -> [Category] {
        guard let appDelegate = UIApplication.shared.delegate as? AppDelegate else {
            return []
        }
        
        let managedContext = appDelegate.persistentContainer.viewContext
        let fetchRequest:NSFetchRequest<Category> = Category.fetchRequest()
        
        var categories:[Category]?
        do {
            categories = try managedContext.fetch(fetchRequest)
        } catch let error as NSError {
            print("Could not fetch. \(error), \(error.userInfo)")
        }
        
        guard let fetchedCategories = categories else {
            return []
        }
        
        return fetchedCategories
    }
}
