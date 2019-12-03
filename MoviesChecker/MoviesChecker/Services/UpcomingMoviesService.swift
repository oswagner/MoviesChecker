//
//  UpcomingMoviesService.swift
//  MoviesChecker
//
//  Created by Wagner Oliveira dos Santos on 22/01/18.
//  Copyright © 2018 Wagner Oliveira dos Santos. All rights reserved.
//

import Foundation
import Alamofire
import AlamofireObjectMapper

struct UpcomingMoviesService: Fecthable {
	typealias Data = UpcomingMovies
	
	func fetch(url: String, callback: @escaping (Result<UpcomingMovies>) -> ()) {
		Alamofire.request(url).validate(statusCode: 200..<300).validate(contentType: ["application/json"]).responseObject {
			(response: DataResponse<UpcomingMovies>) in
			
			guard response.result.isSuccess else {
				debugPrint("Error while fetching upcoming movies: \(String(describing: response.result.error))")
				callback(Result.Failure(response.result.error!))
				return
			}
			
			if let upcomingMovies = response.result.value {
				callback(Result.Success(upcomingMovies))
			}
		}
	}
}
