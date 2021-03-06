//
//  NormalViewController.swift
//  DynamicHeightProblem
//
//  Created by Jiar on 2019/1/14.
//  Copyright © 2019 Jiar. All rights reserved.
//

import UIKit

class NormalViewController: UITableViewController {

    init() {
        super.init(nibName: nil, bundle: nil)
        title = "Normal"
        tabBarItem = UITabBarItem(title: "Normal", image: nil, selectedImage: nil)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.registerNib(ItemTableViewCell.self)
        tableView.registerNibHeaderFooter(ItemHeaderFooterView.self)
        tableView.rowHeight = UITableView.automaticDimension
        tableView.estimatedRowHeight = 50
        tableView.sectionHeaderHeight = UITableView.automaticDimension
        tableView.estimatedSectionHeaderHeight = 20
        tableView.sectionFooterHeight = UITableView.automaticDimension
        tableView.estimatedSectionFooterHeight = 20
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
        let header = tableView.dequeueHeaderFooterView(ItemHeaderFooterView.self)
        header.config(DataManager.shared.titlesForHeaderFooter[section].0, isHeader: true)
        return header
    }
    
    override func tableView(_ tableView: UITableView, viewForFooterInSection section: Int) -> UIView? {
        let footer = tableView.dequeueHeaderFooterView(ItemHeaderFooterView.self)
        footer.config(DataManager.shared.titlesForHeaderFooter[section].1, isHeader: false)
        return footer
    }

}
