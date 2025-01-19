//
//  APIClient.swift
//  SevenApssExample
//
//  Created by TaylanBostanci on 19.01.2025.
//

import Foundation
import Alamofire

class APIClient {
    static let shared = APIClient()
    
    // MARK: - API Request with Alamofire Network
    func getUserRequest<T: Decodable>(urlString: String, completion: @escaping (Result<T, APIError>) -> Void) {
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
    
    // MARK: - DecodeResponseData
    func decodeResponseData<T: Decodable>(data: Data, type: T.Type) throws -> T {
        let decoder = JSONDecoder()
        decoder.keyDecodingStrategy = .convertFromSnakeCase
        return try decoder.decode(T.self, from: data)
    }
}


// MARK: - API Error Handling
enum APIError: Error {
    case invalidURL
    case noDataReceived
    case decodingFailed
    case networkError(String)
    
    var localizedDescription: String {
        switch self {
        case .invalidURL:
            return Constants.APIErors.invalidURL
        case .noDataReceived:
            return Constants.APIErors.noDataReceived
        case .decodingFailed:
            return Constants.APIErors.decodingFailed
        case .networkError(let message):
            return message
        }
    }
}
