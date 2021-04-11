//
//  MoviesViewModel.swift
//  DropViewer
//
//  Created by Ajaypal Singh on 11/4/21.
//

import Foundation

class MoviesViewModel: NSObject {

    private let networkServices = NetworkServices()
    private var movies: Movies?


    func getMoviesData(completion: (() -> Void)?) {
        self.networkServices.getMoviesList { [weak self] (moviesData) in
            self?.movies = moviesData
            completion?()
        }
    }
    
    // Handling cell view data
    public func cellViewModel(index: Int) -> MoviesCellViewModel? {
          guard let movies = movies else { return nil }
        let moviesCellViewModel = MoviesCellViewModel(movieDetail: movies.moviesList[index])
          return moviesCellViewModel
      }

    public var count: Int {
        return movies?.moviesList.count ?? 0
    }
    
    public var title: String {
        return movies?.title ?? ""
       }
}
