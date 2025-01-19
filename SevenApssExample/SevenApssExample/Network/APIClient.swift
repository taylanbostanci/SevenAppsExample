//
//  APIClient.swift
//  SevenApssExample
//
//  Created by TaylanBostanci on 19.01.2025.
//

import Foundation
import Alamofire

// Define a NetworkManager class to handle network requests.
final class APIClient {
    
    // Shared instance for singleton pattern
    static let shared = APIClient()
    
    private init() {}
    
    // Method to perform a GET request for fetching users
    func getUsers(completion: @escaping (Result<[UserResponseModel], APIError>) -> Void) {
        guard let url = URL(string: Constants.Urls.baseURL + Constants.Urls.usersURL) else {
            completion(.failure(.invalidURL))
            return
        }
        
        AF.request(url).validate().responseData { response in
            switch response.result {
            case .success(let data):
                do {
                    let users = try self.decodeUsers(data: data)
                    completion(.success(users))
                } catch {
                    completion(.failure(.decodingFailed))
                }
                
            case .failure(let error):
                completion(.failure(.networkError(error.localizedDescription)))
            }
        }
    }
    
    // Helper function to decode the user data from JSON response
    private func decodeUsers(data: Data) throws -> [UserResponseModel] {
        let decoder = JSONDecoder()
        decoder.keyDecodingStrategy = .convertFromSnakeCase
        return try decoder.decode([UserResponseModel].self, from: data)
    }
    
    // Additional generic network request method (GET) that can be used for other endpoints
    func performGETRequest<T: Decodable>(urlString: String, completion: @escaping (Result<T, APIError>) -> Void) {
        guard let url = URL(string: urlString) else {
            completion(.failure(.invalidURL))
            return
        }
        
        AF.request(url).validate().responseData { response in
            switch response.result {
            case .success(let data):
                do {
                    let decodedData = try self.decodeResponseData(data: data, type: T.self)
                    completion(.success(decodedData))
                } catch {
                    completion(.failure(.decodingFailed))
                }
                
            case .failure(let error):
                completion(.failure(.networkError(error.localizedDescription)))
            }
        }
    }
    
    // Generic decoder for any type
    private func decodeResponseData<T: Decodable>(data: Data, type: T.Type) throws -> T {
        let decoder = JSONDecoder()
        decoder.keyDecodingStrategy = .convertFromSnakeCase
        return try decoder.decode(T.self, from: data)
    }
}

enum APIError: Error {
    case invalidURL
    case noDataReceived
    case decodingFailed
    case networkError(String)

    var localizedDescription: String {
        switch self {
        case .invalidURL:
            return "The URL provided is invalid."
        case .noDataReceived:
            return "No data was received from the server."
        case .decodingFailed:
            return "Failed to decode the response."
        case .networkError(let message):
            return message
        }
    }
}
