//
//  UserRepository.swift
//  SevenApssExample
//
//  Created by ENQURA on 19.01.2025.
//

import Foundation

final class UserRepository {
    
    private let apiClient: APIClient
    
    init(apiClient: APIClient = APIClient()) {
        self.apiClient = apiClient
    }
    
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
