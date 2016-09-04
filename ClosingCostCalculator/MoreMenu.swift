//
//  MoreMenu.swift
//  ClosingCostCalculator
//
//  Created by Chris Wong on 2016-07-28.
//  Copyright © 2016 Chris Wong. All rights reserved.
//

import UIKit

class MoreMenu: NSObject {
    
    // MARK: Properties
    
    let blackView = UIView()
    
    let collectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        let cv = UICollectionView(frame: .zero, collectionViewLayout: layout)
        cv.backgroundColor = UIColor.whiteColor()
        return cv
    }()
    
    
    // MARK: Helper functions
    
    func showMenu() {
        
        if let window = UIApplication.sharedApplication().keyWindow {
            // Collection Height
            let height: CGFloat = 200
            
            blackView.backgroundColor = UIColor(white: 0, alpha: 0.5)
            blackView.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(handleDismiss)))
            blackView.frame = window.frame
            
            // Hide the collectionView(W:frame.width, H:200) just below the frame height
            collectionView.frame = CGRectMake(0, window.frame.height, window.frame.width, height)
            
            window.addSubview(blackView)
            window.addSubview(collectionView)
            
            UIView.animateWithDuration(0.5, delay: 0, usingSpringWithDamping: 1, initialSpringVelocity: 1, options: .CurveEaseOut, animations: {
                
                self.blackView.alpha = 1
                
                self.collectionView.frame = CGRectMake(0, window.frame.height - height, self.collectionView.frame.width, self.collectionView.frame.height)
                
                }, completion: nil)
        }
    }
    
    func handleDismiss() {
        UIView.animateWithDuration(0.5, delay: 0, usingSpringWithDamping: 1, initialSpringVelocity: 1, options: .CurveEaseOut, animations: {
            
            self.blackView.alpha = 0
            
            if let window = UIApplication.sharedApplication().keyWindow {
                self.collectionView.frame = CGRectMake(0, window.frame.height, self.collectionView.frame.width, self.collectionView.frame.height)
            }
            
        }) { (completed: Bool) in
            //            if setting.name != "" && setting.name != "Cancel" {
            //                self.homeController?.showControllerForSetting(setting)
            //            }
        }
    }
    
}
