//
//  ItemTableViewCell.swift
//  DynamicHeightProblem
//
//  Created by Jiar on 2019/1/14.
//  Copyright © 2019 Jiar. All rights reserved.
//

import UIKit

class ItemTableViewCell: UITableViewCell {

    @IBOutlet private weak var titleLabel: UILabel!
    
    func config(_ title: String) {
        titleLabel.text = title
    }
    
}
