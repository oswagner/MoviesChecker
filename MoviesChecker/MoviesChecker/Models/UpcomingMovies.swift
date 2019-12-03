//
//  UpcomingMovies.swift
//  MoviesChecker
//
//  Created by Wagner Oliveira dos Santos on 21/01/18.
//  Copyright © 2018 Wagner Oliveira dos Santos. All rights reserved.
//

import Foundation
import ObjectMapper

struct UpcomingMovies: Mappable {
	
	var page: Int?
	var movies: [Movie]?
	var maximum: Date?
	var minimum: Date?
	var totalPage: Int?
	var totalResults: Int?
	
	init?(map: Map) {	}
	
	mutating func mapping(map: Map) {
		page <- map["page"]
		movies <- map["results"]
		maximum <- (map["dates.maximum"], DateTransform())
		minimum <- (map["dates.minimum"], DateTransform())
		totalPage <- map["total_pages"]
		totalResults <- map["total_results"]
	}
}
