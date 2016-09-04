//
//  MenuCell.swift
//  ClosingCostCalculator
//
//  Created by Chris Wong on 2016-07-28.
//  Copyright © 2016 Chris Wong. All rights reserved.
//

import UIKit

class MenuCell: BaseCell {
    
    let imageView: UIImageView = {
        let iv = UIImageView()
        iv.image = UIImage(named: "home")?.imageWithRenderingMode(.AlwaysTemplate)
        iv.tintColor = UIColor.rgb(91, green: 14, blue: 13)
        return iv
    }()
    
    override var highlighted: Bool {
        didSet {
            imageView.tintColor = highlighted ? UIColor.whiteColor() : UIColor.rgb(91, green: 14, blue: 13)
        }
    }
    
    override var selected: Bool {
        didSet {
            imageView.tintColor = selected ? UIColor.whiteColor() : UIColor.rgb(91, green: 14, blue: 13)
        }
    }
    
    override func setupViews() {
        super.setupViews()
        
        addSubview(imageView)
        addConstraintsWithFormat("H:[v0(28)]", views: imageView)
        addConstraintsWithFormat("V:[v0(28)]", views: imageView)
        
        addConstraint(NSLayoutConstraint(item: imageView, attribute: .CenterX, relatedBy: .Equal, toItem: self, attribute: .CenterX, multiplier: 1, constant: 0))
        addConstraint(NSLayoutConstraint(item: imageView, attribute: .CenterY, relatedBy: .Equal, toItem: self, attribute: .CenterY, multiplier: 1, constant: 0))
    }
    
}
