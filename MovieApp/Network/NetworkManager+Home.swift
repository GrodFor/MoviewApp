//
//  NetworkManager+Home.swift
//  MovieApp
//
//  Created by Vladislav Sitsko on 06.10.2022.
//

import Foundation

protocol HomeNetworkManager {
    func requestTopRatedMovies(completion: @escaping((Result<MoviesList?, Error>) -> Void))
    func requestPopularMovies(completion: @escaping((Result<MoviesList?, Error>) -> Void))
}

extension NetworkManager: HomeNetworkManager {
    func requestTopRatedMovies(completion: @escaping((Result<MoviesList?, Error>) -> Void)) {
        let stingUrl = "\(Self.baseMovieDbUrl)/movie/top_rated?api_key=\(Self.moviewDbApiKey)&region=us"
        guard let url = URL(string: stingUrl) else { return }
        request(.init(url: url), completion: completion)
    }
    
    func requestPopularMovies(completion: @escaping((Result<MoviesList?, Error>) -> Void)) {
        let stingUrl = "\(Self.baseMovieDbUrl)/movie/popular?api_key=\(Self.moviewDbApiKey)&region=us"
        guard let url = URL(string: stingUrl) else { return }
        request(.init(url: url), completion: completion)
    }
}
