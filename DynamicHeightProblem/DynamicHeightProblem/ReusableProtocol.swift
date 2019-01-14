//
//  ReusableProtocol.swift
//  DynamicHeightProblem
//
//  Created by Jiar on 2019/1/14.
//  Copyright © 2019 Jiar. All rights reserved.
//

import UIKit

// MARK: ReusableCell Protocol
public protocol ReusableView: NSObjectProtocol {
    static var cellIdentifier: String {get}
}
public extension ReusableView where Self: UIView {
    public static var cellIdentifier: String {
        return NSStringFromClass(self).components(separatedBy: ".").last!
    }
}

public protocol NibLoadableView: class {
    static var nibName: String { get }
}

public extension NibLoadableView where Self: UIView {
    public static var nibName: String {
        return NSStringFromClass(self).components(separatedBy: ".").last!
    }
    
    public static func loadFromNib(_ owner: AnyObject? = nil) -> Self {
        let bundle = Bundle(for: self)
        let nib = UINib(nibName: self.nibName, bundle: bundle)
        
        guard let view = nib.instantiate(withOwner: owner, options: nil).first as? Self else {
            fatalError("The nib \(nib) expected its root view to be of type \(self)")
        }
        return view
    }
}

// MARK: Extension Cell
//extension UICollectionViewCell: ReusableView {}
extension UITableViewCell: ReusableView, NibLoadableView {}
extension UITableViewHeaderFooterView: ReusableView, NibLoadableView {}
extension UICollectionReusableView: ReusableView, NibLoadableView {}

// MARK: Register Cell
public extension UITableView {
    ///Register cell with class name
    public func register<T: UITableViewCell>(_: T.Type) {
        self.register(T.self, forCellReuseIdentifier: T.cellIdentifier)
    }
    
    ///Register xib with same name
    public func registerNib<T: UITableViewCell>(_: T.Type) {
        let bundle = Bundle(for: T.self)
        let nib = UINib(nibName: T.nibName, bundle: bundle)
        self.register(nib, forCellReuseIdentifier: T.cellIdentifier)
    }
    ///Dequeue Cell
    public func dequeueReusableCell<T: UITableViewCell>(forIndexPath indexPath: IndexPath) -> T {
        
        let cell = self.dequeueReusableCell(withIdentifier: T.cellIdentifier, for: indexPath)
        // swiftlint:disable force_cast
        return cell as! T
        // swiftlint:enable force_case
    }
    ///Register HeaderFooterView
    public func registerHeaderFooter<T: UITableViewHeaderFooterView>(_: T.Type) {
        self.register(T.self, forHeaderFooterViewReuseIdentifier: T.cellIdentifier)
    }
    
    //Register HeaderFooterView
    public func registerNibHeaderFooter<T: UITableViewHeaderFooterView>(_: T.Type) {
        let bundle = Bundle(for: T.self)
        let nib = UINib(nibName: T.nibName, bundle: bundle)
        self.register(nib, forHeaderFooterViewReuseIdentifier: T.cellIdentifier)
    }
    
    ///Dequeue HeaderFooterView
    public func dequeueHeaderFooterView<T: UITableViewHeaderFooterView>(_: T.Type) -> T {
        let view = self.dequeueReusableHeaderFooterView(withIdentifier: T.cellIdentifier)
        // swiftlint:disable force_cast
        return view as! T
        // swiftlint:enable force_cast
    }
    
}

public extension UICollectionView {
    ///Register cell with class name
    public func register<T: UICollectionViewCell>(_: T.Type) {
        self.register(T.self, forCellWithReuseIdentifier: T.cellIdentifier)
    }
    
    ///Register xib with same name
    public func registerNib<T: UICollectionViewCell>(_: T.Type) {
        let bundle = Bundle(for: T.self)
        let nib = UINib(nibName: T.nibName, bundle: bundle)
        self.register(nib, forCellWithReuseIdentifier: T.cellIdentifier)
    }
    ///Dequeue Cell
    public func dequeueReusableCell<T: UICollectionViewCell>(forIndexPath indexPath: IndexPath) -> T {
        let cell = self.dequeueReusableCell(withReuseIdentifier: T.cellIdentifier, for: indexPath)
        // swiftlint:disable force_cast
        return cell as! T
        // swiftlint:enable force_cast
    }
    
    ///Register SupplementaryView
    public func register<T: UICollectionReusableView>(_: T.Type, forSupplementaryViewOfKind kind: String) {
        self.register(T.self, forSupplementaryViewOfKind: kind, withReuseIdentifier: T.cellIdentifier)
    }
    
    ///Register SupplementaryView
    public func registerNib<T: UICollectionReusableView>(_: T.Type, forSupplementaryViewOfKind kind: String) {
        let bundle = Bundle(for: T.self)
        let nib = UINib(nibName: T.nibName, bundle: bundle)
        
        self.register(nib, forSupplementaryViewOfKind: kind, withReuseIdentifier: T.cellIdentifier)
    }
    
    ///Dequeue SupplementaryView
    public func dequeueSupplementaryViewOfKind<T: UICollectionReusableView>(_ elementKind: String, forIndexPath: IndexPath) -> T {
        // swiftlint:disable force_cast line_length
        let view = self.dequeueReusableSupplementaryView(ofKind: elementKind, withReuseIdentifier: T.cellIdentifier, for: forIndexPath) as! T
        // swiftlint:enable force_cast line_length
        return view
    }
    
}
