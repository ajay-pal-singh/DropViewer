//
//  MoviesCellViewModel.swift
//  DropViewer
//
//  Created by Ajaypal Singh on 11/4/21.
//

import Foundation

class MoviesCellViewModel {
    
    // Handling each movie data
    
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
    
    var rating:String? {
        if let mRating = movieDetail.rating{
            return  String(mRating)
        }else{
            return "Not Available"
        }
    }
    
    var releaseDate:String? {
        return movieDetail.releaseDate
    }
    
}
