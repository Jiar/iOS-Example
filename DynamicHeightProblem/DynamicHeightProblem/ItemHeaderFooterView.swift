//
//  ItemHeaderFooterView.swift
//  DynamicHeightProblem
//
//  Created by Jiar on 2019/1/14.
//  Copyright © 2019 Jiar. All rights reserved.
//

import UIKit

class ItemHeaderFooterView: UITableViewHeaderFooterView {

    @IBOutlet private weak var titleLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        backgroundView = UIView(frame: bounds)
    }
    
    func config(_ title: String, isHeader: Bool) {
        titleLabel.text = title
        if isHeader {
            backgroundView?.backgroundColor = .red
        } else {
            backgroundView?.backgroundColor = .blue
        }
    }

}
