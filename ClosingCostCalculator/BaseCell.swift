//
//  BaseCell.swift
//  ClosingCostCalculator
//
//  Created by Chris Wong on 2016-07-28.
//  Copyright © 2016 Chris Wong. All rights reserved.
//

import UIKit

class BaseCell: UICollectionViewCell {
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupViews()
    }
    
    func setupViews() {
        
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

