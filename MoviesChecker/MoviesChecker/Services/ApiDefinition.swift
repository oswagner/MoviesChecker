//
//  ApiDefinition.swift
//  MoviesChecker
//
//  Created by Wagner Oliveira dos Santos on 21/01/18.
//  Copyright © 2018 Wagner Oliveira dos Santos. All rights reserved.
//
import UIKit
import Foundation

struct ApiDefinition {
	static private let baseUrl = "https://api.themoviedb.org/3/"
	static private let apiKeyParam = "?api_key=1f54bd990f1cdfb230adb312546d765d"
	
	static func getConfigurationsUrl() -> String {
		return baseUrl + "configuration" + apiKeyParam;
	}
	
	static func getUpcomingMovies(ForPage page:Int = 1) -> String {
		return baseUrl + "movie/upcoming" + apiKeyParam + "&page=\(page)"
	}
	
	static func getMovieDetailsBy(Id id: Int) -> String {
		return baseUrl + "movie/" + String(id) + apiKeyParam
	}
	
	static func getMoviesGenre() -> String {
		return baseUrl + "genre/movie/list" + apiKeyParam
	}
	
}
