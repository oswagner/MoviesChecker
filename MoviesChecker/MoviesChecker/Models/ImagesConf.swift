//
//  ImagesConf.swift
//  MoviesChecker
//
//  Created by Wagner Oliveira dos Santos on 21/01/18.
//  Copyright © 2018 Wagner Oliveira dos Santos. All rights reserved.
//

import Foundation
import ObjectMapper

struct ImagesConf: Mappable {
	
	var baseUrl : String?
	var secureBaseUrl : String?
	var backdropSizes : [String]?
	var logoSizes : [String]?
	var posterSizes : [String]?
	var profileSizes : [String]?
	var stillSizes : [String]?
	
	init?(map: Map) { }
	
	mutating func mapping(map: Map) {
		baseUrl 		<- map["base_url"]
		secureBaseUrl 	<- map["secure_base_url"]
		backdropSizes 	<- map["backdrop_sizes"]
		logoSizes 		<- map["logo_sizes"]
		posterSizes 	<- map["poster_sizes"]
		profileSizes 	<- map["profile_sizes"]
		stillSizes 		<- map["still_sizes"]
	}

}
