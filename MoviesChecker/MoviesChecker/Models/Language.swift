//
//  Language.swift
//  MoviesChecker
//
//  Created by Wagner Oliveira dos Santos on 21/01/18.
//  Copyright © 2018 Wagner Oliveira dos Santos. All rights reserved.
//

import Foundation
import ObjectMapper

struct Language: Mappable {
	
	var id: String? // iso_639_1
	var name: String?
	
	
	init?(map: Map) { }
	
	mutating func mapping(map: Map) {
		id 		<- map["iso_639_1"]
		name 	<- map["name"]
	}
}
