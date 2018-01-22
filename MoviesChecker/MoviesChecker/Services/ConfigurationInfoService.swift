//
//  ConfigurationInfoService.swift
//  MoviesChecker
//
//  Created by Wagner Oliveira dos Santos on 21/01/18.
//  Copyright © 2018 Wagner Oliveira dos Santos. All rights reserved.
//

import Foundation
import Alamofire
import AlamofireObjectMapper

struct ConfigurationInfoService: Fecthable {
	typealias Data = ConfigurationInfo
	
	func fetch(url: String, callback: @escaping (Result<ConfigurationInfo>) -> ()) {
		Alamofire.request(ApiDefinition.getConfigurationsUrl()).validate(statusCode: 200..<300).validate(contentType: ["application/json"]).responseObject { (response: DataResponse<ConfigurationInfo>) in
			
			guard response.result.isSuccess else {
				debugPrint("Error while fetching configuration info: \(String(describing: response.result.error))")
				callback(Result.Failure(response.result.error!))
				return
			}
			
			if let config = response.result.value{
				callback(Result.Success(config))
			}
		}
	}
}
