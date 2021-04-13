//
//  Movies.swift
//  DropViewer
//
//  Created by Ajaypal Singh on 11/4/21.
//

import Foundation

// MARK: - List
struct Movies: Codable {
    let title: String?
    let moviesList: [MoviesData]

    enum CodingKeys: String, CodingKey {
        case title
        case moviesList = "movies"
    }

    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.title = try container.decodeIfPresent(String.self, forKey: .title) ?? "N/A"
        self.moviesList = try container.decodeIfPresent(Array.self, forKey: .moviesList) ?? []
    }
}

// MARK: - Data
struct MoviesData: Codable {
    let title, imageUrl, releaseDate: String?
    let rating: Double?

    enum CodingKeys: String, CodingKey {
        case title
        case imageUrl = "imageHref"
        case releaseDate
        case rating
    }
    
    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.title = try container.decodeIfPresent(String.self, forKey: .title) ?? "N/A"
        self.imageUrl = try container.decodeIfPresent(String.self, forKey: .imageUrl) ?? "N/A"
        self.releaseDate = try container.decodeIfPresent(String.self, forKey: .releaseDate) ?? "N/A"
        self.rating = try container.decodeIfPresent(Double.self, forKey: .rating) ?? 0.0
    }
}
