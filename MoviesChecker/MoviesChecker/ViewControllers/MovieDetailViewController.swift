//
//  MovieDetailViewController.swift
//  MoviesChecker
//
//  Created by Wagner Oliveira dos Santos on 22/01/18.
//  Copyright © 2018 Wagner Oliveira dos Santos. All rights reserved.
//

import Foundation
import UIKit
import Kingfisher

class MovieDetailViewController: UIViewController {
	
	
	var movie: Movie?
	
	@IBOutlet weak var moviePoster: UIImageView!
	@IBOutlet weak var movieTitle: UILabel!
	@IBOutlet weak var releaseDate: UILabel!
	@IBOutlet weak var movieOverview: UILabel!
	@IBOutlet weak var genresList: UIStackView!
	
	
	
	override func viewDidLoad() {
		super.viewDidLoad()
		MovieService().fetch(url: ApiDefinition.getMovieDetailsBy(Id: movie!.id!)) {
			[unowned self] (result) in
			switch result {
			case .Success(let movie):
				for genre in movie.genres! {
					let label = UILabel()
					label.font = UIFont(name: "Avenir Next", size: 18)
					label.text = genre.name
					self.genresList.addArrangedSubview(label)
				}
				self.movie = movie
			case .Failure(_):
				break;
			}
		}
	}
	
	override func viewWillAppear(_ animated: Bool) {
		super.viewWillAppear(animated)
		movieTitle.text = movie?.title
		releaseDate.text = movie?.formatedDate()
		movieOverview.text = movie?.overview
		
		//TODO: could be refactored
		let placeholder = UIImage(named: "movie-placeholder")
		var url: URL?
		if let poster = movie!.posterPath {
			url = URL(string: "https://image.tmdb.org/t/p/original" + poster)
		} else if let backdrop = movie!.backdropPath {
			url = URL(string: "https://image.tmdb.org/t/p/w780" + backdrop)
		}
		moviePoster.kf.setImage(with: url, placeholder: placeholder, options: [.transition(.fade(2))], progressBlock: nil, completionHandler: {
			[unowned self] (image, error, cacheType, url) in
			if image == nil {
				self.moviePoster.image = placeholder
			}
		})
	}
	
	override func didReceiveMemoryWarning() {
		super.didReceiveMemoryWarning()
	}
}











