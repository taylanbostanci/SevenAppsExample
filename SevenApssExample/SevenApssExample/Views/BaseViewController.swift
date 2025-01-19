//
//  BaseViewController.swift
//  SevenApssExample
//
//  Created by ENQURA on 19.01.2025.
//

import UIKit
import SnapKit
import Foundation

class BaseViewController: UIViewController {
    var customNavBar: UINavigationBar!
    var navItem: UINavigationItem!
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    func showAlert(message: String) {
        let alert = UIAlertController(title: "Error", message: message, preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "OK", style: .default))
        present(alert, animated: true)
    }
}
