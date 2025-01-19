//
//  ViewController.swift
//  SevenApssExample
//
//  Created by TaylanBostanci on 19.01.2025.
//

import SnapKit

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
        bindViewModel()
        viewModel.fetchUsers()
    }
    
    func bindViewModel() {
          viewModel.onUsersUpdated = { [weak self] in
              DispatchQueue.main.async {
                  self?.userTableView.reloadData()
              }
          }
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
        return viewModel.users.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "UserTableViewCell", for: indexPath) as? UserTableViewCell else {
            return UITableViewCell()
        }
        
        let user = viewModel.users[indexPath.row]
        cell.configure(with: user)
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        let selectedUserModel = viewModel.users[indexPath.row]
        
        let detailViewController = UserDetailViewController(userModel: selectedUserModel)
        navigateTo(detailViewController)
    }
}
