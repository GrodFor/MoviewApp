//
//  NetworkManager.swift
//  MovieApp
//
//  Created by Vladislav Sitsko on 06.10.2022.
//

import Foundation

class NetworkManager {
    
    // MARK: Constants
    static let rapidApiKey = "6d288a3c"
    static let moviewDbApiKey = "579cddf9290e2be18f29814a30c52cf0"
    static let baseMovieDbUrl = "https://api.themoviedb.org/3"
    static let baseOmDbwUrl = "https://www.omdbapi.com"
    
    private lazy var urlSession = URLSession.shared
    
    private var dataTask: URLSessionDataTask?
    
    // MARK: Basic data request
    func request<T>(
        _ urlRequest: URLRequest,
        queryParams: [String: Any]? = nil,
        completion: @escaping((Result<T?, Error>) -> Void)
    ) where T: Decodable {
        dataTask = urlSession.dataTask(with: urlRequest, completionHandler: { data, response, error in
            if let error = error {
                completion(.failure(error))
                return
            }
            
            if let responseData = data {
                do {
                    let decoded = try JSONDecoder().decode(T.self, from: responseData)
                    completion(.success(decoded))
                } catch(let decodeError) {
                    completion(.failure(decodeError))
                }
            } else {
                completion(.success(.none))
            }
        })
        
        dataTask?.resume()
    }
}
