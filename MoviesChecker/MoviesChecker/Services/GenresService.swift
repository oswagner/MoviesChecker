//
//  GenresService.swift
//  MoviesChecker
//
//  Created by Wagner Oliveira dos Santos on 21/01/18.
//  Copyright © 2018 Wagner Oliveira dos Santos. All rights reserved.
//

import Foundation
import Alamofire
import AlamofireObjectMapper

struct GenresService: Fecthable {
	
	typealias Data = Genres
	
	func fetch(url: String, callback: @escaping (Result<Genres>) -> ()) {
		Alamofire.request(url).validate(statusCode: 200..<300).validate(contentType: ["application/json"]).responseObject {
			(response: DataResponse<Genres>) in

			guard response.result.isSuccess else {
				debugPrint("Error while fetching genres: \(String(describing: response.result.error))")
				callback(Result.Failure(response.result.error!))
				return
			}

			if let genres = response.result.value {
				callback(Result.Success(genres))
			}
		}
	}
}
