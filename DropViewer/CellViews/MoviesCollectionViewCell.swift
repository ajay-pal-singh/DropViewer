//
//  MoviesCollectionViewCell.swift
//  DropViewer
//
//  Created by Ajaypal Singh on 11/4/21.
//

import UIKit

class MoviesCollectionViewCell: UICollectionViewCell {

    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var textView: UILabel!

    public var moviesModel: MoviesCellViewModel? {
        didSet {
            guard let moviesModel = moviesModel else { return }
            textView.text = moviesModel.title
            imageView.image = nil
            
            if let imageUrl = moviesModel.imageUrl{
                imageView.downloaded(from: imageUrl)
            }
        }
    }
}
