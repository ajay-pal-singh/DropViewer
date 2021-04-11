//
//  Movies.swift
//  DropViewer
//
//  Created by Ajaypal Singh on 11/4/21.
//

import Foundation

// MARK: - List
struct Movies: Decodable {
    let title: String?
    let moviesList: [MoviesData]
    
    enum CodingKeys: String, CodingKey {
        case title
        case moviesList = "movies"
    }
}

// MARK: - Data
struct MoviesData: Decodable {
    let title, imageUrl, releaseDate: String?
    let rating: Double?

    enum CodingKeys: String, CodingKey {
        case title
        case imageUrl = "imageHref"
        case releaseDate
        case rating
    }
}
