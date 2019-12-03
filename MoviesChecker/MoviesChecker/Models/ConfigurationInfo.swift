//
//  ConfigurationInfo.swift
//  MoviesChecker
//
//  Created by Wagner Oliveira dos Santos on 21/01/18.
//  Copyright © 2018 Wagner Oliveira dos Santos. All rights reserved.
//

import Foundation
import ObjectMapper

struct ConfigurationInfo: Mappable {
	
	var imagesConf: ImagesConf?
	var changeKeys: [String]?
	
	init?(map: Map) { }
	
	mutating func mapping(map: Map) {
		imagesConf <- map["images"]
		changeKeys <- map["change_keys"]
	}
}
