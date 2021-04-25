//
//  ListCollectionViewController.swift
//  DropViewer
//
//  Created by Ajaypal Singh on 11/4/21.
//

import UIKit

private let reuseIdentifier = "listCell"

class MoviesListCollectionViewController: UICollectionViewController, UICollectionViewDelegateFlowLayout {

    @IBOutlet weak var loading: UIActivityIndicatorView!


    private var moviesViewModel = MoviesViewModel()
    var noOfCellsInRow = 3

    // Variable for passing data to detail View
    var movieCellModel: MoviesCellViewModel?

    override func viewDidLoad() {
        super.viewDidLoad()

        self.moviesViewModel.getMoviesData { [weak self] in
            DispatchQueue.main.async {
                self?.navigationItem.title = self?.moviesViewModel.title
                self?.loading.stopAnimating()
                self?.collectionView.reloadData()
            }
        }
        collectionView?.contentInsetAdjustmentBehavior = .always

    }


    // MARK: UICollectionViewDataSource

    override func numberOfSections(in collectionView: UICollectionView) -> Int {

        return 1
    }


    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return moviesViewModel.count
    }

    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: reuseIdentifier, for: indexPath) as? MoviesCollectionViewCell else {
            return UICollectionViewCell()
        }

        cell.moviesModel = moviesViewModel.cellViewModel(index: indexPath.row)

        return cell
    }

    // MARK: UICollectionViewCellSizeCalculation

    /* These two methods are used to handle cell size and numbers along with rotation logic*/

    func collectionView(_ collectionView: UICollectionView,
        layout collectionViewLayout: UICollectionViewLayout,
        sizeForItemAt indexPath: IndexPath) -> CGSize {

        let labelSize = 45
        let flowLayout = collectionViewLayout as! UICollectionViewFlowLayout
        let totalSpace = flowLayout.sectionInset.left
            + flowLayout.sectionInset.right
            + (flowLayout.minimumInteritemSpacing * CGFloat(noOfCellsInRow - 1))

        let size = Int((collectionView.bounds.width - totalSpace) / CGFloat(noOfCellsInRow))
        return CGSize(width: size, height: (size + labelSize))
    }

    override func traitCollectionDidChange(_ previousTraitCollection: UITraitCollection?) {
        super.traitCollectionDidChange(previousTraitCollection)
        noOfCellsInRow = (traitCollection.verticalSizeClass == .compact) ? 5 : 3
        collectionView.reloadData()
    }

    // MARK: UICollectionViewDelegate


    override func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        movieCellModel = moviesViewModel.cellViewModel(index: indexPath.row)
        self.performSegue(withIdentifier: "showDetails", sender: self)
    }

    // MARK: - Navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let destionationViewController = segue.destination as? MovieDetailsViewController {

            destionationViewController.movieDetails = movieCellModel
        }

    }
}
