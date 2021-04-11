//
//  MoviesCellViewModel.swift
//  DropViewer
//
//  Created by Ajaypal Singh on 11/4/21.
//

import Foundation

class MoviesCellViewModel {
    
//    private let movies: Movies
    private let movieDetail: MoviesData
    
    init(movieDetail: MoviesData) {
           self.movieDetail = movieDetail
       }
    
    var title:String? {
        return movieDetail.title
    }
    
    var imageUrl:String? {
        return movieDetail.imageUrl
    }
    
}
