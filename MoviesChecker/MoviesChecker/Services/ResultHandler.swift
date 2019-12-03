//
//  ResultHandler.swift
//  MoviesChecker
//
//  Created by Wagner Oliveira dos Santos on 21/01/18.
//  Copyright © 2018 Wagner Oliveira dos Santos. All rights reserved.
//

import Foundation

enum Result<T> {
	case Success(T)
	case Failure(Error)
}

