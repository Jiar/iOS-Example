//
//  ProblemViewController.swift
//  DynamicHeightProblem
//
//  Created by Jiar on 2019/1/14.
//  Copyright © 2019 Jiar. All rights reserved.
//

import UIKit

class ProblemViewController: UITableViewController {

    init() {
        super.init(nibName: nil, bundle: nil)
        title = "Problem"
        tabBarItem = UITabBarItem(title: "Problem", image: nil, selectedImage: nil)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.registerNib(ItemTableViewCell.self)
        tableView.registerNibHeaderFooter(SeparatorHeaderFooterView.self)
        tableView.rowHeight = UITableView.automaticDimension
        tableView.estimatedRowHeight = 50
        tableView.sectionHeaderHeight = UITableView.automaticDimension
        tableView.estimatedSectionHeaderHeight = 1
        tableView.sectionFooterHeight = UITableView.automaticDimension
        tableView.estimatedSectionFooterHeight = 1
    }
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        return DataManager.shared.titlesForHeaderFooter.count
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return DataManager.shared.titlesForCell.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell: ItemTableViewCell = tableView.dequeueReusableCell(forIndexPath: indexPath)
        cell.config(DataManager.shared.titlesForCell[indexPath.row])
        return cell
    }
    
    override func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let header = tableView.dequeueHeaderFooterView(SeparatorHeaderFooterView.self)
        header.config(true)
        return header
    }
    
    override func tableView(_ tableView: UITableView, viewForFooterInSection section: Int) -> UIView? {
        let footer = tableView.dequeueHeaderFooterView(SeparatorHeaderFooterView.self)
        footer.config(false)
        return footer
    }

}
