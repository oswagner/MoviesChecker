//
//  MovieCollection.swift
//  MoviesChecker
//
//  Created by Wagner Oliveira dos Santos on 21/01/18.
//  Copyright © 2018 Wagner Oliveira dos Santos. All rights reserved.
//

import Foundation
import ObjectMapper

struct MovieCollection: Mappable {
	var id: Int?
	var name: String?
	var backdropPath: String?
	var posterPath:String?
	
	
	init?(map: Map) { }
	
	mutating func mapping(map: Map) {
		id 				<- map["id"]
		name 			<- map["name"]
		posterPath 		<- map["poster_path"]
		backdropPath 	<- map["backdrop_path"]
	}
}

