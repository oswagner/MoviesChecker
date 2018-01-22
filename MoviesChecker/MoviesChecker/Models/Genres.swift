//
//  Genres.swift
//  MoviesChecker
//
//  Created by Wagner Oliveira dos Santos on 21/01/18.
//  Copyright © 2018 Wagner Oliveira dos Santos. All rights reserved.
//

import Foundation
import ObjectMapper

struct Genres: Mappable {
	var genres: [Genre]?
	
	init?(map: Map) {
		
	}
	mutating func mapping(map: Map) {
		genres <- map["genres"]
	}
}
