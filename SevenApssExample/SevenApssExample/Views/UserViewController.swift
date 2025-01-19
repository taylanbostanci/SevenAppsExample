//
//  ViewController.swift
//  SevenApssExample
//
//  Created by TaylanBostanci on 19.01.2025.
//

import UIKit

class UserViewController: BaseViewController {
    
    // MARK: - UI Elements
    private let userTableView = UITableView()
    
    //MARK: - Properties
    private let viewModel = UserViewModel()
    
    // MARK: - Lifecycle Methods
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
        setupTableView()
    }

    // MARK: - UI Configure Methods
    private func setupUI() {
        view.backgroundColor = .white
        view.addSubview(userTableView)
        
        userTableView.snp.makeConstraints { make in
            make.edges.equalToSuperview()
        }
    }
    
    func setupTableView() {
        userTableView.registerNib(cellType: UserTableViewCell.self)
        userTableView.delegate = self
        userTableView.dataSource = self
    }

}

// MARK: - UITableViewDelegate
extension UserViewController: UITableViewDelegate,UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        return UITableViewCell()
    }
}
