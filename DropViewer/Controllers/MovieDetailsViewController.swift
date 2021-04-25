//
//  MovieDetailsViewController.swift
//  DropViewer
//
//  Created by Ajaypal Singh on 12/4/21.
//

import UIKit

class MovieDetailsViewController: UIViewController {

    @IBOutlet weak var image: UIImageView!
    @IBOutlet weak var movieName: UILabel!
    @IBOutlet weak var rating: UILabel!
    @IBOutlet weak var released: UILabel!


    var movieDetails: MoviesCellViewModel?

    override func viewDidLoad() {
        super.viewDidLoad()

        navigationItem.title = "Details"
        updateUI()
    }

    func updateUI() {
        if let imageUrl = movieDetails?.imageUrl {
            image.downloaded(from: imageUrl)
        }

        movieName.text = movieDetails?.title
        rating.text = movieDetails?.rating
        released.text = movieDetails?.releaseDate
    }

}
