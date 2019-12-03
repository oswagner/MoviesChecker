//
//  Movie.swift
//  MoviesChecker
//
//  Created by Wagner Oliveira dos Santos on 21/01/18.
//  Copyright © 2018 Wagner Oliveira dos Santos. All rights reserved.
//

import Foundation
import ObjectMapper


//Allowed Values: Rumored, Planned, In Production, Post Production, Released, Canceled
enum Status: String {
	case rumored 		= "Rumored"
	case planned 		= "Planned"
	case inProduction 	= "In Production"
	case postProduction = "Post Production"
	case released 		= "Released"
	case canceled 		= "Canceled"
}

struct Movie: Mappable {
	
	var id: Int?
	var title: String?
	var imdbId: String?
	var adult: Bool?
	var budget: Int?
	var genres: [Genre]?
	var homepage: String?
	var originalLanguage: String?
	var originalTitle: String?
	var overview: String?
	var popularity: Double?
	var releaseDate: Date?
	var revenue: Int?
	var runtime: Int?
	var status: Status?
	var tagline: String?
	var voteAverage: Double?
	var voteCount: Int?
	var productionCompanies: [ProductionCompanies]?
	var productionCountries: [ProductionCountries]?
	var spokenLanguages: [Language]?
	var backdropPath: String?
	var video: Bool?
	var posterPath: String?
	var belongsToCollection: [MovieCollection]?
	var genreIds: [Int]?
	
	
	init?(map: Map) { }
	
	let customDateTransform = TransformOf<Date, String >(fromJSON: {
		(value: String?) -> Date? in
		// transform value from String? to Date object
		let formatter = DateFormatter()
		formatter.dateFormat = "YYYY-MM-DD"
		return formatter.date(from: value!)
	}, toJSON: {
		(value: Date?) -> String? in
		// transform value from Date object to String?
		if let value = value {
		let formatter = DateFormatter()
			formatter.dateFormat = "YYYY-MM-DD"
			return formatter.string(from: value)
		}
		return ""
	} )
	
	mutating func mapping(map: Map) {
		id 					<- map["id"]
		title 				<- map["title"]
		imdbId 				<- map["imdb_id"]
		adult 				<- map["adult"]
		budget 				<- map["budget"]
		genres 				<- map["genres"]
		genreIds 			<- map["genre_ids"]
		homepage 			<- map["homepage"]
		originalLanguage 	<- map["original_language"]
		originalTitle 		<- map["original_title"]
		overview 			<- map["overview"]
		popularity 			<- map["popularity"]
		productionCompanies <- map["production_companies"]
		productionCountries <- map["production_countries"]
		releaseDate 		<- (map["release_date"], customDateTransform)
		revenue 			<- map["revenue"]
		runtime 			<- map["runtime"]
		status 				<- (map["status"],EnumTransform<Status>())
		tagline 			<- map["tagline"]
		voteAverage 		<- map["vote_average"]
		voteCount 			<- map["vote_count"]
		spokenLanguages 	<- map["spoken_languages"]
		video 				<- map["video"]
		backdropPath 		<- map["backdrop_path"]
		posterPath 			<- map["poster_path"]
		belongsToCollection <- map["belongs_to_collection"]
	}
}

extension Movie {
	func formatedDate() -> String {
		let formatter = DateFormatter()
		formatter.dateFormat = "MMM d, yyyy"
		return formatter.string(from: self.releaseDate!)
	}
}



