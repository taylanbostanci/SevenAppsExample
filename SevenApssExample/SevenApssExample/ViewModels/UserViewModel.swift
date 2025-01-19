//
//  ViewModel.swift
//  SevenApssExample
//
//  Created by TaylanBostanci on 19.01.2025.
//

import Foundation

final class UserViewModel {
    
    //MARK: - Properties
    private(set) var users: [UserResponseModel] = []
    
    //MARK: - Typealias for callback closures
    typealias UsersUpdatedCallback = () -> Void
    typealias ErrorOccurredCallback = (Error) -> Void
    
    //MARK: - Bindable properties for UI updates
    var onUsersUpdated: UsersUpdatedCallback?
    var onErrorOccurred: ErrorOccurredCallback?
    

    
    //MARK: - Fetch users and update the UI
    func fetchUsers() {
        APIClient.shared.getUsers { [weak self] result in
            guard let self = self else { return }
            
            switch result {
            case .success(let users):
                self.users = users
                self.onUsersUpdated?()
                
            case .failure(let error):
                print("Error fetching users: \(error.localizedDescription)")
            }
        }
    }
}
