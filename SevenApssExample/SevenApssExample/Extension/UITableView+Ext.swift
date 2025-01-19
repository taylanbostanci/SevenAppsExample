//
//  UITableView+Ext.swift
//  SevenApssExample
//
//  Created by ENQURA on 19.01.2025.
//

import UIKit

extension UITableView {
    func registerNib<T: UITableViewCell>(cellType: T.Type) {
        let nib = UINib(nibName: String(describing: cellType), bundle: nil)
        self.register(nib, forCellReuseIdentifier: String(describing: cellType))
    }
}
