//
//  SearchResponse.swift
//  Stock
//
//  Created by Konstantin Skrypak on 07.03.2024.
//

import Foundation

struct SearchResponse: Codable {
	let count: Int
	let result: [SearchResult]
}

struct SearchResult: Codable {
	let description: String
	let displaySymbol: String
	let symbol: String
	let type: String
}
