//
//  HomeViewModel.swift
//  MovieApp
//
//  Created by Vladislav Sitsko on 06.10.2022.
//

import Foundation

class HomeViewModel {
    private(set) var popularMovies = MoviesList.empty()
    private(set) var topRatedMovies = MoviesList.empty()
    
    private let networkManager: HomeNetworkManager
    
    init(networkManager: NetworkManager) {
        self.networkManager = networkManager
    }
    
    func updateHomeScreen(completion: @escaping ((Error?) -> Void)) {
        let group = DispatchGroup()
        
        var error: Error? = nil
        group.enter()
        requestPopularMovies {
            if error == nil { error = $0 }
            group.leave()
        }
        
        group.enter()
        requestTopRatedMovies {
            if error == nil { error = $0 }
            group.leave()
        }
        
        group.notify(queue: .main) {
            completion(error)
        }
    }
    
    private func requestPopularMovies(completion: @escaping ((Error?) -> Void)) {
        networkManager.requestPopularMovies { [weak self] result in
            guard let self = self else { return }
            switch result {
            case .success(let data):
                self.popularMovies = data ?? .empty()
                completion(.none)
            case .failure(let error):
                completion(error)
            }
        }
    }
    
    private func requestTopRatedMovies(completion: @escaping ((Error?) -> Void)) {
        networkManager.requestTopRatedMovies { [weak self] result in
            guard let self = self else { return }
            switch result {
            case .success(let data):
                self.topRatedMovies = data ?? .empty()
                completion(.none)
            case .failure(let error):
                completion(error)
            }
        }
    }
}
