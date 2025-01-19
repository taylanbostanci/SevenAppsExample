//
//  BaseViewController.swift
//  SevenApssExample
//
//  Created by TaylanBostanci on 19.01.2025.
//

import SnapKit

class BaseViewController: UIViewController {
    let localizer = LocalizableUtils.shared
    
    private var loadingView: UIView!
    private var loadingIndicator: UIActivityIndicatorView!

    var customNavBar: UINavigationBar!
    var navItem: UINavigationItem!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupLoadingView()
        setupNavBar()
    }
    
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
    
    private func setupNavBar() {
        customNavBar = UINavigationBar()
        view.addSubview(customNavBar)
        customNavBar.snp.makeConstraints { make in
            make.top.equalTo(view.safeAreaLayoutGuide.snp.top)
            make.leading.trailing.equalToSuperview()
            make.height.equalTo(44)
        }
        
        navItem = UINavigationItem(title: "")
        navItem.leftBarButtonItem = UIBarButtonItem(
            title: localizer.stringForKey(key: LocalizableUtils.Strings.back.rawValue),
            style: .plain,
            target: self,
            action: #selector(dismissViewController)
        )
        customNavBar.setItems([navItem], animated: false)
    }
    
    func navigateTo(_ viewController: UIViewController, animated: Bool = true) {
        viewController.modalPresentationStyle = .fullScreen
        present(viewController, animated: animated, completion: nil)
    }
    
    @objc private func dismissViewController() {
        if let navigationController = navigationController {
            navigationController.popViewController(animated: true)
        } else {
            dismiss(animated: true, completion: nil)
        }
    }
    
    func showAlert(message: String) {
        let alert = UIAlertController(title: localizer.stringForKey(key: LocalizableUtils.Strings.error.rawValue), message: message, preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: localizer.stringForKey(key: LocalizableUtils.Strings.ok.rawValue), style: .default))
        present(alert, animated: true)
    }
}
