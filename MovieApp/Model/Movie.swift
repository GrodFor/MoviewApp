//
//  Movie.swift
//  MovieApp
//
//  Created by Vladislav Sitsko on 06.10.2022.
//

import Foundation

struct MoviesList: Codable {
    var page: Int?
    var results: [Movie]?
    var totalPages: Int?
    var totalResults: Int?
    
    static func empty() -> MoviesList {
        return MoviesList(page: nil, results: nil, totalPages: nil, totalResults: nil)
    }
    
    enum CodingKeys: String, CodingKey {
        case page, results
        case totalPages = "total_pages"
        case totalResults = "total_results"
    }
}

struct Movie: Codable {
    var genreIds: [Int]?
    var id: Int?
    var originalTitle: String?
    var overview: String?
    var posterPath: String?
    var releaseDate: String?
    var title: String?
    var voteAverage: Double?
    var backdropPath: String?
    
    enum CodingKeys: String, CodingKey {
        case genreIds = "genre_ids"
        case originalTitle = "original_title"
        case posterPath = "poster_path"
        case releaseDate = "release_date"
        case voteAverage = "vote_average"
        case backdropPath = "backdrop_path"
        case id, overview, title
    }
    
    var genre: String? {
        let id = genreIds?.first
        switch id {
        case _ where id == 28:
            return "Action"
        case _ where id == 12:
            return "Adventure"
        case _ where id == 16:
            return "Animation"
        case _ where id == 35:
            return "Comedy"
        case _ where id == 80:
            return "Crime"
        case _ where id == 99:
            return "Documentary"
        case _ where id == 18:
            return "Drama"
        case _ where id == 10751:
            return "Family"
        case _ where id == 14:
            return "Fantasy"
        case _ where id == 36:
            return "History"
        case _ where id == 27:
            return "Horror"
        case _ where id == 10402:
            return "Music"
        case _ where id == 9648:
            return "Mystery"
        case _ where id == 10749:
            return "Romance"
        case _ where id == 878:
            return "Science Fiction"
        case _ where id == 10770:
            return "TV Movie"
        case _ where id == 53:
            return "Thriller"
        case _ where id == 10752:
            return "War"
        case _ where id == 37:
            return "Western"
        case _ where id == 10759:
            return "Action & Adventure"
        case _ where id == 10762:
            return "Kids"
        case _ where id == 10763:
            return "News"
        case _ where id == 10764:
            return "Reality"
        case _ where id == 10765:
            return "Sci-Fi & Fantasy"
        case _ where id == 10766:
            return "Soap"
        case _ where id == 10767:
            return "Talk"
        case _ where id == 10768:
            return "War & Politics "
        default:
            return .none
        }
    }
}
