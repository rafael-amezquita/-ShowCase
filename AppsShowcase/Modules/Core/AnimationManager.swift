//
//  AnimationManager.swift
//  AppsShowcase
//
//  Created by Rafael Amezquita on 8/01/17.
//  Copyright © 2017 Rafael Amezquita. All rights reserved.
//

import UIKit

class AnimationManager {
    
    static func slideUpDownTableViewCell(_ cell:UITableViewCell, tableView:UITableView) {
        
        guard tableView.visibleCells.contains(cell) == false else {
            return
        }
        
        guard let fisrtVisibleCell = tableView.visibleCells.first else {
            return
        }
        
        guard let lastVisibleCell = tableView.visibleCells.last else {
            return
        }
        
        AnimationManager.slideCell(cell, fisrtVisibleCell:fisrtVisibleCell, lastVisibleCell: lastVisibleCell)
    }
    
    static func slideUpDownCollectionViewCell(_ cell:UICollectionViewCell, tableView:UICollectionView) {
        
        guard tableView.visibleCells.contains(cell) == false else {
            return
        }
        
        guard let fisrtVisibleCell = tableView.visibleCells.first else {
            return
        }
        
        guard let lastVisibleCell = tableView.visibleCells.last else {
            return
        }
        
        AnimationManager.slideCell(cell, fisrtVisibleCell:fisrtVisibleCell, lastVisibleCell: lastVisibleCell)
    }
    
    // MARK: - private
    
    static private func slideCell(_ cell:UIView, fisrtVisibleCell:UIView, lastVisibleCell:UIView) {
        
        var yPos = 0
        if cell.frame.origin.y < fisrtVisibleCell.frame.origin.y{
            yPos = -50
        } else if cell.frame.origin.y > lastVisibleCell.frame.origin.y {
            yPos = 50
        }
        
        cell.layer.shadowColor = UIColor.black.cgColor
        cell.layer.shadowOffset = CGSize(width: 10, height: 10)
        cell.alpha = 0
        
        cell.layer.transform = CATransform3DTranslate(CATransform3DIdentity, 0.0, CGFloat(yPos), 0.0);
        
        UIView.animate(withDuration: 0.8) {
            
            cell.layer.transform = CATransform3DTranslate(CATransform3DIdentity, 0.0, 0.0, 0.0);
            cell.alpha = 1
            cell.layer.shadowOffset = CGSize(width: 0, height: 0)
        }
    }
}
