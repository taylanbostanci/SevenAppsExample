//
//  UserRepository.swift
//  SevenApssExample
//
//  Created by TaylanBostanci on 19.01.2025.
//

import Foundation

final class UserRepository {
    
    // MARK: - Properties
    private let apiClient: APIClient
    
    // MARK: - Initializers
    init(apiClient: APIClient = APIClient()) {
        self.apiClient = apiClient
    }
    
    // MARK: - Fetching User Data from API
    func fetchUsers(completion: @escaping (Result<[UserResponseModel], APIError>) -> Void) {
        APIClient.shared.getUserRequest(urlString: Constants.Urls.baseURL + Constants.Urls.usersURL) { (result: Result<[UserResponseModel], APIError>) in
            switch result {
            case .success(let users):
                completion(.success(users))
            case .failure(let error):
                completion(.failure(error))
            }
        }
    }
}
