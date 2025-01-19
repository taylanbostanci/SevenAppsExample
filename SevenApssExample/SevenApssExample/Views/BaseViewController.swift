//
//  BaseViewController.swift
//  SevenApssExample
//
//  Created by TaylanBostanci on 19.01.2025.
//

import SnapKit

class BaseViewController: UIViewController {
    
    // MARK: - Properties
    let localizer = LocalizableUtils.shared
    
    // MARK: - UI Elements
    private var loadingView: UIView!
    private var loadingIndicator: UIActivityIndicatorView!
    private var customNavBar: UINavigationBar!
    private var navItem: UINavigationItem!
    
    // MARK: - Lifecycle Methods
    override func viewDidLoad() {
        super.viewDidLoad()
        setupLoadingView()
        setupNavBar()
    }
    
    // MARK: - Setup UI Elements
    private func setupLoadingView() {
        loadingView = UIView(frame: view.bounds)
        loadingView.backgroundColor = .black
        loadingView.isHidden = true
        
        loadingIndicator = UIActivityIndicatorView(style: .large)
        loadingIndicator.color = .white
        loadingView.addSubview(loadingIndicator)
        loadingIndicator.snp.makeConstraints { make in
            make.center.equalToSuperview()
        }
        view.addSubview(loadingView)
    }
    
    func showLoading() {
        DispatchQueue.main.async {
            self.loadingView.isHidden = false
            self.loadingIndicator.startAnimating()
        }
    }
    
    func hideLoading() {
        DispatchQueue.main.async {
            self.loadingView.isHidden = true
            self.loadingIndicator.stopAnimating()
        }
    }
    
    // MARK: - Navigation Bar Configuration
    private func setupNavBar() {
        // Check if the view controller is not the root view controller
        if navigationController?.viewControllers.first != self {
            
            navItem = UINavigationItem()
            
            navItem.leftBarButtonItem = UIBarButtonItem(
                title: localizer.stringForKey(key: LocalizableUtils.Strings.back.rawValue),
                style: .plain,
                target: self,
                action: #selector(backButtonTapped)
            )
        }
    }

    @objc private func backButtonTapped() {
        // Navigate back if the view controller is not the root
        if let navigationController = navigationController {
            navigationController.popViewController(animated: true)
        } else {
            dismiss(animated: true, completion: nil)
        }
    }

    // MARK: - Routing
    func navigateTo(_ viewController: UIViewController, animated: Bool = true) {
        viewController.modalPresentationStyle = .fullScreen
        navigationController?.pushViewController(viewController, animated: true)
    }
    
    // MARK: - UIAlertViewController
    func showAlert(message: String) {
        let alert = UIAlertController(title: localizer.stringForKey(key: LocalizableUtils.Strings.error.rawValue), message: message, preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: localizer.stringForKey(key: LocalizableUtils.Strings.ok.rawValue), style: .default))
        present(alert, animated: true)
    }
}
