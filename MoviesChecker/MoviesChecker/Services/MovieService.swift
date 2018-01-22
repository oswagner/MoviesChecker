//
//  MovieService.swift
//  MoviesChecker
//
//  Created by Wagner Oliveira dos Santos on 22/01/18.
//  Copyright © 2018 Wagner Oliveira dos Santos. All rights reserved.
//

import Foundation
import Alamofire
import AlamofireObjectMapper

struct MovieService: Fecthable {
	typealias Data = Movie
	func fetch(url: String, callback: @escaping (Result<Movie>) -> ()) {
		Alamofire.request(url).validate(statusCode: 200..<300).validate(contentType: ["application/json"]).responseObject {
			(response: DataResponse<Movie>) in
			guard response.result.isSuccess else {
				debugPrint("Error while fetching movie: \(String(describing: response.result.error))")
				callback(Result.Failure(response.result.error!))
				return
			}
			
			if let movie = response.result.value {
				callback(Result.Success(movie))
			}
		}
	}
}
