//
//  ViewController.swift
//  ClosingCostCalculator
//
//  Created by Chris Wong on 2016-07-23.
//  Copyright © 2016 Chris Wong. All rights reserved.
//

import UIKit

class HomeController: UIViewController, UICollectionViewDataSource, UICollectionViewDelegate, UICollectionViewDelegateFlowLayout {

    @IBOutlet var menuBarView: UIView!
    @IBOutlet var dataCollectionView: UICollectionView!
    
    lazy var menuBar: MenuBar = {
        let mb = MenuBar()
        mb.homeController = self
        return mb
    }()

    let moreMenu: MoreMenu = {
        let mM = MoreMenu()
        return mM
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        setupNavigationBar()
        setupMenuBar()
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    // MARK: Setup Functions
    func setupNavigationBar() {
        self.navigationController?.navigationBar.translucent = true
    }

    func setupMenuBar() {
        menuBarView.addSubview(menuBar)
        view.addConstraintsWithFormat("H:|[v0]|", views: menuBar)
        view.addConstraintsWithFormat("V:|[v0]|", views: menuBar)

    }
    
    
    // MARK: Helper Functions
    
    func scrollToMenuIndex(menuIndex: Int){
        let indexPath = NSIndexPath(forItem: menuIndex, inSection: 0)
        dataCollectionView.scrollToItemAtIndexPath(indexPath, atScrollPosition: .None, animated: true)
    }
    
    // MARK: UICollectionViewDataSource
    func numberOfSectionsInCollectionView(collectionView: UICollectionView) -> Int {
        return 1
    }
    
    func collectionView(collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 4
    }
    
    func collectionView(collectionView: UICollectionView, cellForItemAtIndexPath indexPath: NSIndexPath) -> UICollectionViewCell {
        
        let cell = collectionView.dequeueReusableCellWithReuseIdentifier("cellId", forIndexPath: indexPath)
        
        let colors: [UIColor] = [.blueColor(), .greenColor(), .redColor(), .purpleColor()]
        
        cell.backgroundColor = colors[indexPath.item]
        return cell
    }
    
    // MARK: UICollectionViewDelegate
    func collectionView(collectionView: UICollectionView, didSelectItemAtIndexPath indexPath: NSIndexPath) {
        print(indexPath.item)
    }
    
    func scrollViewDidScroll(scrollView: UIScrollView) {
        // Move the horizontal bar based on the horizontal scroll
        menuBar.horizontalBarLeftAnchorConstraint?.constant = scrollView.contentOffset.x / 4
    }
    
    func scrollViewWillEndDragging(scrollView: UIScrollView, withVelocity velocity: CGPoint, targetContentOffset: UnsafeMutablePointer<CGPoint>) {
        // Find menu cell after the user finished scrolling
        let index = targetContentOffset.memory.x / view.frame.width
        
        let indexPath = NSIndexPath(forItem: Int(index), inSection: 0)
        
        menuBar.collectionView.selectItemAtIndexPath(indexPath, animated: true, scrollPosition: .None)
    }
    
    
    // MARK: UICollectionViewDelegateFlowLayout
    
    func collectionView(collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAtIndexPath indexPath: NSIndexPath) -> CGSize {
        
        return CGSizeMake(view.frame.width, view.frame.height)
    }
    
    func collectionView(collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAtIndex section: Int) -> CGFloat {
        return 0
    }

    
    @IBAction func moreButton(sender: AnyObject) {
        moreMenu.showMenu()
    }
    
    
}

