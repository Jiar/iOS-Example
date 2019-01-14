//
//  SeparatorHeaderFooterView.swift
//  DynamicHeightProblem
//
//  Created by Jiar on 2019/1/14.
//  Copyright © 2019 Jiar. All rights reserved.
//

import UIKit

class SeparatorHeaderFooterView: UITableViewHeaderFooterView {

    @IBOutlet private weak var separatorView: UIView!
    
    func config(_ isHeader: Bool) {
        if isHeader {
            separatorView.backgroundColor = .red
        } else {
            separatorView.backgroundColor = .blue
        }
    }
    
}
