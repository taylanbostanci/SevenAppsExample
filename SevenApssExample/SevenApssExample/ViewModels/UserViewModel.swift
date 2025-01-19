//
//  ViewModel.swift
//  SevenApssExample
//
//  Created by TaylanBostanci on 19.01.2025.
//

import Foundation

final class UserViewModel {
    
    //MARK: - Properties
    private let userRepository: UserRepository
    private(set) var users: [UserResponseModel] = []
    
    //MARK: - Typealias for callback closures
    typealias UsersUpdatedCallback = () -> Void
    typealias ErrorOccurredCallback = (Error) -> Void
    
    //MARK: - Bindable properties for UI updates
    var onUsersUpdated: UsersUpdatedCallback?
    var onErrorOccurred: ErrorOccurredCallback?
    
    init(userRepository: UserRepository = UserRepository()) {
        self.userRepository = userRepository
    }
    
    //MARK: - Fetch users and update the UI
    func fetchUsers() {
        userRepository.fetchUsers { [weak self] result in
            switch result {
            case .success(let users):
                self?.users = users
                self?.onUsersUpdated?()
            case .failure(let error):
                self?.onErrorOccurred?(error) // Notify UI to show error
            }
        }
    }
}
