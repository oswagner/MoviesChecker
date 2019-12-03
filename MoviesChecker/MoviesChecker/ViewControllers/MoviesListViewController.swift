//
//  MoviesListViewController.swift
//  MoviesChecker
//
//  Created by Wagner Oliveira dos Santos on 21/01/18.
//  Copyright © 2018 Wagner Oliveira dos Santos. All rights reserved.
//

import UIKit
import Kingfisher

class MoviesListViewController: UIViewController {
	
	let moviesCellReuseIdentifier = "moviesCellReuseIdentifier"
	let movieDetailSegueId = "movieDetailSegueId"
	
	var configurationInfos: ConfigurationInfo?
	var genresList: Genres?
	
	var upcomingMovies: UpcomingMovies?
	
	var moviesList: [Movie] = [ ]
	
	let activityView = UIActivityIndicatorView(activityIndicatorStyle: .whiteLarge)

	
	@IBOutlet weak var moviesCollectionList: UICollectionView!

	override func viewDidLoad() {
		super.viewDidLoad()
		
		moviesCollectionList.register(UINib(nibName: "MoviesCustomCell", bundle: nil), forCellWithReuseIdentifier: moviesCellReuseIdentifier)
		let background = DispatchQueue.global()
		
		background.async { [unowned self] in
			GenresService().fetch(url: ApiDefinition.getMoviesGenre()) {
				(result) in
				switch result {
				case .Success(let genres):
					self.genresList = genres
					break;
				case .Failure(_):
					break;
				}
			}
		}
		
		UpcomingMoviesService().fetch(url: ApiDefinition.getUpcomingMovies()) {
			[unowned self] (result) in
			switch result {
			case .Success(let upcomingMovies):
				self.upcomingMovies = upcomingMovies
				self.moviesList.append(contentsOf: upcomingMovies.movies!)
				self.moviesCollectionList.reloadData()
			case .Failure(_):
				break;
			}
		}
		
	}

	override func didReceiveMemoryWarning() {
		super.didReceiveMemoryWarning()
		// Dispose of any resources that can be recreated.
	}
}

extension MoviesListViewController: UICollectionViewDelegate, UICollectionViewDataSource {
	func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
		return moviesList.count
	}
	
	func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
		let cell = collectionView.dequeueReusableCell(withReuseIdentifier: moviesCellReuseIdentifier, for: indexPath) as! MoviesCustomCell
		
		cell.title.text = " "
		cell.releaseDate.text = " "
		cell.genre.text = " "
		cell.vote.text = " "
		
		if self.upcomingMovies != nil {
			let movie = moviesList[indexPath.row]
			cell.title.text = movie.title!
			cell.vote.text = String(format: "\(movie.voteAverage!.description) %C", 0x2B50) // ⭐️
			cell.genre.text = ""
			
			if let genresList = genresList {
				cell.genre.text = genresList.genres?.first(where: { (genre) -> Bool in
					genre.id == movie.genreIds!.first
				})?.name
			}
			
			let formatter = DateFormatter()
			formatter.dateFormat = "MMM d, yyyy"
			cell.releaseDate.text = formatter.string(from: movie.releaseDate!)
			
			// TODO: change fix url
			var url: URL?
			if let backdrop = movie.backdropPath {
				url = URL(string: "https://image.tmdb.org/t/p/w780" + backdrop)
			} else if let poster = movie.posterPath {
				url = URL(string: "https://image.tmdb.org/t/p/w780" + poster)
			}
			
			let placeholder = UIImage(named: "movie-placeholder")
			cell.backdrop.kf.indicatorType = .activity
//			cell.backdrop.kf.setImage(with: url, placeholder: placeholder, options: [.transition(.fade(2))])
			
			cell.backdrop.kf.setImage(with: url, placeholder: placeholder, options: [.transition(.fade(2))], progressBlock: nil, completionHandler: { (image, error, cacheType, url) in
				if image == nil {
					cell.backdrop.image = placeholder
				}
			})
		}
		return cell
	}
	
	func collectionView(_ collectionView: UICollectionView, didEndDisplaying cell: UICollectionViewCell, forItemAt indexPath: IndexPath) {
		let cell = collectionView.dequeueReusableCell(withReuseIdentifier: moviesCellReuseIdentifier, for: indexPath) as! MoviesCustomCell
		cell.backdrop.kf.cancelDownloadTask()
	}
	
	func collectionView(_ collectionView: UICollectionView, willDisplay cell: UICollectionViewCell, forItemAt indexPath: IndexPath) {
		if indexPath.row == moviesList.count - 1 {
			updateNextSet()
		}
	}
	
	func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
		performSegue(withIdentifier: movieDetailSegueId, sender: moviesList[indexPath.row])
	}
	
	func updateNextSet() {
		//requests another set of data from the server.
		let currentPage = upcomingMovies!.page! < upcomingMovies!.totalPage! ?  upcomingMovies!.page! + 1 : upcomingMovies!.totalPage!
		
		UpcomingMoviesService().fetch(url: ApiDefinition.getUpcomingMovies(ForPage: currentPage )) {
			[unowned self] (result) in
			switch result {
			case .Success(let upcomingMovies):
				self.upcomingMovies = upcomingMovies
				self.moviesList.append(contentsOf: upcomingMovies.movies!)
				self.moviesCollectionList.reloadData()
			case .Failure(_):
				break;
			}
		}
	}
}

extension MoviesListViewController {
	override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
		if segue.identifier == movieDetailSegueId {
			let target = segue.destination as! MovieDetailViewController
			let movie = sender as! Movie
			target.movie = movie
		}
	}
}















