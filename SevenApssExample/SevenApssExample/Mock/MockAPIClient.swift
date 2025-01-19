//
//  MockAPIClient.swift
//  SevenApssExample
//
//  Created by TaylanBostanci on 19.01.2025.
//

import Foundation

// MARK: - Mock APIClient
final class MockAPIClient: APIClient {
    
    var mockResult: Result<Data, APIError>?
    
    override func getUserRequest<T: Decodable>(urlString: String, completion: @escaping (Result<T, APIError>) -> Void) {
        if let mockResult = mockResult {
            switch mockResult {
            case .success(let data):
                do {
                    let decodedData = try JSONDecoder().decode(T.self, from: data)
                    completion(.success(decodedData))
                } catch {
                    completion(.failure(.decodingFailed))
                }
            case .failure(let error):
                completion(.failure(error))
            }
        } else {
            completion(.failure(.noDataReceived))
        }
    }
}
